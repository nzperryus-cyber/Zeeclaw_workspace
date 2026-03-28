# Mercedes OEM Standards Reference

Stored: `/home/nathan/.openclaw/workspace/oem-standards/mercedes/`

## Files

| File | Description | Pages |
|------|-------------|-------|
| 000_B1.040.01_Standard_specification_assembly_V71.01.pdf | Main tender spec (Volume 1) - general project conditions, acceptance process, key figures | 43 |
| 000_B3.040.01.01_GL-EN_Robot_V70.06.pdf | Robot guideline - KUKA KRC5, safety, load data, commissioning | 98 |
| 000_B3.026.02.00_GL-EN_Software_PLC_part1_V60.02.pdf | PLC software standard - TIA Portal, integra framework, FG structure | 73 |
| 000_B3.026.02.00_GL-EN_Software_SPS_Teil2_CPU1517F_V60.10.pdf | PLC hardware config - CPU1517F details | - |
| 000_B3.002.04.01_ANH_Muster Layout_V70.00.pdf | Layout template | - |
| 000_B3.002.04.02_ANH_Muster Fördertechnik Sicherheitslayout_V70.00.pdf | Conveyor safety layout template | - |
| 000_B3.002.04.18.04_FB_03_46_Inbetriebnahme Protokoll_MultiLingual.pdf | Commissioning protocol | - |
| 000_B3 026 04 01_BR_Integra_PN_EN_V60.04.pdf | Profinet integration | - |
| 000_B3.002.04.12_ANH_Muster Verfahrensschemata_V70.00.pdf | Process schematics template | - |

## Quick Reference

### Acceptance Milestones
1. Design approval
2. Shipping approval
3. Technical commissioning (trial operation by supplier)
4. Technical safety approval + transfer of operator function
5. Production Tests (Pro) / Series Production Lot (S-Lot)
6. Process approval of operational system (Q-approval)
7. Final acceptance (BGB)

### Technical Availability Formula
```
P = (Q × TE) / (Q × TE + TS) × 100%
```
- Q = vehicles processed in period
- TE = system cycle time
- TS = technical downtimes

### Payment Milestones
- 1st partial: Design approval
- 2nd partial: Technical safety approval OR Process approval
- Final: After BGB acceptance

### Key Contacts
- Robot guideline: Benjamin Gall (benjamin.gall@mercedes-benz.com)
- Document manager: Michael Lebrecht

## Usage
To look up info from these specs:
```bash
python3 skills/iyeque-pdf-reader/reader.py extract "/home/nathan/.openclaw/workspace/oem-standards/mercedes/FILENAME.pdf" --max_pages N
```

Or search within:
```bash
python3 skills/iyeque-pdf-reader/reader.py extract "FILENAME.pdf" | grep -i "searchterm"
```