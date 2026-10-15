# Search Queries for Job Scraper

<!-- Travis is based in the US (Glens Falls, NY / Rochester, NY). -->
<!-- The built-in CLI tools target Danish job boards and are not applicable here. -->
<!-- Use LinkedIn, Indeed, Handshake, and company career pages instead. -->
<!-- Run /add-portal to generate a scraper skill for a specific US job board. -->

## Search Sites (US)

Primary:
- **linkedin.com/jobs** — best signal for embedded/firmware internships at established companies
- **handshake.com** — strongest for student internship postings; filter by school (RIT) or role type
- **indeed.com** — broad coverage; use advanced search to filter internship + embedded keywords
- **careers.[company].com** — direct career pages for target companies (see target list below)

Secondary:
- **glassdoor.com** — useful for compensation and culture data alongside postings
- **builtin.com** — tech-focused; good for startups in the embedded/IoT space

## Query Categories

Queries are grouped by priority. Combine with location terms as noted.

### Priority 1: Defense — Embedded / Firmware Internships

Travis's strongest experience (STM32, C/C++, RTOS, protocols) maps cleanly to defense embedded roles.

```
site:linkedin.com/jobs "embedded software intern" defense
site:linkedin.com/jobs "firmware engineer intern" aerospace defense
site:linkedin.com/jobs "embedded systems intern" Raytheon OR L3Harris OR "Collins Aerospace" OR "General Dynamics" OR "Northrop Grumman" OR "Lockheed Martin"
site:indeed.com "embedded firmware intern" defense 2027
handshake.com "embedded software" defense internship 2027
```

### Priority 2: Automotive / EV — Embedded / Controls Internships

CAN/CANopen, RTOS, and real-time control experience is directly applicable to automotive ECU and EV powertrain firmware.

```
site:linkedin.com/jobs "embedded software intern" automotive OR "electric vehicle"
site:linkedin.com/jobs "firmware intern" Tesla OR Rivian OR Waymo OR BorgWarner OR Aptiv OR Ford OR Stellantis
site:linkedin.com/jobs "CAN bus" OR "CANopen" intern automotive
site:indeed.com "embedded C" "automotive" internship
site:indeed.com "ECU firmware" intern
```

### Priority 3: Aerospace / Robotics — Firmware / Controls Internships

Flight controller project adds direct relevance to aerospace and robotics actuator/sensor roles.

```
site:linkedin.com/jobs "embedded firmware intern" aerospace
site:linkedin.com/jobs "firmware intern" SpaceX OR Joby OR Archer OR Honeywell OR Garmin
site:linkedin.com/jobs "robotics software intern" embedded
site:linkedin.com/jobs "controls software intern" actuator OR sensor
site:indeed.com "embedded systems" "robotics" internship
```

### Priority 4: Broader Embedded (Wider Net)

Useful if Priority 1–3 results are thin, or to catch embedded roles at companies not otherwise listed.

```
site:linkedin.com/jobs "embedded software engineering intern"
site:linkedin.com/jobs "firmware engineering intern" STM32 OR ESP32 OR RTOS
site:indeed.com "microcontroller" "firmware" intern United States
handshake.com "embedded" OR "firmware" internship 2027
```

## Target Sectors & Companies

Priority sectors (in order): **Defense → Automotive/EV → Aerospace → Robotics**

Focus: roles where firmware controls physical systems — sensors providing input, actuators producing real-world output. Avoid pure radio/signal/networking roles with no physical actuation.

- **Defense:** Raytheon, L3Harris, Collins Aerospace, General Dynamics, Northrop Grumman, BAE Systems, Leidos, SAIC, Lockheed Martin (Travis's Summer 2025 QA internship was there — watch for a distinct embedded/firmware req, not a repeat of that role)
- **Automotive / EV:** Tesla, Rivian, Waymo, BorgWarner, Aptiv, Lear Corporation, Magna, Ford, Stellantis (Dodge is a Stellantis brand — search "Stellantis," not "Dodge") — CAN/CANopen experience directly applicable
- **Aerospace:** SpaceX, Joby Aviation, Archer Aviation, Textron Aviation, Honeywell Aerospace, Garmin (aviation division)
- **Robotics:** Boston Dynamics, Agility Robotics, Figure AI, Machina Labs, Sarcos, iRobot, Apptronik

## Location Filter

Travis is open to relocating anywhere in the US. In-person or hybrid strongly preferred; remote acceptable but lower priority.

- **Ideal:** In-person or hybrid, anywhere in the US
- **Acceptable:** Remote (US-based), flag it in evaluation
- **Borderline:** N/A — US-wide is acceptable
- **Too far:** Outside the United States

## Timing Filter

**GE Vernova co-op ends December 2026.** Only surface roles that start in:
- **Summer 2027** (May or June 2027 start) — primary target
- **Fall 2027** — also acceptable (including a role spanning both Summer and Fall 2027)

**Spring 2027 is a hard exclusion** — do not present Spring-only postings regardless of fit; log them to `seen_jobs.json` as skipped.

**Skip a posting only if it explicitly states an internship start term in 2026** (e.g., "Summer 2026," "Fall 2026 Co-Op"). A bare "2026" appearing in a title or req code with no stated season is often just the posting/req-creation year, not the internship term — don't skip on that alone; present it with the season flagged as unverified. Only 2027-start roles are wanted.

Note on graduation date: Travis graduates December 2027 normally, but **if the internship spans both Summer AND Fall 2027, his graduation shifts to Spring 2028** — this only applies to combined Summer+Fall roles, not Summer-only or Fall-only ones. Keep this in mind when checking eligibility requirements tied to graduation date.

Skip and mark as seen: Fall 2026 roles, graduate-level roles, full-time (non-internship) roles, and roles with an explicit graduation-date requirement Travis doesn't meet (he graduates December 2027, or Spring 2028 if the role itself is a combined Summer+Fall 2027 internship).

## Pay Filter

Prefer postings paying **≥ $28/hour**, especially in higher cost-of-living areas (CA, NYC, etc.). Don't silently drop postings below this — flag the pay gap in the presented results so the user can weigh it against location cost of living.

Internship posting cycle note: Summer 2027 postings from defense/aerospace/automotive companies typically open **October 2026 – February 2027**. Run `/scrape` most actively starting October 2026. Earlier scrapes are useful for landscape research but will find mostly wrong-cycle postings.

## Adapting Queries

If the user specifies a focus area, select queries from the matching category and also generate 2-3 custom queries for that focus. For example:
- "/scrape automotive" → Priority 2 RTOS/CAN queries + "automotive embedded intern" + "EV firmware intern"
- "/scrape defense" → Priority 1 + "DoD embedded intern" + "defense firmware intern"
