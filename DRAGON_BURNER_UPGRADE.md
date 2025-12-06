# Dragon Burner Upgrade - Voron V0

**Date**: 2025-12-06
**Status**: Hardware Installation Complete - Ready for Calibration

## Completed Tasks

### ✅ Hardware Installation
- Dragon Burner toolhead physically installed
- EBB36 CAN toolhead board mounted and wired
- Zeroclick probe installed (2-wire, signal to PB8 + GND)
- Part cooling fans wired to PA0
- Hotend fan wired to PA1 (auto-controlled at 50°C)
- Toolhead RGB LEDs wired to PD3 (9 LEDs: 2 sequins + 7 Rainbow Barf)
- All wiring verified and tested

### ✅ CAN Bus Configuration
- Mainboard firmware reflashed as USB-CAN bridge
- EBB36 firmware flashed for CAN communication
- CAN termination verified (120Ω on both ends, 60Ω measured)
- CAN bus operational with both devices detected:
  - Mainboard UUID: 85c6368d1d27
  - EBB36 UUID: 2297f6a8128a

### ✅ Klipper Configuration
- Created EBB36.cfg with complete toolhead configuration
- Moved extruder configuration from mainboard to EBB36
- Configured fans (part cooling + hotend fan)
- Configured Zeroclick probe on PB8 with pullup
- Configured toolhead LEDs with effects and macros
- Removed obsolete HE-LED configuration
- All MCUs connected and operational

### ✅ LED Configuration
- Toolhead_Lights configured (9 LEDs)
- LED effects created: idle, printing, heating, error, rainbow
- Macros created: TOOLHEAD_IDLE, TOOLHEAD_PRINTING, TOOLHEAD_HEATING, TOOLHEAD_ERROR, TOOLHEAD_RAINBOW, TOOLHEAD_OFF
- Default startup: lights off (no breathing effects on CAN bus)

### ✅ System Validation
- Klipper state: Ready
- All MCUs connected: mcu, host, EBBCan, display, expander
- Extruder temperature reading correctly
- Fans operational and tested
- CAN bus stable with no errors

## Pending Calibration Tasks

### 1. Z-Offset Calibration (NEXT STEP)
**Current Status**: z_offset set to 0 (placeholder)
**Required**: Calibrate proper Z-offset for Zeroclick probe

**Process**:
1. Home all axes
2. Move to center of bed
3. Use paper test to set Z=0 at nozzle touching bed
4. Deploy probe and measure offset
5. Update z_offset in EBB36.cfg

### 2. Extruder Calibration
**Current Status**: rotation_distance = 33.500 (from sample config)
**Required**: Calibrate for Orbiter extruder

**Process**:
1. Heat hotend to printing temperature
2. Mark filament at 120mm from extruder
3. Extrude 100mm
4. Measure actual distance extruded
5. Calculate new rotation_distance
6. Update EBB36.cfg

### 3. PID Tuning
**Current Status**: Using sample PID values
- pid_Kp: 21.527
- pid_Ki: 1.063
- pid_Kd: 108.982

**Required**: Tune for Dragon HF hotend

**Process**:
1. Run PID_CALIBRATE HEATER=extruder TARGET=240
2. Save results with SAVE_CONFIG
3. Verify stable temperature control

### 4. First Layer Calibration
**Required**: Fine-tune first layer height and squish

**Process**:
1. Print first layer test pattern
2. Adjust z_offset as needed
3. Verify proper bed adhesion

### 5. Pressure Advance Calibration
**Current Status**: pressure_advance not set in EBB36.cfg (commented out in old config: 0.03)
**Required**: Calibrate for Orbiter + Dragon HF combination

**Process**:
1. Print pressure advance test pattern
2. Identify optimal value
3. Add to EBB36.cfg extruder section

## Hardware Notes

### Extruder
- Type: Orbiter v2.0
- Gear ratio: Uses rotation_distance (not gear_ratio in config)
- Current: 0.650A
- Driver: TMC2209 on EBB36

### Hotend
- Type: Dragon HF
- Max temp: 270°C
- Thermistor: EPCOS 100K B57560G104F
- Hotend fan: Auto-controlled at 50°C threshold

### Probe
- Type: Zeroclick
- Connection: 2-wire (signal + GND)
- Pin: ^EBB36:PB8 (with pullup)
- Samples: 3 (median)
- Speed: 5 mm/s

### Fans
- Part cooling: EBB36:PA0
- Hotend fan: EBB36:PA1 (temperature controlled)

## Known Issues

### Dead 120mm Aux Fan
- Not related to Dragon Burner upgrade
- See HARDWARE_ISSUES.md for details
- Replacement needed

## Configuration Files

### Primary Config Files
- [printer.cfg](Config/printer.cfg) - Main config with includes
- [EBB36.cfg](Config/EBB36.cfg) - Complete toolhead configuration
- [MyMainboard.cfg](Config/MyMainboard.cfg) - Mainboard with old configs commented out

### Backup
- Pre-upgrade baseline: PRE_DRAGON_BURNER_BASELINE.md
- All configs synced to git before upgrade started

## Next Step

**START Z-OFFSET CALIBRATION**
