# FLY Gemini V3 - Klipper Firmware Flashing Instructions

## Overview
Instructions for compiling and flashing Klipper firmware to the FLY Gemini V3 mainboard with USB to CAN bridge configuration.

**Source:** https://mellow-3d.github.io/fly-gemini_v3_klipper_usbtocan.html

---

## Menuconfig Settings

When running `make menuconfig`, use these exact settings:

```
[*] Enable extra low-level configuration options
    Micro-controller Architecture (STMicroelectronics STM32)  --->
    Processor model (STM32F405)  --->
    Bootloader offset (32KiB bootloader)  --->
    Clock Reference (8 MHz crystal)  --->
    Communication interface (USB to CAN bus bridge (USB on PA11/PA12))  --->
    CAN bus interface (CAN bus (on PB8/PB9))  --->
    USB ids  --->
(1000000) CAN bus speed
()  GPIO pins to set at micro-controller startup
```

**Key Settings:**
- **Microcontroller:** STMicroelectronics STM32
- **Processor Model:** STM32F405
- **Bootloader offset:** 32 KiB bootloader (0x8000)
- **Clock Reference:** 8 MHz crystal
- **Communication Interface:** USB to CAN bus bridge (USB on PA11/PA12)
- **CAN bus interface:** CAN bus (on PB8/PB9)
- **CAN bus speed:** 1000000

---

## Compilation Steps

1. **Navigate to Klipper directory:**
   ```bash
   cd ~/klipper
   ```

2. **Clean previous builds:**
   ```bash
   make clean
   ```

3. **Configure firmware:**
   ```bash
   make menuconfig
   ```
   Apply the settings listed above, then save and exit.

4. **Compile firmware:**
   ```bash
   make -j4
   ```

5. **Verify output:**
   The compiled binary will be at `~/klipper/out/klipper.bin`

---

## Flashing Procedure

### Method 1: Using geminiv3-flash Script (Recommended)

1. **Download the flashing script:**
   ```bash
   sudo wget https://cdn.mellow.klipper.cn/shell/geminiv3-flash -O /usr/bin/geminiv3-flash
   sudo chmod +x /usr/bin/geminiv3-flash
   ```

2. **Remove boot jumpers:**
   - Remove any boot0 and boot1 jumpers currently installed

3. **Flash the firmware:**
   ```bash
   sudo geminiv3-flash
   ```

4. **Install boot1 jumper:**
   - Place boot1 jumper on boot1 and GND pins
   - This ensures the MCU boots into Klipper firmware

5. **Reboot:**
   ```bash
   sudo reboot
   ```

### Method 2: Manual DFU Flash

1. **Enter DFU mode:**
   - Press and hold the BOOT button
   - Press and release the RESET button
   - Release the BOOT button

2. **Verify DFU mode:**
   ```bash
   dfu-util -l
   ```
   Should show device `[0483:df11]`

3. **Flash firmware:**
   ```bash
   cd ~/klipper
   make flash FLASH_DEVICE=0483:df11
   ```

4. **Reset the board:**
   - Press the RESET button or power cycle

---

## Verification

After flashing and rebooting:

1. **Check USB device:**
   ```bash
   lsusb | grep Klipper
   ```

2. **Check CAN interface:**
   ```bash
   ip link show can0
   ```

3. **Verify Klipper connection:**
   Check Moonraker/Mainsail interface for successful MCU connection

---

## Troubleshooting

### Board won't enter DFU mode
- Ensure boot0 and boot1 jumpers are removed
- Try the button sequence again (hold BOOT, tap RESET, release BOOT)

### Flash fails
- Check USB cable connection
- Verify DFU mode with `dfu-util -l`
- Try `sudo geminiv3-flash` instead of manual method

### Board won't boot after flash
- Verify boot1 jumper is installed on boot1 and GND
- Check that bootloader offset is 32KiB (0x8000)
- Power cycle the board

---

## Firmware Archive Process

When creating firmware archives:

1. **Before compiling:**
   ```bash
   cp ~/klipper/.config ~/firmware_backups/fly_gemini_v3_config_$(date +%Y%m%d_%H%M%S).txt
   ```

2. **After compiling:**
   ```bash
   cp ~/klipper/out/klipper.bin ~/firmware_backups/fly_gemini_v3_firmware_$(date +%Y%m%d_%H%M%S).bin
   ```

---

## Notes

- The FLY Gemini V3 uses an STM32F405 chip with 8MHz crystal
- USB-to-CAN bridge allows the board to act as a CAN bus interface
- CAN bus speed is set to 1000000 (1 Mbit/s)
- Bootloader offset of 32KiB allows DFU flashing via USB
- Boot1 jumper must be installed for normal operation
