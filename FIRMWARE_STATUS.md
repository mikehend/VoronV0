# Voron V0 Firmware Status

**Last Updated**: 2025-12-06

## Klipper Host Software
- **Version**: v0.13.0-419-g2e5802370-dirty
- **Location**: ~/klipper on the printer
- **Status**: Running and stable

## MCU Firmware Versions

| MCU | Hardware | Serial/Path | Firmware Version | Status |
|-----|----------|-------------|------------------|--------|
| **mcu** | Fly Gemini v3 (STM32F405xx) | `usb-Klipper_stm32f405xx_5B0030001651313333363337-if00` | v0.13.0-419-g2e5802370 | Current |
| **host** | Linux Host MCU | `/tmp/klipper_host_mcu` | v0.13.0-419-g2e5802370 | Current |
| **expander** | Klipper Expander (STM32F042x6) | `platform-1c1d000.usb-usb-0:1.2:1.0` | v0.13.0-419-g2e5802370 | Current |
| **display** | V0Display (STM32F042x6) | `platform-1c1c400.usb-usb-0:1:1.0` | v0.12.0-99-g5e3daa6f2 | Old version |

## USB Serial Device Mapping

1. `usb-Klipper_stm32f405xx_5B0030001651313333363337-if00` → **Main Board (Fly Gemini v3)**
2. `usb-Klipper_stm32f042x6_1A001200124330534E373720-if00` → **V0Display**
3. `usb-Klipper_stm32f042x6_280022001843304846333520-if00` → **Klipper Expander**

## Notes

- **V0Display is running older firmware (v0.12.0) while other MCUs are on v0.13.0**
- **System is currently working and stable - DO NOT update firmware**
- Version mismatch between display and other MCUs is noted but not causing issues
- If firmware updates are needed in the future, follow official documentation carefully

## Verification Command

To check MCU versions in the future:
```bash
ssh fly@192.168.4.127 "tail -2000 ~/printer_data/logs/klippy.log | grep -E '(Loaded MCU)'"
```
