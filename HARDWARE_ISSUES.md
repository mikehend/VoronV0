# Hardware Issues and Maintenance - Voron V0

## Completed Repairs

### ✅ Bed Thermal Fuse Replacement - 2025-12-06
**Issue**: Required thermal fuse installation for bed safety
**Resolution**:
- Installed 3.33mm OD ferrule-equipped thermal fuse
- Crimped with Pressmaster ferrule crimper (2.5mm slot)
- Secured with zip tie to ensure contact with bed bottom
- Tested successfully: heated to 105°C and maintained stable
- Heater control verified working correctly

**Status**: COMPLETE - Bed heater operational and safe

### ✅ Old Toolhead Removal - 2025-12-06
**Status**: Original toolhead removed, ready for Dragon Burner upgrade

## Open Issues

### Dead 120mm Aux Fan

**Date Identified**: 2025-12-06

**Symptom**: 120mm auxiliary cooling fan not spinning

**Troubleshooting Performed**:
1. ✅ Verified PWM signal good at expander board (PA0)
2. ✅ Verified other fans on expander work correctly (Nevermore on PA1/PA2)
3. ✅ Verified cable properly connected to expander board
4. ✅ Tested fan with external 24V supply - still doesn't spin
5. ✅ Verified 24V present at back of fan connector
6. ✅ Measured fan resistance: infinite (open circuit - confirmed dead)

**Conclusion**: Fan motor is dead - needs replacement

**Configuration Status**:
- Fan control is configured in [KlipperExpander.cfg](Config/KlipperExpander.cfg) as `[fan_generic AuxCooling]` on pin `expander:PA0`
- Software control is working correctly
- Once replacement fan is installed, it should work immediately (plug and play)

**Replacement Needed**: 120mm 24V fan for auxiliary cooling
