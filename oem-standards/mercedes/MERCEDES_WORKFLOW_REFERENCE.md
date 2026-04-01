# Mercedes/MBUSI Workflow Reference — JR Automation

_Practical guide for quotes, robot replacements, and automation projects._

---

## Key Contacts

| Role | Name | Email |
|------|------|-------|
| Quotations (submissions) | Ramona Ludgood | ramona.ludgood@mercedesbenz.com |
| RFQ Author (Cavity Wax) | Mike Terry | michael.terry@mercedes-benz.com |
| ECM Managers | Brian Johnson, Tim Rose, Michael Phillips | (internal MBUSI) |
| Paint Shop Planning | Rafael Bickel, Andreas Breitling | |

---

## Governing Standards

| Standard | What It Covers |
|---------|---------------|
| **EPG055** | MBUSI General Project Specification |
| **EPG030** | Buy-off procedure (milestones) |
| **DEEP** | Documentation management portal |
| **Integra** | PLC architecture + robot standards |
| **GL-EN Robot V70.06** | Robot hardware/software standards |
| **GL-EN PLC V60.02** | PLC software (Siemens TIA Portal) |
| **GVOSS** | Ford vehicle optimization standard |
| **Integra Wave 7.1** | Mercedes-specific requirements |

---

## Project Structure (Tender)

Mercedes RFQs come in 3 volumes:
1. **Volume 1** — Standard (general requirements)
2. **Volume 2** — Project-specific scope
3. **Volume 3** — Technical specifications (robot, PLC, CAD, etc.)

---

## Robot Standards (KUKA Primary)

### Approved Hardware
- **Robot Brand:** KUKA (primary)
- **Controller:** KRC5 (standard)
- **Linear Units:** KL4000-S (standard), KL5000 (heavy duty/Fortec-2)
- **Positioners:** KP1-V1000 HW-2

### Key Rules
- Robot + controller delivered as **commissioned pair** — cannot be separated
- Mount robots standing (0°), linear units on 90° grid (no 45°)
- **PROFINETsafe** for all safety comm (no hardwired safety signals)
- Safety labels: black "S" on yellow background on Axis 2 if SRM/SOP active
- **Kuka-Load-Online** must be used to validate load data for every tool
- Max workload: **95% non-handling, 90% handling**

### Naming Conventions (Mandatory)
- Robot: `<System>_<Station>RB_<Robot#>` (e.g., `HD61_110RB_100`)
- Controller hostname: concatenated string (e.g., `M050HD61110R100`)
- PROFINET device name: follows controls standard `GL-DE_HWKonfig_PROFINET`

### Programming
- **KUKA WorkVisual (WoV)** — offline tool
- Main programs (HPxxx): logic + init only, no motion commands (except HOME)
- Global subprograms: actual motion and process commands
- Load data verified via Kuka-Load-Online before operation

### Mastering (Critical for Replacements)
1. Master without load (EMD)
2. Mount tool, use "Teach offset" for tool weight
3. Verify OLP simulation data on physical robot

---

## PLC Standards (Siemens TIA Portal)

### Approved Software
- **TIA Portal V14+** (version to confirm with MBUSI)
- STEP 7 Professional + Safety + Openness
- Programming: FUP (Europe) / KOP/LAD (Americas)

### Structure — The Integra Hierarchy
```
CPU → SECTION → DESK → STATION → FUNCTION GROUP (FG)
```
- **Function Group (FG)** = smallest unit = one mechatronic component
- Each FG = one FB (function block) + one FGDB (instance data block)
- Custom signals: `FGDB_[FG_Name]@AddOn` global DB
- Sub-functions: `FGDB_[Main_FG]@[SubFunction]`

### Safety (F-Program)
- Programmed in **F-FBD** (failsafe FBD)
- Separate cyclic OB (FOB_RTG1, ~50ms)
- Uses safety-rated blocks (SE family)

### HMI
- **Auto-generated** from PLC program via TIA Openness → XML → SIS
- Integrator does NOT manually create HMI screens
- Correct commenting in PLC = correct HMI display
- Key DBs: `iDB_SYS_STRUCTURE` (DB2), `iDB_SYS_ALARM_BUFFER` (DB3), `iDB_SYS_ALARM_FIFO` (DB4), `iDB_SYS_STATUS` (DB5)

---

## Acceptance Milestones (EPG030)

| Milestone | What It Means |
|-----------|--------------|
| **1. Technical Commissioning** | Integrator operates system to prepare for handover |
| **2. Technical Safety Approval** | **CRITICAL** — operator function transfers to MBUSI, CE compliance required |
| **3. Production Tests (Pro/S-Lot)** | Joint tests under production conditions |
| **4. Process Approval** | Cycle time, availability, quality verified — triggers major payment |
| **5. Final Acceptance (BGB)** | Legal handover, final payment |

### Availability Formula
```
P = [Q × TE / (Q × TE + TS)] × 100%
```
- Q = vehicles processed, TE = cycle time, TS = technical downtime
- **Organizational downtime NOT counted against supplier** (breaks, upstream waits)

---

## Documentation Requirements

### DEEP (Digital Equipment Engineering Portal)
- **Mandatory** — central platform for all technical documentation
- No hard copies or drives
- BOM managed in DEEP → integrated with SAP iPro

### FAPLIS (Layout System)
- Layouts in **MicroStation** with CARF layout module
- 2D + 3D models in `.dgn` format
- Must be continuously updated to as-built status

### FMEA
- Process FMEA required first
- Design FMEA for critical components

---

## Training Requirements

- Must be complete **before Technical Safety Approval**
- Submit training schedule for approval **8 weeks before** training starts
- Scope: operation, safety devices, maintenance, troubleshooting, repair
- Materials: comprehensive digital/written for each participant
- **New components not on material list** = supplier provides/training cost

---

## Spare Parts

- **10-year availability** required after final acceptance
- **15 years** for "successor-flexible" systems
- SLE (spare parts list) submitted at milestones

---

## Key Rules for Quotes

### Approved Materials Only
- Only components on MB-approved materials lists (AML/MFL/BQF)
- No free choice — deviations require written approval
- **100% silicone-free** materials required in paint shop

### Virtual Commissioning
- **Mandatory** using **RF::Suite** (Mercedes software)
- DELMIA/Process Simulate for simulation

### What to Flag as Risk
- Turn-key liability — supplier owns entire scope
- Robot selection changes = no extra cost allowed
- No cost escalations accepted after award for selection changes
- Schedule recovery costs = supplier responsibility
- Tight change order control

---

## Pre-Quote Checklist

- [ ] Confirm RFQ due date with Ramona Ludgood
- [ ] Clarify robot brand/model if not KUKA
- [ ] Confirm controller situation (MBUSI-supplied or procured)
- [ ] Get Beckhoff HMI standard architecture details
- [ ] Verify all 6 cell specs for multi-cell projects
- [ ] Confirm DEEP/FAPLIS access and training requirements
- [ ] Get Integra qualification requirements for PLC engineers

---

## Tip: What's Different from Ford/GM

| Aspect | Ford (VOSS/GVOSS) | Mercedes (Integra) |
|--------|-------------------|-------------------|
| Robot | Fanuc primary | KUKA primary |
| PLC | Allen-Bradley | Siemens TIA Portal |
| Safety | Hardwired + Ethernet/IP | PROFINETsafe |
| HMI | Manual creation | Auto-generated from PLC |
| Documentation | Drive/email | DEEP portal mandatory |
| Standards | VOSS, GVOSS | EPG055, Integra Wave 7.1 |

---

## Profinet Standards (Integra PN)

### Core Technology
- **PROFINET** mandated for all UOP (operator panels) and PLC control cabinets
- Applicable: Body Shop, Assembly, Conveyor, Paint Shop

### Approved Hardware
| Component | Model |
|-----------|-------|
| PLC | Siemens **S7-1500 F-CPU 1517F** (failsafe standard) |
| Managed Switch | Siemens **Scalance XM 416-4C** |
| Basic Switch | Siemens **Scalance X208** (conveyor/assembly) |
| Network Coupler | **PN/PN Coupler** (segmentation required) |
| Firewall | **FL-MGuard RS4000 TX/TX** |
| IPC | Siemens **Simatic IPC 627 D** (2x Gigabit Ethernet ports) |
| Display | **SIMATIC IFP 2200 MT** (22" Multitouch) |

### Network Architecture — Critical Rules
- **Dual-NIC separation mandatory** — PN network ≠ IU (information) network
- IPC 627D has 2 Ethernet ports: one for PROFINET, one for plant info network
- **Cross-connecting PN and IU networks is forbidden**
- **PN/PN Couplers** segment the Profinet network — required for diagnostics and isolation
- Managed switches enable topology detection and port diagnostics

### IP Addressing — Clarify with MBUSI
- **IP ranges NOT specified in this standard** — must get from MBUSI project management
- Designated IP ranges for internal KRC5 use: `172.16.x.x`, `192.168.0.x` (do NOT use on plant network)
- Vision systems: designated range `192.167.[Cell].[11-19]`

### Device Naming — Clarify with MBUSI
- Profinet device naming convention NOT in this doc — must get from MBUSI plant standard
- Critical for: diagnostics, device replacement (PROFINET Simple Device Replacement)

### Software Images
- **INTEGRA IMAGE** — standard UOP 60/63: Windows 10 + TIA Portal + ISI V5 + Integra Portal
- **TECH IMAGE** — UOP 63 tech computers: Windows 10 + Integra Shell V5
- **DO NOT** install custom software or modify OS on IPCs
- **Lead time: 10 weeks** after order receipt

### Procurement
- Order through **regional Siemens AG distributors**
- Use exact order numbers from MBUSI spec
- 10-week delivery — factor into schedule

---

## CAD Requirements (Volume 3 i7/i7.1)

### Electrical/Pneumatic — EPLAN

**Software:**
- EPLAN version dictated by Basic Project (`.zw9` file)
- Daimler Add-on required (version must match EPLAN)
- Master data from Basic Project — **do not modify or create custom symbols/frames/forms**

**Project Setup:**
- Create new projects from official Basic Project template
- Mandatory project properties via `MBC Mandatory Fields (integra)` scheme
- Supplier logo: place in `...edb\Images\Supplier_Logo.jpg` (not on cover sheet directly)

**Naming Conventions (IEC 81346):**
| Identifier | Meaning | Example |
|-----------|---------|---------|
| `==` | System Designation (plant) | `166_8_HB31` |
| `=` | Function Group ID | `=001SPS101` |
| `+` | Location ID | `+H101` |
| `&` | Document Type | `&EFS`, `&MFS` |
| `#` | Serial FG # (print order) | `#0010`, `#6001` |
| Device Tag | Unique component ID | `-K101`, `-QF01` |

**Page Naming:** Two-digit numerical, leading zero (01, 02...). Restarts at 01 for each new function group and document type.

**Number Pools:**
- `0000-0009`: General (cover sheet, TOC)
- `0010-4999`: Electrical + fluid power circuits
- `6000-6999`: Reports (terminal diagrams, cable lists)

**Design Rules:**
- Circuit diagrams: **1:1 scale only**
- Path function texts: fixed 40mm width, no manual line breaks
- PLCs/Robots: use MB schemes (`MB SIMATIC S7 V*`, `MB TIA V*`, `MB Robot V*`)
- Robots treated as sub-plants: `==PLANT.ROBOT`
- Parts: at least one part per main function; replace placeholder "System Parts" with real approved parts

**Deliverables:**
1. EPLAN backup (`.zw1`) — free of "Fault" class errors
2. Project check log file (from Daimler Add-on)
3. PDF color (`MB Default V*` scheme) + PDF B&W (`MB Print V*` scheme)
4. Parts list (`MB Parts list (integra) V*`) — for SLE import
5. Other lists as needed (device labels, cable labels, robot assignment lists)

---

### Layout — FAPLIS (MicroStation/AutoCAD)

**Software:**
- **2D:** MicroStation (`.dgn`) or AutoCAD (`.dwg`)
- **3D:** Siemens NX (`.prt`) + Process Simulate (on Teamcenter)
- **Exchange format:** `.JT` (standard), `.step`/`.stp` (AP214/AP242)

**Hall Grid System:**
- Plant-wide coordinate grid — all equipment referenced to fixed grid lines
- Example: grid lines `D` and `28` → reference column `D/28`

**Resource Naming (Sachnummer):**
- Format: `[Station#][Equipment Type Code]_[Unique ID]`
- Examples: `010RB_300` (Station 10, Robot), `020ABS121` (Station 20, Automatic Stud Welder), `010KLB302` (Station 10, Adhesive System)

**Coordinate System:**
- Global origin tied to Finished Floor Level (FFL = 0)
- Heights referenced from FFL (e.g., `+1.575m`)
- Use Referenzsäule (reference column) for all measurements

**Drawing Conventions:**
- Strict layer structure (building, equipment, safety fences, cable trays, dimensions)
- Title block: official MB template, complete with revision history
- Standard colors: red = safety fences, yellow = building, blue/green = production equipment
- All equipment labeled with Sachnummer
- Standard symbols from FAPLIS library

**Key Deliverables:**
1. 2D layout drawings (`.dwg` or `.dgn`)
2. 3D cell layout (Process Simulate, library components)
3. Resource list (Stückliste) — must match layout
4. Simulation: reachability, cycle time, collision detection
5. As-built documentation after installation

---

## Buy-Off Milestones (EPG030)

### Acceptance Sequence

| Phase | Milestone | What It Means |
|-------|-----------|--------------|
| 1 | **Design Release** | MB approves design before manufacturing starts |
| 2 | **WBO (White Buy-Off)** | System setup / commissioning — all components physically installed |
| 3 | **YBO (Yellow Buy-Off)** | Automatic mode — 10 consecutive parts kits automatically |
| 4 | **KFU (Performance Test 1)** | 120% cycle time — 25 vehicles + 30 vehicle performance test |
| 5 | **vPFU (Performance Test 2)** | 110% cycle time — 50 parts/bodies in series-like conditions |
| 6 | **Green 1 (Technical Approval)** | Safety devices 100% verified, shutdown matrix certified |
| 7 | **Run at Rate (RaR)** | 100% cycle time — 50 vehicles, mixed operation |
| 8 | **ALN (Long-Term Capability)** | 10 shifts at full capacity — MB personnel run, contractor accompanies |
| 9 | **Green 2 (Final Acceptance)** | All milestones complete, defect-free — BGB handover |

### Checklists — COMAN System

**Tools:**
- **COMAN Manager** (desktop) — project setup, checklist editing, server: `coman.i.mercedes-benz.com`
- **COMAN Mobile** — on-site verification, open points, photos
- **Dashboard** — web-based progress monitoring, ramp-up curves, open points

**Checklist Structure:**
- Each milestone has a specific Excel-based checklist (separate from the guideline document)
- Checkpoints per milestone: Design (33), WBO (19), YBO (29), KFU (13), vPFU (16), Green 1 (7), RaR (5), ALN (7), Green 2 (5)

**Completing Items:**
- Desktop: right-click → "Alle Vorgänge setzen" (mark all complete)
- Mobile: tap checkbox → "Vorgang verifizieren"
- Mark not relevant: right-click → "Als nicht relevant kennzeichnen"

**Open Points (defects):**
- Create via COMAN — right-click item → "Neuer 'Offener Punkt'"
- Fill: Problem description, responsible person, category/priority, due date
- Attach proof (photos, PDFs) — required for safety items
- **CRC documentation required** for safety PLC checkpoints (enter checksum + auditor name)

**Sub-Supplier Workflow:**
- Export checklist to Excel (with COMAN annotations)
- Sub-supplier fills in Excel
- Re-import via COMAN progress table

**Notifications:**
- COMAN auto-emails when milestones are completed
- Sign-off required from: Bodyshell Planning, Electrical Planning, Production, Maintenance, Joining Technology, Product Quality, Occupational Safety, Supplier

### Payment Triggers
Each milestone = a payment target. Successful sign-off releases the corresponding contract tranche.

---

_Last updated: 2026-03-31_
