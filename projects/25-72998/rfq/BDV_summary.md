# BDV Cell Summary - Front Door Window Gluing

## Cell Overview
- **Cell Type:** BDV (Blende Dach Vorne) - Front roof cover gluing
- **Location:** Building A2, TechLine St. 15+16
- **Transport:** ETS skids on roller bed, stop-and-go mode, forward flow
- **Models:** V/X/Z267, V571, future derivative

## Process Flow
1. BDV delivered via AGV in JIS load carrier
2. Worker places BDV on conveyor belt load carrier station
3. De-stacking robot picks BDV → coincidence check (2D DMC code vs PLUS)
4. Centering drawer centers component in X/Y
5. Application robot picks BDV, applies adhesive bead (7th axis rotation)
6. Measuring robot (VMT Sense&Place) measures body position
7. Gluing/assembly robot assembles BDV to body
8. Optional: Screwing unit for Lidar fixation

## Key Components (Contractor Scope)
- **De-stacking robot:** KR210 R3100-2 (MBAG provision)
- **Gluing/assembly robot:** KR210 R3100-2 (MBAG provision)
- **Measuring robot:** KR210 R3100-2 (MBAG provision)
- **Gluing system:** INTEC-Sames double barrel pump, 1K-PU, heated to 45°C
- **Centering drawer:** Pneumatic X/Y centering
- **Tool changer:** 3 grippers + 1 for derivative
- **3x assembling frames** with storage tables for manual backup
- **Option:** Screwing unit (6 EC screwdrivers on measuring robot gripper)
- **Option:** 3x material feeding via loading lanes with AGVs

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

## Interfaces
- **PLUS System:** Vehicle data via UBISENSE, coincidence check, Q-protocol
- **Conveyor:** ETS skids, stop-and-go, ~300mm height
- **Power:** 480V/60Hz → 400V transformer
- **Pneumatics:** 6 bar, ball valve interface

## Files
- Source: `000_B2.401_BDV_Cell_MBEAL_V01.06.pdf` (72 pages)