# BDH Cell Summary - Rear Roof Cover (Blende Dach Hinten)

## Cell Overview
- **Cell Type:** BDH - Rear roof cover gluing cell
- **Location:** Building A2, TechLine St. 17+18
- **Transport:** ETS skids on roller bed, stop-and-go mode, forward flow
- **Models:** V/X/Z267, V571, future derivative
- **Process:** Fully automated with manual back-up station

## Process Flow
1. Worker places BDH on conveyor belt load carrier station from JIS/AGV delivery
2. De-stacking robot picks BDH → places on centering drawer
3. Coincidence check via 2D DMC code (UBISENSE/PLUS)
4. Gluing robot applies adhesive (7th axis rotation)
5. Measuring robot (VMT Sense&Place) measures body position
6. Gluing/assembly robot assembles BDH to body
7. Verification check (optional re-measure)

## Key Components (Contractor Scope)
- **De-stacking robot:** KR210 R3100-2 (MBAG provision)
- **Gluing/assembly robot:** KR210 R3100-2 (MBAG provision)
- **Measuring robot:** KR210 R3100-2 (MBAG provision)
- **Gluing system:** INTEC-Sames double barrel pump, 1K-PU, heated to 45°C
- **Centering drawer:** Pneumatic X/Y centering with kick-in/kick-out
- **Tool changer:** 3 grippers + 1 for derivative
- **3x assembling frames** with storage tables for manual back-up
- **Conveyor belt** with load carrier station

## Adhesive
- **Type:** EFBond UA268 (EfTec)
- **Part #:** A 000 989 5702
- **Application temp:** ~45°C (heated)
- **Bead dimensions:** 12mm wide x 5mm height
- **Glue length:** ~3000mm per part

## Tolerances
- X-Position: +/- 0.75mm, cpk 1.0
- Y-Position: +/- 0.75mm, cpk 1.0
- Z-Position: on spacer

## Cycle Time
- Shop output: 43 JPH
- Tact time: 83 sec
- Equipment cycle time: 67 sec
- Capacity: ~940 units/day
- Operation: 3 shifts, 5-6 days/week

## Backup Strategy
Manual back-up station with:
- 3x assembling frames (one per derivative)
- Manual gluing with cartridge
- 2-worker process for installation

## Failure Scenarios
1. **Ubisense/PLUS fault** → NextPN function or manual entry
2. **Coincidence check failure** → Manual verification, "application without coincidence" option
3. **Robot/gripper fault** → Manual back-up station
4. **Glue parameters NOK** → Show-me position, operator confirms OK/NOK
5. **Measuring system failure** → Re-measure 3x, then manual back-up

## Interfaces
- **PLUS System:** Vehicle data via UBISENSE, coincidence check, Q-protocol
- **Conveyor:** ETS skids, stop-and-go, ~300mm height
- **Power:** 480V/60Hz → 400V transformer
- **Pneumatics:** 6 bar, ball valve interface
- **Temp:** 65-75°F, Humidity: 30-55%

## Milestones (V267)
| Milestone | Date |
|-----------|------|
| Design Release | 07/31/2026 |
| VIBN Release | 01/15/2027 |
| Dispatch Release | 04/15/2027 |
| Start Installation | 06/15/2027 |
| Power On | 10/15/2027 |
| Technical Release | 10/30/2028 |
| Quality Release | 01/26/2029 |
| Final Acceptance | 03/15/2030 |

## Files
- Source: `000_B2.401_BDH_Cell_MBEAL_V01.06.pdf` (70 pages)