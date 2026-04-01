# RFQ Analysis — 25-73287 Cavity Wax North Cell 3 Robot Replacement

**Customer:** MBUSI (Mercedes-Benz)
**Project ID:** 25-73287
**RFQ Version:** v1.00 (Nov 2025)
**Author:** Mike Terry, MO/CTEBB
**Date Analyzed:** 2026-03-31

---

## Overview

Turn-key project to replace four aging ABB IRB 4400L/30 Cavity Wax process robots in North Cell 3. New robots must be functionally equivalent or better, matching Cells 1 & 2 standards.

**Core Deliverable:** Four new process robots + all associated 7th axis rails, process equipment, fluid systems, controllers, and integration. Full turn-key from design through commissioning.

---

## Equipment Scope

- **QTY:** 4 process robots (replacing ABB IRB 4400L/30)
- **New Controllers:** ABB IRC5 (MBUSI has 4 available — PN 3HAC020536-015)
- **7th Axis Rails:** 4 full replacements, matching existing length/travel/mount
- **Process Equipment:** Full replacement base-to-EOAT — dress packs, fluid lines, sensor wiring
- **Nozzle Heads:** IPR parts 152108802 & 15210505 (4x)
- **Fluid System:** Complete fluid delivery, measurement, and control
- **Valve Pack:** Replace SMC with Festo valve pack (MBUSI standard)
- **Substructure:** New steel substructure, vibration-free, decoupled from booth
- **TCP Reference:** New booth reference monument for TCP validation

**Payload:** Min 20% safety margin over existing — supplier must simulate and validate
**Deflection Limit:** ±1.0mm TCP under dynamic motion

---

## Cycle Time & Throughput

| Parameter | Value |
|-----------|-------|
| Takt Time | 108 sec |
| Process Time | 90 sec |
| Transfer Time | 18 sec |
| Annual Volume | 333,000 units |
| Technical Availability | P = 99.5% |
| Unscheduled Downtime | Zero goal |

---

## Controls & Standards

- **PLC:** Must interface with existing Paint Shop PLC, Integra programming standards, ladder format
- **HMI:** Beckhoff — must match Cells 1 & 2 exactly
- **Communications:** Ethernet between robot controllers, PLC, HMI, process equipment
- **Vision:** ISRA vision system — accept offset data, communicate directly to robot controllers
- **Data Reporting:** MBUSI SQL reporting systems (match existing wax cells)
- **Safety:** All existing PLC safety interlocks integrated into new robot controllers
- **OEM Standard:** EPG055 (MBUSI General Project Specification)
- **Governing Procedures:** EPG030 (buyoff), DEEP (documentation)
- **Materials:** 100% silicone-free, pre-approved MSC codes required

---

## Key Contacts

| Name | Role |
|------|------|
| Mike Terry | MO/CTEBB — RFQ Author |
| Ramona Ludgood | Quotations — submission address |
| Brian Johnson | ECM Manager |
| Tim Rose | ECM Manager |
| Michael Phillips | ECM Manager |

---

## Timeline

| Milestone | Date |
|-----------|------|
| RFQ Due | TBD with Ramona Ludgood |
| Kickoff | After award |
| FAT (Mod Build) | November 2026 |
| Installation | Winter Shutdown 2026 |
| Training Outline | 2 weeks before training |

---

## Deliverables

- Full digital simulation (reach, cycle time, interference) — approved before procurement
- TCP accuracy/repeatability test certificate
- Microsoft Project Gantt schedule
- Manpower list (including subs) for MBUSI approval
- As-built documentation (digital + printed)
- Training materials + attendance records
- Weekly design meetings + weekend work meetings

---

## Installation & Commissioning

- Contractor obtains all MBUSI permits (Safe Work, Hot Work, LOTO)
- Survey existing damages/deficiencies before starting
- Flow meter accuracy validation (beaker test)
- SQL reporting functionality verification
- ISRA offset validation under production conditions
- Full safety validation PLC-to-robot interlocks
- All programming by MBUSI-approved integration engineers

---

## Training & Support

- **Start-up Support:** First production day after shutdown (part of commissioning)
- **Production Support:** Min 2 full production weeks after start-up
- **Q-Release:** Must be achieved on all models before support concludes
- **Training:** Classroom + hands-on for all MBUSI Maintenance teams
- **Timing:** Outline due 2 weeks before training starts

---

## Commercial Terms

- **Quotation Format:** Itemized Labor, Material, Equipment
- **Submission:** ramona.ludgood@mercedesbenz.com
- **Alternative Proposals:** Requested — submit in addition to compliant base quote
- **Expenses:** Must follow MBUSI expense guidelines

---

## Scope Classification

**IN SCOPE:**
- Complete robot + controller replacement
- 7th axis rail replacement (all 4)
- All process equipment base-to-EOAT
- New steel substructure (vibration-free, decoupled)
- Festo valve pack
- Fluid delivery/measurement/control system
- ISRA vision integration
- Beckhoff HMI integration (match Cells 1 & 2)
- SQL reporting integration
- PLC/safety integration
- TCP reference monument
- Design through commissioning
- Documentation (DEEP)
- Training

**OUT OF SCOPE:**
- Building-level utility supply points (interface to existing)
- Upstream/downstream equipment (beyond Cell 3 interface)

**INTERFACE:**
- Existing PLC architecture, safety system, Beckhoff HMI, ISRA vision, SQL reporting

**TBD:**
- Exact robot brand selection
- Final controller config if not using MBUSI-supplied IRC5s

---

## Contractual Risks

1. **Turn-key liability** — supplier owns entire scope
2. **Robot selection costs** — any mods due to supplier's choice = no extra charge
3. **No cost escalations** accepted after award for robot/controller/payload/reach issues
4. **Schedule recovery** — expediting costs supplier responsibility
5. **Change orders** tightly controlled

---

## Open Questions (Pre-Quote)

- RFQ due date — confirm with Ramona Ludgood
- Use MBUSI-supplied IRC5 controllers or procure new?
- Beckhoff HMI standard architecture details (must match Cells 1 & 2)
- Preferred robot brand if not ABB
- Subcontractor names for MBUSI approval

---

*Analysis Date: 2026-03-31*
