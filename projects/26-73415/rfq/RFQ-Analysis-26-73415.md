# RFQ Analysis — Tesla GA 4.5 Glazing Automation

**Project:** 26-73415
**Customer:** Tesla
**RFQ:** RFQ 73252 - GA 4.5 Glazing Automation
**Date Analyzed:** 2026-04-01
**Analysis Level:** Full two-pass (Engineering + Sales/Commercial)

---

## RFQ Summary

- **Location:** Tesla Gigafactory Fremont, 45500 Fremont Blvd., Fremont, CA 94538
- **Document:** Tesla BMS-0000314 framework
- **Core Scope:** Turn-key glazing and auto-decking robots for Model Y GA 4.5
- **Parts:** Backlite (BL E41, BL Opal), Roof Glass (RG E41, RG Opal), Windshield (WS)
- **Cycle Time:** 45 seconds
- **Production Rate:** 8,500 units/week
- **Final Proposal Due:** 4/27/2026
- **Production Start:** 05/31/2027
- **Ramp to Full Rate:** 06/14/2027

---

## PASS 1 — ENGINEERING ANALYSIS

### Process
Glazing and auto-decking robots for Model Y General Assembly — floor-level automation. Option for decking robot at semi-automated backlight station.

### Stations / Robots
- Gluing robots: FANUC R-2000iC/165F (Tesla-supplied, vendor specifies model)
- Decking robots: FANUC R-2000iC/210L (Tesla-supplied, vendor specifies model)
- 3 zones, 6 HMIs (2 per zone)
- Vendor: robot risers, dress packs, TCP tools, EOAT

### OEM Standard
Tesla proprietary standards (TS-XXXXX library):
- TS-0002936 Robot Specifications
- TS-0003248 Approved Components List
- TS-0010560 Standard Element Times
- TS-0010680 VC Standards
- TS-0004826 Discrete Event Simulation
- TS-0004835, TS-0004844 Tooling Accuracy
- TS-0031736 Electrical/Network
- TS-0031799 Structural

### Cycle Time Required
45 seconds (target takt)

### Shift Model
24/7 production. 4 weeks shutdown for integration/validation + 2 weeks production support. Training all shifts.

---

### Equipment & Scope

**IN SCOPE (Vendor):**
- Robot riser calculations, manufacturing, dress packs, TCP tools
- EOAT design (same as Austin Factory — vendor to confirm)
- Siemens PLC (TIA Portal) and 6 HMIs
- All controls equipment: PDP, breakers, I/O, cables, safety devices
- ISRA SHAPEMATCH3D-FLEX decking vision (99% yield required)
- VMT G2 Spin Top 3D bead quality monitoring (99% yield required)
- Centering/rejecting/loading/inspection tables with Balluff transducers, scanners, ultrasonic Poka-yoke
- Nordson dispensing system integration (full installation)
- Application tower/pedestal: rotating servo, nozzle cleaning system, maintenance platform
- All steel structure (PE-stamped), load maps, anchoring
- Virtual commissioning (Process Simulate/WinMOD)
- RFID on all mobile equipment
- ISRA and VMT training (8 students each)
- 4 weeks integration/validation shutdown support + 2 weeks production support

**OUT OF SCOPE (Tesla):**
- FANUC robots (Tesla orders and supplies)
- Nordson core pumps, hoses, controllers (Tesla supplies)
- Tangent, tangent arm, network/IDF boxes (Tesla supplies, vendor installs)

**INTERFACE (Shared):**
- Robot model/reach specification — vendor specifies, Tesla orders
- TS-0031736 / TS-0031799 standards — Tesla provides, vendor follows

---

### Controls & Standards
- PLC: Siemens TIA Portal with Tesla code generator and templates
- Safety task execution <5ms, standard logic scan <10ms average
- 24VDC UPS for PLC/IPCs — 2-hour runtime during power loss
- Network security appliance in every main control panel
- All software source code provided to Tesla (no locked/protected code)
- FANUC robots with Tesla Core software, TS-0002936 specs
- Calculon script for OLP error correction

---

### Facility & Utilities
- First Floor GA 4.5 — Fremont, CA. Space is LIMITED — design dense.
- Factory requirements for structural and utilities due **2 weeks from kickoff**
- Must follow TS-0031736 (electrical) and TS-0031799 (structural)
- Vendor responsible for levelness/anchoring buyoffs on elevated floors
- Minimum 600mm maintenance access around all equipment
- Maintenance kickout zones in conveyance lines

---

### Deliverables & Timeline

**RFQ Key Dates:**
| Milestone | Date |
|---|---|
| RFQ Release | 3/30/2026 |
| CP2 Data Release | 4/01/2026 |
| **Final Proposal Submission** | **4/27/2026** |
| Project Kick-Off/Target PO | 4/30/2026 |
| CP4/CP5 Data Release | 5/04/2026 |
| Production Build Start | 05/31/2027 |
| **Ramp to Full Rate** | **06/14/2027** |

**Supplier to propose:** Final Design approval, FAT complete, Installation Start, Power-On dates

**42 Documentation Deliverables including:**
- 3D STEP CAD models, 3D NWD BIM models
- 2D DWG/PDF layouts
- PLC & HMI programs (Siemens TIA Portal)
- Robot programs backup (native format)
- EPLAN 2023 schematics
- DES (native format)
- PFMEA, Gage R&R, FEA (<0.1mm deflection)
- Spare parts list (Tesla format)
- 5 days maintenance + 5 days engineer + 2 days associate training (all shifts)

---

### Acceptance Criteria
- **FAT:** Manufacturing buyoff complete — supplier to specify date
- **SAT:** 75 net jobs/hour contractual
- **Technical Availability:** 95% by Burst Build
- **Robot Utilization:** Max 85% (>90% or <80% requires Tesla review)
- **Operator Utilization:** 85% target
- **Tooling Accuracy:** Cp/Cpk ≥ 1.67
- **Vision Yield:** ISRA and VMT both 99%
- **Dimensional Accuracy:** 90% points in tolerance by Milestone 360

---

### Contractual Risks
- **LD Penalty:** 2%/week up to 5 weeks max (10% cap) — vendor causes delay
- **3-year equipment warranty** (aggressive vs. standard 12 months)
- **1-year integrated system warranty**
- **IP Transfer:** All designs become Tesla property, can share with other integrators
- **EOM 90 days payment** — long cash conversion
- **UL certification required** before Tesla factory installation
- **PE stamps required** on structural drawings
- **VC mandatory** — significant investment
- No tier-2 VC subcontracting (one outside VC supplier max)
- "Turn-key solution" language — broad scope

---

### Engineering Gaps & Red Flags
1. EOAT "same as Austin Factory" — is that design available?
2. Vendor must propose FAT/Installation/Power-On dates — Tesla hasn't fixed these
3. 2 weeks from kickoff for factory requirements — very tight
4. 99% yield on both vision systems — aggressive
5. 4 weeks integration + 2 weeks production support — significant labor scope
6. All-shifts training requirement
7. Dense floor-level design in limited space — reach/clearance risk
8. Tesla code generator required — learning curve
9. RFID on all mobile equipment — added hardware/integration scope
10. DES mandatory — specialized software skill needed
11. Single-point failures need 50% backup strategy — redundancy adds cost
12. UL certification vendor responsibility — can be slow/expensive
13. Tesla-approved component list may limit preferred vendors
14. 3 product variants in any combination — changeover complexity

---

## PASS 2 — SALES & COMMERCIAL ANALYSIS

### Core Ask
Design, manufacture, install, and commission a turn-key glazing and decking automation system for Model Y GA 4.5 at Tesla Fremont.

### Bid Type
Open competitive bid

### Budget Signal
None stated

### Commercial Terms
- **Payment:** EOM 90 days
- **Milestones:** 20% Design Approval, 20% SAT, 60% Final Acceptance
- **Warranty:** 3 years equipment, 1 year system
- **LD:** 2%/week up to 5 weeks max

---

### Assumptions
- Utilities provided within 50 ft of equipment envelope
- Production parts provided by Tesla for FAT/runoff
- Single-shift installation (unless extended shifts quoted)
- No spare parts package unless specified
- Austin Factory EOAT design is available/reference
- VC software in scope
- Tesla provides robot specifications with enough lead time
- 1-week overlap between integration shutdown and production support

---

### Clarification Questions

**BLOCKER — Must answer before quoting:**
1. What is the timeline for Tesla to release the Austin Factory EOAT design reference?
2. Who owns Process Simulate/WinMOD models — does Tesla have existing models to share?
3. Is there an existing Despatch/RobotTalk or net-new integration? PLC template version?
4. What are incoming power characteristics at equipment location (voltage, amperage, fault current)?

**CLARIFY — Improve accuracy:**
1. Can 2-week utility/structural deadline be extended given CP2 just released (4/1)?
2. Are there existing ISRA/VMT systems at Fremont GA 4.5 to interface with?
3. What is expected UL certification timeline and preferred UL agency?
4. TSA/security requirements for workers on Tesla property?
5. Is 5-week LD cap sufficient if delays exceed 10% project value?
6. Tesla's expectation for support during 4-week shutdown — full team on-site or call-in?

---

### Scope Exceptions & Exclusions
- FANUC robot supply (Tesla)
- Nordson core equipment supply (Tesla)
- Building structural changes, facility power beyond equipment PDP
- Production-volume consumables (adhesive, cleaners)
- PPAP support after Final Acceptance
- Ongoing software licensing post-warranty
- Travel/living beyond normal installation scope

---

### Risk & Opportunity

**Risks:**
1. **Aggressive timeline** — 13 months PO to production is tight. Robot delivery, UL cert, design approval delays cascade.
2. **VC/Tesla code generator** — Specialized skill. Lack of experience = delays/cost.
3. **3-year warranty** — Cost implication for spares/support contracts.
4. **LD penalties** — $10M project = $200K/week exposure.
5. **Dense floor design** — Reach/clearance issues in limited space.
6. **99% vision yield** — May require multiple calibration passes.

**Opportunities:**
1. **Vision systems as vendor scope** — High-value add, differentiates if you have strong vision expertise.
2. **Dense floor-level automation** — Space efficiency is a Tesla priority.
3. **Long-term Tesla relationship** — Successful delivery → future programs.
4. **4+2 weeks support** — Margin-positive if staffed efficiently.
5. **Turn-key ownership** — Less finger-pointing, more margin control.

---

## QUOTE READINESS

**NOT READY TO QUOTE — Blockers exist:**

1. **Austin Factory EOAT design** — core reference piece, unavailable
2. **VC software ownership** — Process Simulate/WinMOD investment unclear
3. **Supplier-proposed milestones** — Dates drive schedule/cost
4. **Utilities/facility requirements vague** — Need CP2 data

**Recommendation:** Send clarification email to Tesla with BLOCKER questions before spending significant engineering time.

---

## Clarification Log

| Date | Question | Answer | Status |
|------|----------|--------|--------|
| 2026-04-01 | Austin Factory EOAT design availability? | | OPEN |
| 2026-04-01 | Process Simulate/WinMOD model ownership? | | OPEN |
| 2026-04-01 | Existing Despatch/RobotTalk or net-new? | | OPEN |
| 2026-04-01 | Incoming power characteristics at equipment? | | OPEN |

---

*Analysis completed: 2026-04-01*
