# JR AUTOMATION — SUBCONTRACTOR SCOPE OF WORK

## Project Details

| Field | Value |
|-------|-------|
| **Project Name** | Cavity Wax North Cell 3 Robot Replacement |
| **Job Number** | 25-73287 |
| **Customer** | MBUSI (Mercedes-Benz U.S. International) |
| **Requestor** | Mike Terry, MO/CTEBB |
| **RFQ Date** | November 2025 |
| **SOW Type** | Installation |
| **Revision** | A |

---

## 1. Project Description

### 1.1 Purpose
Replace four (4) ABB IRB 4400L cavity wax process robots in MBUSI North Cell 3 with new functionally equivalent robots, including all associated 7th axis rails, process equipment, and integration with existing cell infrastructure.

### 1.2 Subcontractor Scope — Installation

The Subcontractor shall provide all labor, tools, and equipment necessary for the physical installation, removal, and commissioning support of the following equipment:

#### Robots (4 each)
- Remove existing ABB IRB 4400L/30 robots from positions R1, R2, R3, R4
- Install replacement robots (functionally equivalent to IRB 4400L/30)
- Install robot dress packages and cable routing per MBUSI standards
- Connect robot to customer-provided IRC5 controllers (3HAC020536-015)
- Verify robot mounting, alignment, and TCP accuracy

#### 7th Axis Rails (2 each)
- Remove existing rail assemblies
- Install replacement rail assemblies matching existing length, travel, and mounting configuration
- Install rail drive system, motor, encoder, and gear unit
- Install cable management assemblies
- Replace rail lubrication system to MBUSI standard
- Verify rail operation, repeatability, and integration with robot controllers

#### Process Equipment (4 each)
- Install fluid delivery systems (volume tracking, flow meters, control valves)
- Install Festo valve packages
- Install Leoni hose packages per existing routing
- Install end-of-arm tooling (EOAT) and nozzle heads
- Connect fluid lines from robot base to process equipment
- Verify all process equipment connections and operation

#### Electrical (Per Cell)
- Connect robot controllers to customer Beckhoff HMI and PLC infrastructure
- Connect to ISRA vision system (offset data to robot controllers)
- Connect to MBUSI SQL reporting system per Cells 1 & 2 standard
- Connect all safety circuits per MBUSI safety standards
- Connect all junction boxes, cable tray, and conduit per MBUSI standards

#### Pneumatic (Per Cell)
- Connect pneumatic supply to Festo valve packages
- Install pneumatic tubing per MBUSI standards
- Verify all pneumatic connections and operation

### 1.3 JR Automation Scope (NOT Subcontractor)
- Robot selection and validation
- Robot and rail engineering and simulation
- Controller configuration and programming
- PLC program development and integration
- Beckhoff HMI screen development
- ISRA vision integration
- SQL reporting integration
- Process parameter optimization
- All design and engineering

### 1.4 Installation Boundary
| Item | Responsible |
|------|-------------|
| Robot mounting and alignment | Subcontractor |
| Rail mounting and alignment | Subcontractor |
| EOAT mounting | Subcontractor |
| Electrical terminations | Subcontractor |
| Pneumatic connections | Subcontractor |
| Robot programming | JR Automation |
| PLC programming | JR Automation |
| HMI development | JR Automation |
| Process tuning | JR Automation |

---

## 2. Concept

Subcontractor shall follow JR Automation's approved layout drawings, installation details, and wiring diagrams. All work shall conform to:

- MBUSI Plant Standards (ECM documentation)
- Mercedes-Benz Integra Standards (Volume 3)
- EPG030 buyoff procedure
- MBUSI electrical, mechanical, and safety specifications

Subcontractor shall coordinate all work with JR Automation project lead and MBUSI Engineering.

---

## 3. Performance Criteria

**No performance guarantees** — Subcontractor scope is limited to installation only.

Installation shall meet the following acceptance criteria:

| Criteria | Requirement |
|----------|-------------|
| Robot mounting | Per manufacturer specs and JR drawings |
| Rail alignment | ±1mm repeatability verified |
| Electrical terminations | 100% verified, no opens/shorts |
| Pneumatic leak test | No leaks at 90 psi |
| Safety circuits | All safety functions verified |
| HMI communication | All signals to PLC verified |

---

## 4. Additional Customer Spec

- [ ] Yes — MBUSI Standards (ECM Volume 3)
- [ ] No

If yes, specify: MBUSI Paint Shop Standards, Integra Standards, EPG030 buyoff procedure

---

## 5. Documentation Requirements

Subcontractor shall provide:

- [ ] As-installed layout drawings
- [ ] Electrical wiring diagrams (updated from JR drawings)
- [ ] Pneumatic schematics
- [ ] Equipment location drawings
- [ ] Bolt torque records
- [ ] Alignment survey reports
- [ ] Safety circuit verification checklist

All documentation shall be submitted in both digital (PDF) and printed formats within 2 weeks of installation completion.

---

## 6. Acceptance Requirements

### 6.1 Installation Completion Checklist
- [ ] All robots mounted and aligned
- [ ] All rails mounted and aligned
- [ ] All electrical connections complete and verified
- [ ] All pneumatic connections complete and leak-free
- [ ] All safety circuits functional
- [ ] All fluid system connections complete
- [ ] All documentation submitted

### 6.2 Testing
- Subcontractor shall perform continuity checks on all electrical circuits
- Subcontractor shall perform leak tests on all pneumatic connections
- Subcontractor shall verify all safety circuit interlocks with JR Automation
- JR Automation witness and sign-off required for each robot position

### 6.3 Walkthrough
- MBUSI Engineering witness walkthrough per EPG030
- JR Automation punch list resolution
- Final sign-off by JR Automation and MBUSI

---

## 7. Special Instructions

- **Silicone-free materials only** — 100% silicone-free required
- MBUSI-approved contractors only for any subcontractor labor
- All material transports through paint shop require MBUSI engineering approval
- Work limited to non-production hours unless approved
- All scrap materials removed by subcontractor in provided gondolas

---

## 8. Project Schedule

| Milestone | Date | Responsible |
|-----------|------|-------------|
| Equipment delivery | TBD | JR Automation |
| Installation start | Winter 2026 shutdown | Subcontractor |
| Installation complete | Before SAT | Subcontractor |
| SAT (Site Acceptance Test) | TBD | JR + MBUSI |
| Final acceptance | TBD | MBUSI |

---

## 9. Contacts

| Role | Name | Company |
|------|------|---------|
| JR Project Manager | — | JR Automation |
| MBUSI Project Manager | Mike Terry | MBUSI |
| Standards Lead | Ann White | MBUSI |

---

**Revision History**

| Rev | Date | Description |
|-----|------|-------------|
| A | 2026-03-27 | Initial issue for installation SOW |

---

*This SOW is for installation work only. All design, engineering, programming, and integration is JR Automation responsibility.*
