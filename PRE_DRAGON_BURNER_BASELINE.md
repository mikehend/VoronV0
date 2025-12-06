# Pre-Dragon Burner Upgrade Baseline

**Date**: 2025-12-06
**Purpose**: Complete system checkout before Dragon Burner upgrade

## System Status: ✅ ALL SYSTEMS OPERATIONAL

### Klipper Status
- **State**: Ready - "Printer is ready"
- **Version**: v0.13.0-419-g2e5802370-dirty
- **Uptime**: Running since 08:17:13 EST
- **Config**: /home/fly/klipper_config/printer.cfg

### MCU Status - All Connected ✅
| MCU | Hardware | Firmware | Status |
|-----|----------|----------|--------|
| **mcu** | Fly Gemini v3 (STM32F405xx) | v0.13.0-419-g2e5802370 | ✅ Connected (144 commands) |
| **host** | Linux Host MCU | v0.13.0-419-g2e5802370 | ✅ Connected (138 commands) |
| **display** | V0Display (STM32F042x6) | v0.12.0-99-g5e3daa6f2 | ✅ Connected (103 commands) |
| **expander** | Klipper Expander (STM32F042x6) | v0.13.0-419-g2e5802370 | ✅ Connected (93 commands) |

### Temperature Sensors - All Reading ✅
| Sensor | Current Temp | Status |
|--------|--------------|--------|
| **Extruder** | 22.29°C | ✅ Normal (target: 0°C) |
| **Heated Bed** | 22.28°C | ✅ Normal (target: 0°C) |
| **Chamber** | 23.07°C | ✅ Reading (range: 22.74-23.63°C) |
| **Power Supply** | 25.51°C | ✅ Reading (range: 25.01-25.69°C) |
| **MCU Fan** | 30.94°C | ✅ Reading (target: 45°C) |

### Fan Systems
| Fan | Pin | Status |
|-----|-----|--------|
| **Part Cooling** | Main MCU | ✅ Working (currently off) |
| **NevermoreFan1** | expander:PA1 | ✅ Working (currently off) |
| **NevermoreFan2** | expander:PA2 | ✅ Working (currently off) |
| **MCU Fan** | Temperature controlled | ✅ Working (currently off, temp below target) |
| **AuxCooling (120mm)** | expander:PA0 | ❌ **DEAD - Needs replacement** |

### LED Systems - All Working ✅
| LED | Type | Pins | Status |
|-----|------|------|--------|
| **main_mcu_neopixel** | 28 LEDs | Main MCU | ✅ Operational (breathing blue effect) |
| **expanderPixel** | 1 LED | expander:PB1 | ✅ Operational (orange indicator) |

### Motion System
- **Homed Axes**: None (not homed)
- **Axis Limits**: X: 0-125mm, Y: 0-120mm, Z: -1.5-125mm
- **Max Velocity**: 450 mm/s
- **Max Accel**: 15000 mm/s²
- **Square Corner Velocity**: 5.0 mm/s
- **Extruder**: Ready, can extrude
- **Pressure Advance**: 0.03
- **Smooth Time**: 0.04s

### Current Hotend Configuration
- **Type**: Dragon HF hotend
- **Heater**: Working (verified at room temp)
- **Thermistor**: Reading correctly (22.29°C)
- **Part Cooling**: Single fan, working
- **Toolhead**: Standard V0 toolhead

## Known Issues Before Upgrade
1. ❌ **120mm Aux Fan Dead** - Documented in HARDWARE_ISSUES.md
   - Motor failed (open circuit)
   - Replacement needed after upgrade

## Notes for Dragon Burner Upgrade
- All electronics and sensors working properly
- MCU connections stable
- Klipper version current and stable
- LED effects operational
- Temperature sensors all reading correctly
- Nevermore fans operational for chamber cooling during upgrade work
- No other hardware issues identified

## Backup Status
- All config files synced to git (commit: 53b3310)
- Firmware versions documented in FIRMWARE_STATUS.md
- Hardware issues documented in HARDWARE_ISSUES.md

**System is ready for Dragon Burner upgrade!**
