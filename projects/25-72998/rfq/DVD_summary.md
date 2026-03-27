# DVD Cell Summary - Door Window Gluing

## Cell Overview
- **Cell Type:** DVD (Dach Verkleidung Drehfenster) - Door window gluing
- **Location:** Building A2, TechLine St. 4
- **Transport:** ETS skids on roller bed conveyor, stop-and-go mode
- **Models:** V/X/Z267, V571, aluminum solid roof

## Process Flow
1. DVDs delivered in bins, manually loaded into magazines
2. De-stacking robot picks DVD → places on centering fixture
3. Vehicle identification via barcode scanner (B-pillar) → PLUS system sends part number
4. Turntable rotates to gluing position
5. 2x gluing robots apply adhesive simultaneously (robot-guided)
6. Turntable rotates to assembly position
7. TM (assist device) removes roof from car, places on fixture
8. Vacuum compresses DVD pads to roof
9. TM returns roof + DVD to car via AGV

## Key Components (Contractor Scope)
- **De-stacking robot:** KR210 (MBAG provision)
- **2x Gluing robots:** KR22 (MBAG provision)
- **Turntable:** 2 flexible fixture tables with vacuum function
- **2x Magazines:** sliding doors, laser sensors for fill height
- **Gluing system:** 1x DBP (double barrel pump), 2x doser, 2x twin heads (Intec-Sames)
- **Backup cell:** Standalone compact cell with robot, gluing system, drawers
- **Scanner:** Barcode reader for vehicle identification

## Adhesive
- **Type:** EFBond UA421 (EfTec)
- **Part #:** A0129898871
- **Glue length:** ~18600mm (V267), ~8100mm (V571)
- **Bead:** ~4-5mm inside, 5-6mm outside (round bead)

## Cycle Time
- Shop output: 43 JPH
- Tact time: 83 sec
- Equipment cycle: 67 sec
- Capacity: ~940 units/day
- Operation: 3 shifts, 5-6 days/week
- Conveyor availability: >99.5%

## Tolerances
- Position: +/- 0.75mm, cpk 1.0

## Backup Strategy
- Standalone backup cell with:
  - 1x gluing robot (KR22)
  - 1x SBP (single barrel pump)
  - 2 drawers with suction/fixation
  - Macrolon housing

## Failure Scenarios
1. **Scanner/PLUS failure** → Manual PN entry via NextPN
2. **Gripper vacuum failure** → Stop, analyze, use backup if needed
3. **Adhesive NOK** → Operator inspects, confirms OK/NOK (Euchner key required)
4. **Glue open timer NOK** → Remove pads, restart
5. **Robot/table failure** → Use backup cell

## Interfaces
- **PLUS:** UBISENSE body tracking, coincidence check, Q-protocol
- **Conveyor:** ETS skids, roller bed, stop-and-go, ~300mm height
- **Power:** 480V/60Hz → 400V transformer
- **Pneumatics:** 6 bar, ball valve interface
- **Environment:** 65-75°F, 30-55% humidity

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

## Modification Timeslots
- Summer 2027: ~3 weeks, end of June
- Winter 2027/28: ~3-4 weeks, end of December

## Files
- Source: `000_B2.401_DVD_Cell_MBEAL_V01.04.pdf` (43 pages)