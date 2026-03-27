# FSS/BU-Cell Summary - Front/Rear Side Window, Windshield, Backup Cell

## Cell Overview
- **Cell Type:** 2 semi-automated bonding cells (BU and FSS) for Front Side Windows (FSS), Windshields (WSS), Rear Side Windows (RWTS)
- **Location:** Building A2, Trim 4 St. 2+4
- **Transport:** Skillet conveyor, backward flow, stop-and-go mode
- **Models:** V/X/Z267, V571 + legacy V/X/C/Z167 (overlap ~2 years)

## Process Flow

### BU Cell (Backup Capable)
1. Worker places component on kick-in table (FSS, WSS, or RWTS)
2. Centering via PINs (FSS) or displacement sensor (WSS/RWTS)
3. Robot picks component → coincidence check via 2D DMC code
4. Robot moves to camera for final coincidence check
5. Gluing at stationary tower with 7th axis rotation
6. Component placed in kick-out table → 20min glue open time

### FSS Cell (Standard)
Same flow as BU, without the WSS/RWTS centering table

## Key Components (Contractor Scope)
- **2x Gluing robots:** KR210 R3100-2 Quantec (MBAG provision)
- **2x Flex grippers:** 6 suction cups for FSS, ~6 for WSS/RWTS
- **2x Gluing towers:** Stationary with 7th axis rotation
- **2x Kick-in tables:** FSS with PIN centering, WSS/RWTS with displacement sensor
- **2x Kick-out tables:** For all component types
- **2x INTEC adhesive systems:** 200L double drum pump, 1K-PU, heated to 45°C
- **2x Cameras:** 2D Data Matrix Code reading
- **Safety fencing:** Sliding doors, Makrolon where needed

## Adhesive
- **Type:** BETASEAL 1989 (Dow)
- **Part #:** A0009892000
- **Temp:** Heated to ~45°C
- **Bead:** 12x9mm
- **Glue length:** ~4000-4500mm (varies by part)

## Tolerances
- X-Position: +/- 0.75mm, cpk 1.0
- Y-Position: +/- 0.75mm, cpk 1.0

## Cycle Time
- Shop output: 43 JPH
- Tact time: 83 sec
- Equipment cycle: 67 sec
- Capacity: ~940 units/day
- Operation: up to 3 shifts, 5-6 days/week
- Conveyor availability: >99.5%

## Backup Strategy
- If robot/gripper fails: use second cell
- If both cells down: manual backup with assembling frames
- For WSS/RWTS: manual gluing with cartridge, 2-worker install
- "Installation without coincidence control" option with worker confirmation

## Failure Scenarios
1. **Ubisense/PLUS fault** → NextPN or manual entry
2. **2D code/coincedence failure** → Showcase position, worker visual inspection
3. **Gripper vacuum failure** → Stop, analyze, use backup cell
4. **Adhesive NOK** → Show-me position, Euchner key required for OK documentation
5. **Glue open timer NOK** → Remove and restart or kick out

## Interfaces
- **PLUS System:** UBISENSE body tracking, coincidence check, Q-protocol
- **Conveyor:** Skillet, backward flow, ~300mm height
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

## Modification Timeslots
- Summer 2027: ~3 weeks, end of June
- Winter 2027/28: ~3-4 weeks, end of December

## Production Support (V267)
- Ramp-up V/X/C/Z167: 14 days, 2 shifts, 4 employees/shift
- S-Lot 2: 14 days, 2 shifts, 4 employees/shift
- S-Lot 3: 14 days, 2 shifts, 2 employees/shift
- S-Lot 4: 14 days, 2 shifts, 2 employees/shift

## Key Requirements
- Integra Wave 7.1 mandatory
- CAD: Siemens NX (CTRNext)
- Documentation: SLE, DEEP portal
- Training: English docs, national language for operators
- No subcontracting without written MBAG approval

## Files
- Source: `000_B2.401_FSS_BU-Cell MBEAL_V01.05.pdf` (58 pages)