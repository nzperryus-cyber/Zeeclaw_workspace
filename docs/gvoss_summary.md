# Ford GVOSS Summary
**Revision:** June 08, 2025 (original issue Jan 13, 2005)
**Source:** /home/nathan/shared_folder/OEM_Standards/Ford GVOSS/GVOSS July 2025.pdf

---

## Section 1.1 — General Requirements

### Key Definitions
- **"Shall"** = strict requirement, non-compliance requires deviation approval
- **"Should"** = suggestion/guideline only
- **Tier 1 Integrator** = supplier of equipment to Ford VOME
- Conflicts between standards → GVOSS governs

### 1.1.3 Quoting Projects — CRITICAL RULES
- Quotes shall be to the project Statement of Work (SOW)
- Alternates to the project SOW only allowed when specifically stated in the SOW
- **Supplier terms/conditions not in Ford's SOW are NON-BINDING unless agreed in writing by the Ford buyer who originated the RFQ**
- **Tier 1 Integrators SHALL provide list of FTF (Ford Furnished Tool) items with associated budgetary costs as part of the bid**

### 1.1.7 FMEA Requirements
- Must comply with AIAG FMEA manual 4.2 or later

### 1.1.18 Receiving and Marshalling
- Tier 1 Integrator shall accurately identify shipment contents on Bill of Lading
- Installation contractor responsible for confirming contents against BOL and for lost materials once signed as received
- Receiving plant responsible for confirming BOL contents and for lost materials once signed as received
- Receiving plant identifies equipment marshalling areas

### 1.1.19 Plant Labor Clearance
- FNA only — Tier 1 Integrators shall follow Ford SPL "Outside Contracting" including Attachment 1 checklist

### 1.1.20 Construction Safety
- Tier 1 Integrator must comply with Ford Land Facilities Construction Specifications:
  - 01100 - Construction Safety Guideline
  - 01105 - Site Safety Contractor Responsibilities
  - 01110 - Dedicated vs. Dual Role Safety Engineer
- **Slings:** Tier 1 Integrator shall provide Single Point Lesson – Protection for Synthetic Slings to installation contractors

### 1.1.21 Launch Support
- **Weekly Field Service Sheet** shall be used for tracking manpower on launch
- Tier 1 supplier uses weekly sign-off of install in place of daily sign-off
- If sheet is not signed weekly by Manufacturing Engineer or Launch Leader, Ford will **NOT pay** for those hours

### 1.1.22 VIM Matrix
- **Global VIM Matrix** tracks ALL VOME Facility and Tooling launch issues impacting safety, throughput, quality
- Reviewed as part of Launch Team Exit Criteria
- Plant continues using VIM Matrix after launch for ongoing VOME support issues

### 1.1.23 Equipment Installation
- **Global PROTAG Procedure w-GPP001** used as official status report
- Equipment NOT in PROTAG (single source of energy, chain/cable hoists, torque tube, vin stamping) → Safety Buyoff Procedure
- **Tier 1 Integrator responsible for 1A Drawing Package**

---

## Section 1.2 — Program / Project Requirements

### 1.2.3 Maximo for Maintenance (MFM)
- Requirements for new tooling and conveyors

### 1.2.5 Tool Certification
- [Pending extraction]

### 1.2.6 Buy-Off Procedures
- [Pending extraction]

---

## Section 1.3 — Safety (EXTRACTED)

### 1.3.1 Definitions — KEY TERMS
- **ECPL** = Energy Control and Power Lockout (FAS08-100)
- **ECSPMT** = Energy Control for Setup and Permitted Routine and Minor Tasks
- **Point of Operation** = area where material is positioned and work is performed during machine cycle
- **Safety Distance** = measured from point of operation hazard to device sensing point
- **Presence Sensing Device (PSD)** = photo eyes NOT approved for PSDI
- **Antirepeat** = requires release of all tripping mechanisms before another cycle
- **Arc Flash** = applies to equipment operating at 50 volts or more
- **ECPL Placard** = 4" x 4" standard; 3" x 3" for robot controller panels (Section A)

### 1.3.2 ECPL AND ECSPMT — KEY REQUIREMENTS
- Each power source shall have a main disconnect lockable in OFF position
- Electrical disconnects: conform to Ford Global Manufacturing Standard **w-ES20**
- Pneumatic disconnect: conform to **ISO 4414:2010**
- All stored energy dissipated or blocked with non-defeatable devices
- Lockout provisions convenient to maintenance personnel
- All lockouts identify what area they disable and highlight adjacent units they do NOT disable
- **Arc flash labels** required for equipment at **50V+** (FAS08-160)
- **ECSPMT applies to:** new stand-alone tools and kitted tools with existing ECSPMT placards
- Tier 1 leads Risk Assessment for each ECSPMT task → submitted to VOME Safety for approval
- ECSPMT placard progression: **Pink → Yellow (ProTag) → Green (final laminated)**

### 1.3.3 General Information — KEY POINTS
- Safety to operating personnel is a **prime consideration** in equipment build
- **Tier 1 Integrator must provide at NO additional cost:**
  - Coupling guards
  - Finger pinch point guards at the load station
- Safety review at **50% mechanical design completion**
- All safety items must be in Tier 1's **original quote** — no additions later
- **Ontario plants** (Regulation 851, Section 7): Professional Engineer must complete and seal Pre-Start Health and Safety Report before shipping

### 1.3.4 Machine Guarding – General Requirements
- Guarding determined by **Risk Assessment** using FAS08-036
- Guards must NOT present a hazard themselves
- Guards easy to handle by **one person**
- All tooling automation requires **peripheral guarding** with interlocked gates for maintenance
- Hinged guards: interlocked to ALL controlled hazards — minimum **Category 3 PLd** per ISO 13849-1

### 1.3.5 Safety Doors — COLOR CODING
- **Operator workstation curtains:** Safety Orange with viewing window
- **Non-operator automated stations:** Safety Yellow
- Powered drive: **servo-controlled (VFD)** with overload and overheat protection

### 1.3.6 Point of Operation Guarding — KEY RULES
- **NAAMS Global Standard Components** or **ISO 14120** compliant fencing
- **Guard heights:** minimum **2200mm** from floor
- **Floor opening:** max **180mm** from floor to bottom of guard
- **Gate opening:** minimum **700mm** width
- **Interlock plug/receptacle mounting:** **900mm–1200mm** above floor
- **Color codes:**
  - Guard Panels → **Safety Black**
  - Gates → **Safety Orange**
  - Fence Posts → **Safety Yellow**
- **Two-hand controls:** ISO 13851 Type III-B, ISO 13849-1 Category 3 PLd minimum
- **Presence Sensing Devices (PSD):** Photo eyes NOT approved for PSDI

### 1.3.8 Guardrails (Pipe Barriers)
- Guardrails are **awareness barriers only** — NOT acceptable for point of operation guarding without Plant and Division Safety Engineer approval
- Minimum height: **42" / 1100mm** with second rail midway

### 1.3.9 Control Circuits
- Each machine: main electrical disconnect capable of being **padlocked only in OFF position**
- Each machine with air supply: main lockout and exhaust valve capable of being **padlocked in CLOSED position**
- Operating handle of primary energy sources: **920mm–1680mm** above working level

### 1.3.12 Emergency Stop Controls — KEY RULES
- **Category 0** = uncontrolled stop (immediately remove power)
- **Category 1** = controlled stop (power available to achieve stop, then removed)
- **E-Stop pushbutton:** mushroom type, direct opening action, mechanical latching — actuator **RED**, background **YELLOW**
- E-Stop pushbuttons **never guarded**
- Cable: 1/8" diameter, max **75 feet / 23m**
- E-Stop pushbutton mounting: **600mm–1700mm** above floor
- Components shall not drift after E-stop, loss of power, or between shifts

### 1.3.13 Safety Blocks and Pins — KEY RULES
- Physical blocking devices placed in tooling members to prevent motion from potential/residual energy
- **Risk Assessment required** for all Safety Block/Pin applications
- **Manual Safety Pins:**
  - Safety Factor: **4:1** for single pin; **2:1** per pin for multiple pins
  - Must be visually verifiable as fully engaged
  - Receiver hole max **2.0mm larger** than pin diameter
  - Pin engagement: min **12mm / 1/2"** beyond opposite side
  - Welds: continuous seam only; AWS CWI required
- **Automatic Safety Pins:** Power Off-Spring Set (spring extended, pneumatically retracted)
- **Prohibited:** Toggle mechanisms, Power Clamps, special latch mechanisms in lieu of Automatic Safety Pins
- **Mandatory:** All Power Roll Tables with Lifters require **(4) manual safety pins**, one in each corner of lift frame

### 1.3.14 Open-Sided Floors, Platforms, Balconies
- Guardrail minimum height: **42"**
- Open-sided floor/platform **4 feet or more** above adjacent floor: requires guardrail and toe-board
- Fixed ladder max length: **24 feet / 7.3m**
- Ladder cages required for ladders over **16 feet / 5m**

### 1.3.15 Signs, Labels, Markings, Nameplates
- Each disconnecting means: nameplate identifying purpose
- All operator controls: labeled for function
- Barrier guards: match marked, minimum **1/4" characters**

### 1.3.16 Color Coding — SUMMARY
- Guard Panels → **Safety Black Enamel**
- Gates → **Safety Orange Enamel**
- Fence Posts → **Safety Yellow Enamel**
- Hazardous moving machine components → **Safety Orange**
- E-Stop pushbutton actuator → **RED**; background → **YELLOW**

### 1.3.18 Slip Resistant Steel Floor
- **Type 1** (catwalks, maintenance platforms): ALGRIP™, Mebac®, SlipNOT® Grade II
- **Type 2** (operator work platforms): Mebac® (3-0) or SlipNOT® Grade I only
- Stamping areas: min coefficient of friction **0.8**

### 1.3.20 Light Screens and Scanners
- Light screens and laser scanners shall have **metal guard**
- **Banking of light screens is PROHIBITED**
- Distance validation: follow Ford Operator/Robot Shared Space Light Screen Placement standard
- Minimum safe distance per **ISO 13855**
- **Validation by video** (30 fps): 10+ measurements under worst-case

### 1.3.23 Operator Walking/Working Surfaces — KEY RULES
- Floor elevation changes > 1.5": require **14-gauge sheet metal edging** painted Safety Yellow
- Ramps: max **20 degrees** to horizontal
- **Anti-fatigue flooring** (wood or Wearwell): required for NEW workstations
- **Wood flooring:** 5-layer plywood, BASF MASTERSEAL® French Gray #458
- **Ergonomic flooring:** Wearwell ErgoDeck® General Purpose (GP), Charcoal, Yellow perimeter

### 1.3.25 Moving Equipment in Operator Accessible Floor Areas
- Equipment that extends/retracts: **pinch point hazard zone** identified with alternating diagonal **45° Safety Yellow + Safety Black stripes** ("tiger striping") — at least **12"** from edge of hazard

---

## Section 1.4 — Visual Factory Requirements (EXTRACTED)

### 1.4.2 Signal Words/Hazard Labels
- **DANGER** = imminently hazardous situation, will result in death or serious injury
- **WARNING** = potentially hazardous situation, could result in death or serious injury
- **CAUTION** = potentially hazardous situation, may result in minor or moderate injury

### 1.4.3 Directional Labels — PIPE COLOR CODES
- **Compressed Air:** white letters on **blue background**
- **Water Supply/Return:** white letters on **green background**
- **Hydraulic Supply/Return:** black letters on **yellow background**
- **Fire Protection Water:** white letters on **red background**
- **Ethylene glycol / Brake Fluid:** black letters on **Safety Orange background**

### 1.4.4 Gage Labels
- **Green** = Safe, within specified operating range
- **Yellow** = Safe but outside operating range
- **Red** = Unsafe — continued operation will result in injury or death

### 1.4.5 Lubrication Labels
- Grease Fittings: **1-inch white circle**
- Gearbox Oil Fill: **1-inch green circle**
- Gearbox Oil Drain: **1-inch yellow circle**

### 1.4.8 Color Codes — EQUIPMENT PAINT
- **All tooling, facilities equipment, automation tooling:** White Oil Proof Machinery Enamel **N9.5 (RAL 9016)**
- **Gages, checking/certification fixtures:** Safety Blue
- **Hydraulic manifolds:** Safety Orange
- **Moving machine components:** Safety Orange
- **Tool rail and structure:** Safety White
- **Hoist/crane rails:** Safety Yellow (running tread not painted)
- **End stops on bridge/runway/tool rail:** Safety Red
- **Normally open pneumatic valves:** green handles
- **Normally closed pneumatic valves:** red handles

### Operator Pushbutton Colors (GVOSS Controls):
- **GREEN** = Power On
- **RED** = Emergency Stop
- **WHITE** = Cycle Start
- **BLACK** = Stop / Off
- **BLUE** = Reset
- **YELLOW** = Interrupt Cycle

---

## Section 1.5 — Equipment Documentation (EXTRACTED)

### EIS Structure (10 Sections):
1. Introduction & Overview
2. Safety
3. Machine Operation
4. Troubleshooting Alarms and Fault Codes
5. Electrical Maintenance
6. Mechanical Maintenance
7. Hydraulics & Pneumatics
8. Preventive Maintenance
9. Subsystem and Component Equipment Information
10. Equipment Instruction (Training) Manuals

### FAE E.I.S. Delivery — 3 Stages:
1. **2 weeks after 100% Design Buyoff**
2. **2 weeks after Final Tooling Buyoff**
3. **2 weeks after completion of Commissioning and ProTag (Final As-Built)**

---

## Section 1.6 — Assembly Ergonomics (EXTRACTED)

- **Two required checklists** at every milestone:
  1. **Assembly Ergonomic Workstation Design/Sign-off Checklist** — ALL stations with a production operator
  2. **Assembly Ergonomic Tooling (MHS) Checklist** — all ergonomic aids used by production operators
- Checklists required at: **100% Design, 100% Build Vendor Floor, VO & Safety Buy-off Plant Floor <J1>**
- **Parts weighing more than 1kg (3 lbs)** must be included in all ergonomic analyses
- **ErgoWeb Enterprise** = Ford-approved software for workstation analysis

---

## Section 1.7 — Cyber Security (EXTRACTED)
- All machinery and equipment shall comply with **Industrial Controls Security Standard**
- Suppliers must comply with **Industrial Controls Security Standard Supplement for Suppliers**

---

## Section 1.8 — Industry 4.0 Technologies (EXTRACTED)

### 1.8.2 Vibration Sensors
- Sensors communicate to manufacturer's base station/gateway device
- Solutions must support **Ford-owned/controlled applications**
- Sensors must measure **temperature** as well as vibration
- **Critical Path equipment** requiring vibration sensors: PRBs, VDL, Facility Turntables, Shuttles, Cross Transfers, Two Strands, Roller Flights, Hem Press Motors
- Vibration monitoring system must be **functional and validated at Tooling Buyoff**

### 1.8.3 Rockwell Embedded Logic Solution
- **Allen Bradley ControlLogix L83/L84 PLC** required
- CompactLogix 5380/5480 requires VOME Controls approval

---

## Section 2 — Design (PARTIALLY EXTRACTED)

### 2.1 Approved Parts — KEY RULES
- Components NOT on approved list require **Deviation approval** prior to sourcing — failure = mandatory replacement at supplier's expense
- **Safety Components** must comply with **w-EL10** and **w-E1-QSSL**
- **Purchase-Alter components are PROHIBITED** — only allowed after Deviation approval
- **Purchase-Make components:** Tier 1 must create electronic file of all detail drawings in PDF

### 2.2 Development of Drawings
- **All details contacting product** (rest locators, locating pins, clamp fingers): **metric dimensions**
- **All fasteners:** metric; torque values in **Newton Meters**
- **Dimensional tolerances:** per NAAMS Global Standard Components - Assembly, Chapter A, Section A-6

### 2.3.1.4 Clearance Requirements
- Transfer motions: minimum **20mm** clearance
- Guided motions within a tool: minimum **10mm** clearance
- Robotic gun clearance: minimum **10mm**
- Moving parts: **10mm** nominal clearance

### 2.3.2.2 Cable Length Requirements
- Max cable length for fixtures/tooling plates: **20 feet / 6 meters**
- Other applications may exceed 6m but max **5 feet or 10%** excess

---

## Section 3 — Mechanical (KEY GOTCHAS)

### 3.1 FASTENERS — APPROVED MANUFACTURERS
**Only these manufacturers are approved WITHOUT testing:**
- Safety Socket
- Unbrako® (SPS Technologies)
- Holo-Krome®
- Kerr Lakeside Inc.

**Prohibited fasteners (defective without testing):**
- Maudle Industrial Co., LTD (TUZ headmark)

**Counterfeit fasteners found in use → Tier 1 responsible for replacement of ALL affected fasteners**

### 3.2.1 Locators, Rest Surfaces, Pins and Bushings
- **Locator dimensions:** new programs use **20.0mm wide** (was 25.0mm — changed for new programs)
- Locating blocks and positioning fingers: NC machined to ±0.08mm from DATUM surfaces
- Pin locator blocks: NC machined, mounting hole located within ±0.03mm from DATUM
- Dowel holes: ±0.03mm from DATUM; screw attach holes: ±0.13mm from DATUM
- **Locator pins shall engage product a minimum of 3mm, maximum 6mm** (without VOME ME concurrence)
- Locator pin tip shall not be closer than **4mm to an adjacent part**
- **Class A surface locators:** 50.0mm wide urethane, 55-65 durometer Shore A, colored **red**
- **Class B and C surface locators:** 20.0mm wide steel
- **DLC coating required** for pinning aluminum product in: hydro-form, non-square-to-grid features, high force/friction applications (BIW Framing Buck)
- **No integral pin and block set-up permitted**
- **Locating pins shall NOT be retained using set screws**

### 3.2.2 Slides
- Slide Units shall use **linear bearings**
- Bearing manufacturer application engineer must approve application
- Slides shall utilize **positive stopping** in work position for repeatability
- Shock absorbers required when absence would result in damage
- **Air-off/spring set safety pin required** when air loss = gravity motion hazard in operator work envelope
- Standard slide packages (Welker) require VOME Design Follow-up Engineer and VIS concurrence — no Deviation form needed

### 3.2.3 Fitting Spacers, Shims and "L" Blocks
- **Use of shims is PROHIBITED except in Hem Tools**
- Fitting spacers: **NAAMS** Chapter J
- "L" blocks: **NAAMS** Chapter H
- **"L" blocks: one screw and two dowels (3-Hole pattern) minimum**

### 3.2.4 Pivot Units
- Positive stops required in work direction for repeatability
- All pivot mechanisms: **minimum 4:1 safety factor** relative to forces applied
- **Air-off/spring set safety pin required** when air loss = gravity motion hazard in operator work envelope
- On pivot units that disconnect from air supply for transport: **air-off/spring set safety pin** required in transport position
- **Roll pins for retaining shafts are PROHIBITED**
- All pivot shafts: **accessible for removal**

### 3.2.5 Clamps — CRITICAL RULES
- **Pneumatic clamps:** NAAMS Chapter G design
- **Pneumatic clamps: 65 psi / 4.5 bar / 450 kPa**
- Clamp arms: **as short as possible**
- **NAAMS machined clamp arms** shall be used — special arms should be avoided
- All power clamps: **fixed orifices** preferred
- Clamp arms shall be **dowel hole constructed** for locating
- Clamps shall **NOT be heeled or shouldered to riser**
- **Wedge lock clamps** shall NOT be used where part could fall or be damaged due to loss of pressure
- **Magnetic clamps:** Magswitch® only
- All magnetic clamps: proximity sensors to detect **each state change**
- **Pin dumps:** approved for **respot operations ONLY**
- Parts loaded only when pins in clamp **extended position — never pivot pins into part**

### 3.2.6 Couplings and Shaft-Hub Connectors
- **Taper-Lock® shaft-hub connectors are PROHIBITED**
- **"QD Bushings"** (Quick Disconnect) shall be used when keys are required
- Match-marks required for keyless connectors to indicate slippage
- Keys required when more than one hub/lever on a shaft
- **Shaft alignment documentation required** before and after installation

### 3.2.7 Bearings — KEY RULES
- **Minimum acceptable L10 life: 40,000 hours**
- When bearings packed with permanent lubricant: lubricant life must exceed calculated L10 life
- **Rulon® PROHIBITED** except for pneumatic cylinder clevis pins with hard stop
- All bearings: **sealed-type** to prevent contamination
- **Double row spherical roller bearings** preferred for shafting
- Linear ball bushings: **"closed type" with seals**
- **"Long" and "Narrow" bearing blocks: PROHIBITED**
- **Rail dowels in bearing blocks: PROHIBITED** — install external to carriage for heeling
- **Welding of rails: PROHIBITED**

### 3.2.8 Shafting
- [Pending extraction]

### 3.2.12 Springs
- [Pending extraction]

### 3.2.16 Power Transmission Chain
- [Pending extraction]

### 3.2.18 Conveyor Chain
- [Pending extraction]

### 3.3 MOTORS, GEAR MOTORS, SPEED REDUCERS

**Key Rules:**
- All speed reducers: **minimum service factor of 2.0** (Class 3 Heavy Shock) — operating load = 50% of reducer's ultimate capacity
- Single-speed motors: **minimum service factor NEMA 1.25 or IEC Duty Cycle S1**
- **Hollow output shaft gearmotors >60 lbs / 27kg:** requires overhead clearance for lift assist removal
- **Foot-mounted speed reducers:** use thru-hole mounting, **stainless steel shims only** for soft-foot correction
- **Foot-mounted reducers: 1 inch / 25mm thick plate minimum**
- Gear teeth: **carburized case or induction hardened 58-62 Rockwell C**
- **All speed reducers: pre-filled with Ford-approved synthetic lubricant from factory**
- Motors: **TEFC (Totally Enclosed Fan Cooled)**, **IP54** minimum
- Motors: **Class "F" Insulation, 4000 VAC RMS**
- **2-speed motors: PROHIBITED**
- VFD-driven motors: **"Inverter-Duty" or "Vector-Duty" rated**
- **Brakes: spring-set (Power-Off), disk type**
- Brake sizing: **3 million cycles minimum**; sized for **2x motor nameplate torque**
- Integral mounted brakes: manual release required

### 3.4 MAGAZINE PART FEEDERS
- [Pending extraction]

### 3.5 ACCUMULATING PALLET CONVEYORS
- [Pending extraction]

### 3.7 BELT CONVEYORS
- [Pending extraction]

### 3.8 MANUAL LIFT ASSIST, RAIL SYSTEMS, BALANCERS, HOISTS — KEY RULES

**Critical Requirements:**
- **All lift assists:** MFMEA required
- **Risk Assessment** required at **25% Design phase**
- **Two-hand controls with anti-tiedown logic** required for ALL motions unless SOW states otherwise
- **Part-load lift assists:** rigid structure (torque-tube design) preferred over flexible
- **Class A surface contact:** avoid or protect with 40-45 durometer urethane max
- **Nets and clamp fingers on non-Class-A parts:** hardened steel **HRC 58-62**
- Hook and loop fastening for hoses/wires — **"Zip-ties" PROHIBITED** unless local code requires
- **Pneumatic tubing color codes:**
  - Pressure Feed — **BLUE**
  - Extend to Work Position — **RED**
  - Retract to Home Position — **WHITE**
  - Vacuum – Magnetic Clamp On — **WHITE**
  - Vacuum Blow Off — **BLUE**
- Lift assist handles: **right handle = Common, Up, Down** (color-coded: Common=White, Down/Home=Red, Up/Advance=Green)
- All moving components: **Safety Orange**
- **Lift assist devices hung solely from balancer:** modular construction with carbon fiber elements
- Articulating arm/mast/boom/jib designs: **aluminum construction PROHIBITED** without Deviation approval
- **Aluminum construction prohibited** for mast, boom, jib, articulated designs
- **Brakes on articulating arms:** active brakes must withstand **2.0x dynamic forces** when brake set during motion
- Hard stops on articulating arms: must withstand **2.0x dynamic forces** from hard stop encounter
- **Secondary restraints required** where single fastener failure could cause overhead equipment to fall (per FAS08-145)
- Secondary restraint: **never attached to primary attachment point it protects**
- **Rated load marking required** on each side of crane/monorail bridge and hoist — legible from ground/floor

### 3.9 SPECIAL MANUFACTURED HOOKS
- [Pending extraction]

### 3.10 BODY AND PAINT SKIDS
- [Pending extraction]

### 3.11 FLOOR MOUNTED STRUCTURES
- **Professional Engineer approval** required for design
- **Welder qualification** required
- Lanyard anchorage points and horizontal lifelines: [details pending]

### 3.12 LUBRICATION
- [Pending extraction]

### 3.13 PREVENTING SHAFT FRETTING
- [Pending extraction]

### 3.14 TURN TABLES, TOOL TRAYS, TRUNNIONS
- [Pending extraction]

### 3.15 RACK LOCATING AND INDEXING RACKING SYSTEMS
- [Pending extraction]

### 3.16 FASTENER FEEDING SYSTEMS
- [Pending extraction]

### 3.17 LINE SIDE EQUIPMENT
- [Pending extraction]

### 3.18 ROBOT END EFFECTORS, ROBOT RISERS, HOLD TABLES
- [Pending extraction]

---

## Section 5 — Robots (EXTRACTED — KEY RULES)

### 5.1 General
- All robot applications shall be processed to **minimize any flex of dressing**
- Robot dress brackets: **bolted** — not welded to robot
- Robot dress brackets: **free of burrs and sharp edges**
- Robot dress shall **not contact sheet metal**
- **"Saddles"** required when dress hoses/cables routed from elevated cable tray to robot
- Dress bracket liners: **compliant enough** to prevent pinching off utilities
- **Straps** for gathering dress: must endure life cycle forces, readily removed/reinstalled
- **Thick non-flammatic synthetic reusable straps** — not tie-wraps
- Cables and hoses shall **not contact the floor**
- **Soldered connections on self-friction cable: PROHIBITED**
- Robot control cable track: **shall NOT be used to hold robot dress cables/hoses**
- Robot dress cables/hoses: **shall NOT be attached to robot control cable track**
- **Servo weld gun power/communication/I/O cables:** ordered with individual corrugated sheathing

### 5.2 Dress Packages
- **2500 cycle run:** Tier 1 match-marks robot dress rotational/translational relations of straps, protection donuts, brackets relative to umbilical
- Tier 1 addresses any dress package issues during 2500 cycle run
- **Dress package checklist** completed prior to buyoff
- **MTTR (Mean Time to Replace) for dress packages with umbilical/sheathing: 0.5 hours max** — Tier 1 must demonstrate this

### 5.3 Internal Dress Package Requirements
- All internal wiring: part of **base robot**
- **3 Phase Voltage connectors on robot:** isolated from robot arm
- Water hose colors: per Section 2 – Design

### 5.4 Controls — KEY RULES
- **"Clamp and Hold" selector switch** required for dimension-setting robot stations — inhibits robot initiate, displays "Clamp and Hold Enabled, Robots Disabled"
- **Auto power off:** robots programmed to remove drive power after **5 minutes of no motion**
- **Robot load operations:** require Abort Pick-up Mode
- **Overlap of adjacent robot work zones:** must be shown with proper interlocks to prevent crashes

### 5.5 Robot Sizing
- Tooling supplier verifies robot size to application **prior to ordering robots**
- **Late changes to larger robot** requires approved deviation — tooling supplier responsible for added cost/timing

### 5.6 Tool Changer
- Tool adapter holding fixture: **RFID safety-rated switch** indicating tool adapter is in position
- **Separate "tool in stand" switch** tied to PLC input
- Dust cover required to prevent contamination of **480V and 110V contacts**
- Tool adapter holding fixture: **compliant die springs** for vertical/radial tolerance
- **Tool adapter holding fixture shall NOT clamp tool adapter** in place
- Tool adapter holding fixtures: **one dedicated gun maximum** per stand

### 5.7 Robot End Effector
- **"Qualification Part verification program"** required — robot moves to position short of contact for teach mode

### 5.8 Tool Changer Requirements (Future Flexibility)
- Material handling end effectors: **capable of retrofitting tool changers** for future model requirements
- Tool changer weight and offset: accounted for in robot sizing
- **SPACERS REQUIRED** between robot face plate and end effectors to protect for future tool changer addition

### 5.9 Robot Backup Procedure (Legacy PLC-5)
- [Detailed step-by-step procedure in full doc]

### 5.10 Weld/No-Weld Interlocking
- **Weld Complete Delay:** programmed in weld timer = **ten cycles or greater** (not required with servo weld guns)

### 5.11 Robot Teach and Manual Motion
- Body Flex System (Sullivan Hockey Puck Compliance): **NOT to be used with docking end effectors**
- Docking end effectors: must use **Fanuc Soft Float** or **Kawasaki Soft Servo** only

### 5.12 Robot Programming Guides
- **No AS programming** unless approved by Ford VOSS representative
- Robot program start point = same physical location as robot program end point
- **First step after "Move to Pounce"** shall be off of home position
- **Auto power off:** remove drive power after **5 minutes of no motion**
- Each model: **own robot program** in robot controller
- **Linearization tables:** validated and signed off by VOSS personnel for sealer robots

### 5.12.4 Robot Zones — CRITICAL
- Robot Zone Documentation: required in **1A5 Drawing Controls Application Drawing package (Sheet 1A5-200)**
- Complete robot zone logic: **resides in BOTH robot AND PLC** — both must comply to Ford Standard
- **Robot zone validation:** full procedure with step-by-step testing at 10%, 25%, 50%, 75%, 100% speed
- Robot zone logic validation: **signed off by both PLC and robot programmer**, reviewed by Ford VO controls design follow-up

### 5.12.5 Maintenance Positions
- Tip dress/maintenance: robot completes last **two feet / 60cm** at max **5 inches / 130mm per second**
- Robot positioned so any motion is **AWAY from operator**
- **Dutch door** provided for all applications except single-function material handling end effectors

### 5.12.6 Servo Weld Guns
- Servo weld gun cables: provided by **robot manufacturer**
- Tip wear correction logic: detailed procedure per programming guides
- Actual weld force: **within ±5% of intended weld force** for any weld schedule

### 5.13 Re-Deployment of Robots
- **Kawasaki "AD" Controller and earlier: NOT compliant** with ANSI/RIA 1506-1999
- **"C" Controller and later: compliant** (may need teach pendant upgrade)
- Only robots in full compliance with **ANSI/RIA 1506-1999** may be used for new processes

### 5.14 Operator Loads Directly to Robot — CRITICAL
- Robot end of arm tooling = part nest/load tooling; robot and operator **share same workspace**
- Power removed from all devices creating hazard to operator when operator enters
- Operator permitted to load directly to robot **ONLY when ALL conditions met:**
  1. Robot in **taught reference position** for load position
  2. Output power to robot end effector **interrupted** (control reliable)
  3. Robot servomotor power **disabled and verified** (control reliable)
  4. Verified robot still in reference position (**within 5mm**) after motor power disabled
- If any condition not met when operator enters shared space: **E-stop to that robot**
- **Robot end effector shall be designed such that part retention is maintained upon loss of power**
- **Additional blue stack light** required at operator load station indicating robot motor power disabled

### 5.15 Robot Loading/Unloading to Press or Hemmer
- Light screen tied to press/hemmer tower-enable circuit — enables robot motion **only when robot is clear**
- Alternative: robot safety zones (DCS/Cubic-S) to verify robot is clear when tower motion permitted

### 5.16 Force Sensitive Robots (Cobots) — CRITICAL
- **Plan must be reviewed with VO safety** before any engineering begins
- **Only Force Sensitive Robots on w-E1-QSSL** (Electrical Qualified Safety Source List) can be used
- Must comply with **FAS08-131** and attachment 1 "Collaborative Robots and Robotic Systems"

---

## Section 8 — Control Logix
- [Pending extraction]
