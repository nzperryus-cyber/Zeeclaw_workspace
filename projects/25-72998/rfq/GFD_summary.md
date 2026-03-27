# GFD Cell Summary - Roof Gluing Cell (Glass Roof)

## Cell Overview
- **Cell Type:** GFD (Glasdach) - Full-auto roof gluing cell with redundancy/integrated backup
- **Location:** Building A2, TechLine St. 7+8
- **Transport:** ETS skids on roller bed, stop-and-go mode, forward flow
- **Models:** V/X/Z267, V571, + 1 additional derivative
- **Key Feature:** Redundant design - 2 complete gluing/installation lines in one cell

## Process Flow
1. **Parts delivery:** AGV delivers roofs in foam cassettes on racks (stack of 7-8) to loading bays
2. **De-stacking:** 2 robots on shared 7th axis pick roof from rack → place on centering table
3. **Coincidence check:** 2D DMC code read, sends part # to PLUS for verification
4. **Centering:** Table auto-centers roof in X/Y, Z-support pre-adjusted
5. **Gluing:** Robot picks roof → applies adhesive at gluing tower (DA 217, ~5300mm bead)
6. **Car entry:** Vehicle moves in, lifted by eccentric lifters
7. **Measuring:** VMT robot measures 9 points on roof opening (X, Y, Z coordinates)
8. **Installation:** Robot places glued roof on car, compresses in 10 steps
9. **Verification:** Optional re-measure after installation

## Key Components (Contractor Scope)

### Section 1 - De-stacking
- 3x loading bays with rolling doors, laser sensors for fill height
- 2x KR210 de-stacking robots on shared linear axis (MBAG provision)
- 2x flexible picking grippers (carbon fiber, fiber tech)
- 2x 2D cameras for DMC reading
- 4x flexible centering tables

### Section 2 & 3 - Gluing/Installation (Redundant)
- 2x KR240 gluing robots (MBAG provision)
- 2x KR240 installation robots (MBAG provision)
- 2x KR210 measuring robots (MBAG provision)
- 2x VMT measuring systems (sense & place)
- 2x gluing towers (fixed height, 2 dosers each)
- 2x INTEC-Sames gluing systems (DBP, doser, application heads)
- 4x centering tables
- 4x kick-out carts
- 6x process grippers with tool changers
- 4x tool stands (2 grippers each)
- Eccentric lifters (one per side of car)
- Optional: locator pins for skid fixation

## Adhesive
- **Type:** DA 217 (EfBond)
- **Part #:** A0009896171
- **Application:** Heated
- **Bead:** 12mm wide x 5mm height
- **Glue length:** ~5300mm (V267/V571), ~5800mm (X/Z267)

## Tolerances
- X-Position: +/- 0.75mm, cpk 1.0
- Y-Position: +/- 0.75mm, cpk 1.0
- Z-Position: on spacer

## Cycle Time
- Shop output: 43 JPH
- Tact time: 83 sec
- Equipment cycle: 67 sec
- Capacity: ~940 units/day
- Operation: up to 3 shifts, 5-6 days/week
- Conveyor availability: >99.5%

## Technological Availability
- 98.5% over 10 days (stabilized production)

## Backup Strategy
- If robot/gripper fails → use second cell
- If both cells down → manual backup with assist device
- Kick-out cart for rework without production number

## Failure Scenarios
1. **UBISENSE/Scanner failure** → Manual entry via NextPN
2. **2D code/NOK** → Show-me position, worker visual inspection + chip login
3. **Centering fault** → Auto-recenter, then error if still NOK
4. **Gripper vacuum failure** → Stop, analyze, use backup cell
5. **Adhesive NOK** → Show-me position, Euchner key required for OK release
6. **Measuring system failure** → Re-measure up to 3x, then backup or avg values
7. **De-stacking robot fault** → Park on linear axis, second robot takes over

## Interfaces
- **PLUS System:** UBISENSE body tracking, coincidence check, Q-protocol for quality docs
- **Conveyor:** ETS skids, roller bed, stop-and-go, ~300mm height
- **Power:** 480V/60Hz → 400V transformer, 3x bus plugs
- **Pneumatics:** 6 bar, ball valve interface
- **Environment:** 65-75°F, 30-55% humidity
- **Network:** Fiber optic to MBAG switch

## Milestones (V267)
| Milestone | Date |
|-----------|------|
| Design Release | 07/31/2026 |
| VIBN Release | 01/15/2027 |
| Dispatch Release | 04/15/2027 |
| Start Installation | 05/15/2027 |
| Power On | 06/15/2027 |
| Technical Release | 10/30/2028 |
| Quality Release | 01/26/2029 |
| Final Acceptance | 03/15/2030 |

## Production Support
- S-Lot 2: 14 days, 2 shifts, 4 employees/shift
- S-Lot 3: 14 days, 2 shifts, 2 employees/shift
- S-Lot 4: 14 days, 2 shifts, 2 employees/shift

## Key Requirements
- Integra Wave 7.1 mandatory
- CAD: Siemens NX (CTRNext)
- Documentation: SLE, DEEP portal
- Training: English docs, national language for operators
- No subcontracting without written MBAG approval
- DDP Incoterms - all imports duty paid by contractor

## Contacts
- Rafael Bickel (PGL Trim Planning): +1 205 246 6387
- Oliver Eckert (Equipment Planning): +49 160 861 2976
- Andreas Breitling (Equip. Planning MBUSI): +1 205 546 6912

## Files
- Source: `000_B2.401_GFD_Cell_MBEAL_V01.05.pdf` (51 pages)