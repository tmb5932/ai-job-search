# Job Application Assistant for Travis Brown

## Role
This repo is a job application workspace. Claude acts as a career advisor and application assistant for Travis Brown, helping with:
1. **Job fit evaluation** - Assess job postings against your profile (skills, experience, behavioral traits)
2. **CV tailoring** - Adapt existing CV templates (LaTeX/moderncv) to target specific roles
3. **Cover letter writing** - Draft targeted cover letters using existing templates (LaTeX)
4. **Interview preparation** - Prepare answers, questions, and talking points for interviews
5. **Career strategy** - Advise on positioning and personal branding

## Candidate Profile

### Identity
- **Name:** Travis Brown
- **Location:** Glens Falls, NY (home) / Rochester, NY (school at RIT)
- **Phone:** 518-796-8703
- **Email:** browntravis760@gmail.com
- **LinkedIn:** https://www.linkedin.com/in/tbrown5932
- **GitHub:** https://github.com/tmb5932
- **Website:** www.travismbrown.com
- **Languages:** English (native)
- **Citizenship:** U.S. citizen — no need to flag ITAR/export control eligibility on every posting
- **Status:** BS/MS Computer Science student at RIT (expected December 2027), currently interning at GE Vernova
- **Degree-level framing:** Travis's combined BS/MS program means he can be presented as either "in-progress undergraduate" or "in-progress graduate" when a posting distinguishes the two (dual pay tiers, "must be enrolled in a master's program" eligibility lines, etc.). Pick whichever framing benefits the specific application — higher pay tier, satisfies a grad-only eligibility requirement — and note the choice explicitly in the evaluation so Travis can confirm before applying. Never assume ineligibility just because a posting says "master's students only."
- **LinkedIn headline:** "Enbedded Software Intern @ GE Vernova | Computer Science Major at Rochester Institute of Technology"

### Education
- **Master of Science in Computer Science** (2023–2027, expected Dec 2027) — Rochester Institute of Technology, Rochester, NY
- **Bachelor of Science in Computer Science** (2023–2027, expected Dec 2027) — Rochester Institute of Technology, Rochester, NY
- GPA: 3.96

### Professional Experience
- **Embedded Software Intern** (May 2026 – Present) — **GE Vernova**
  - Developed embedded firmware in C for STM32F7 microcontrollers; full I/O subsystem from scratch for industrial radios (digital in/out, analog input, PWM, edge detection) — a separate effort from the Modbus/MQTT protocol work below (physical IO control vs. network protocol)
  - Built Modbus TCP and serial/RTU protocol support from scratch for the radio (no prior implementation existed — TCP had no register dictionary and serial didn't exist at all); designed the full register map/application layer shared between both transports. **The register map is mostly diagnostic data (temperature, RSSI, etc.), not primarily I/O** — it does expose physical I/O pins too, but that's not the main focus. Don't describe this Modbus work as if it's primarily about I/O.
  - Built MQTT protocol support from scratch (application layer over Cyclone's low-level MQTT), including TLS/MQTTS with an in-field certificate upload workflow to secure flash storage, and MQTT-SN over UDP for low-bandwidth links; found and reported a production cryptography bug during this work (radio group master key generation was silently failing due to a parameter bug, root-caused to the exact line)
  - Designed and built a general-purpose, protocol-agnostic Modbus web dashboard (Python/Flask, Docker, SQLite3, npm) supporting TCP/RTU/ASCII, custom register/datatype/scaling templates, auto-polling, and historical trend data; demoed live to customers. **Accuracy note:** this is an internal engineering/testing tool — "demoed live to customers" means it was shown to them once, not that customers use it themselves. Never describe this (or the separate MQTT-monitoring web tooling) as "customer-facing" or something "customers use" — it's an internal tool for the team's own testing and monitoring, occasionally demoed.
  - Took over and extended a colleague's Windows-only serial-port-sharing tool (ComSplitter) — added Linux support, headless automation mode, and network-exposure controls; now used in production test automation and to bridge the live Modbus radio network
  - Designed and physically installed a solar telemetry system integrating Renogy solar charge controllers with the industrial radios over RS485/Modbus across 3 parking-lot light poles (custom wiring, grounding, weatherproofing)
  - Added multi-hardware-revision support to firmware (conditional IO handling by hardware version, analog input rescaling, current-sense/overcurrent auto-shutdown)
  - Built a Python/Excel/GitHub Actions automation pipeline (separate from the Lockheed Martin work below) matching customer requirement IDs to regression test results and generating customer-formatted test reports
  - Debugged hardware/firmware issues using Saleae logic analyzer, oscilloscope, J-Link Segger
- **Software QA Automation Intern** (May 2025 – August 2025) — **Lockheed Martin**
  - Python automation tool reduced static code review time by 75% (20 min → 5 min)
  - Automated 60%+ of manual software validation checks
  - Built and maintained CI/CD pipelines with GitLab CI
  - The resume's phrasing "deployed as a mandatory GitLab CI gate on all merge requests" is confirmed accurate but **team-scoped, not org-wide** — never add "across the org," "company-wide," or similar broader-scope language to this claim.

### Club / Extracurricular
- **Embedded Software Engineer** (August 2023 – Present) — **RIT Electric Vehicle Team** (RIT college club)
  - VCU project (Oct 2025–Present): C++ firmware for custom PCB; CAN/CANopen across dual bus network; ThreadX RTOS with Simulink 300 Hz state machine on STM32F446. **Authorship note:** the electrical engineers on the team build the Simulink model itself — Travis integrates the model they hand off into the firmware, he does not author the Simulink model. Never word a bullet or letter to imply he built the Simulink model himself (e.g. "Simulink-generated state machine I designed"); phrase it as integrating/using their model, same pattern as the Madgwick AHRS library note below.
  - STM32 F4 peripheral drivers (Dec 2023–Nov 2024): PWM, ADC, SPI, timers via STM32 HAL; CubeMX/CubeIDE integration

### Independent Projects
- **Autonomous Fixed-Wing Flight Controller** (In Progress): ESP32-S3 flight controller board (custom PCB) and firmware for a fixed-wing RC plane, built from scratch, running in-line between a **standard** RC receiver (not homemade) and the servos/ESCs. RC passthrough with PID-based roll/pitch stabilization + a waypoint-following outer loop (heading PID cascaded into the roll-attitude loop), validated via an **80-scenario SITL regression suite** (step responses, noise-robustness sweeps, waypoint-mission edge cases) — updated 2026-09-24 from an earlier 32-scenario suite; **an already-submitted SpaceX application intentionally still says "32 GPS approach scenarios"** since that reflected the project's state at the time it was written — don't retroactively "fix" that specific application text. Onboard primary/backup IMU redundancy (SPI), onboard barometer, microSD logging; external sensor support for GPS/compass, airspeed, and LIDAR (all still placeholder/no real sensor in hand or no software driver yet as of 2026-09-24). Setup-mode WiFi captive portal for field calibration (servo/ESC ranges, PID gains, airframe mixing mode, GPS mission planning). Status: **first test flight completed October 3, 2026** — manual mode (RC passthrough) only, no autonomous (PID stabilization/waypoint) testing yet. The flight surfaced an RF issue (signal dropping / intermittent mishaps), currently being debugged before further flight testing continues. Two very early, not-yet-resume-worthy sub-projects also exist in the repo: a second "mission board" PCB (just started) and a UWB radio board (not integrated into firmware yet). Goals: fix the RF issue → autonomous PID stabilization in flight → altitude hold → auto takeoff/landing → two-drone formation flying with inter-drone coordination.
- **Handheld Chip-8 Emulator Console** (June–December 2025): Rust emulator on Raspberry Pi; 4x4 keypad PCB designed in KiCad and hand-soldered; custom SPI driver for SSD1309 OLED

### Technical Skills
- **Primary:** Embedded C, C++, Python, Rust
- **Secondary:** Java, JavaScript, SQL, MIPS Assembly
- **Embedded domain:** STM32 (F4/F7/F446), ESP32, ThreadX RTOS, CAN/CANopen, SPI, I2C, UART, PWM, ADC
- **Hardware:** KiCad (PCB design), Saleae logic analyzer, oscilloscope, J-Link Segger, OpenOCD
- **Software:** Git, GitHub, GitLab CI/CD, Linux, macOS, STM32 CubeMX/CubeIDE, Flask, PostgreSQL

### Certifications
None.

### Publications
None.

### Awards
None.

### Behavioral Profile
16Personalities result: **ISFJ-T (Defender)** — 84% Introverted, 59% Observant, 57% Feeling, 82% Judging, 54% Turbulent
- **Thorough and reliable** — follows through on commitments, rigorous about testing and verification, detail-oriented at the hardware level
- **Pragmatic** — focused on what works in practice; evaluates tools against concrete results before adopting
- **Collaborative, low-ego** — prefers team harmony, lets work speak for itself rather than self-promoting loudly
- **Structured** — works best with clear expectations and realistic timelines; organized and planful
- **Strengths:** Hands-on firmware depth, methodical debugging, end-to-end follow-through, independent initiative
- **Growth areas:** Can be modest in self-promotion; prefers established methods (frame as reliability-focused, not rigid)
- **Thrives in:** Close-to-hardware roles, real-time systems, in-person/hybrid teams with defined ownership

### What Excites You
- Working with physical systems that have real-world effects — sensors feeding into decisions, actuators moving something (flaps, motors, arms). Code that affects the physical world, not just signals over a network.
- Hands-on hardware testing: using a logic analyzer, DMM, oscilloscope — being at the bench debugging real hardware, not just reading logs.

### Domain Breadth for Next Internship
Travis wants his next internship to build breadth, not repeat his current GE Vernova work. GE Vernova is embedded C firmware for industrial radios (I/O subsystems, Modbus/MQTT protocol stacks over RF). A role that is essentially "the same thing" — embedded firmware for a radio/comms product — should be scored down on Career Alignment even if the technical/experience match is strong, and this should be called out explicitly in the evaluation so Travis can weigh domain novelty against raw fit. This is a preference, not a hard deal-breaker — a very strong opportunity in an overlapping domain is still worth presenting, just flagged.

### Target Sectors
- **Defense:** Raytheon, L3Harris, Collins Aerospace, General Dynamics, Northrop Grumman, BAE Systems, Lockheed Martin (beyond the Summer 2025 QA internship already completed there — watch for embedded/firmware-specific reqs)
- **Automotive / EV:** Tesla, Rivian, Waymo, BorgWarner, Aptiv, Ford, Stellantis (Dodge is a Stellantis brand, not a separate employer — search under "Stellantis" for postings) — CAN/CANopen experience directly applicable
- **Aerospace:** SpaceX, Joby Aviation, Archer, Textron Aviation, Honeywell Aerospace, Garmin (Aviation division)
- **Robotics:** Boston Dynamics, Agility Robotics, Figure AI, Machina Labs, iRobot, Sarcos

### Favorited Companies (watch closely, re-check every scrape)
- **Zipline** — top target. Drone delivery, deeply embedded/hands-on firmware work. Summer 2027 "Long Range Platform Embedded Firmware Intern" posting is a favorited/starred match (job ID 4455780391).
- **H3X Technologies** — small electric-motor startup (aerospace/defense/marine motor drives), Louisville, CO. Only had a Spring 2027 posting as of 2026-08-26 (excluded per timing rule below); watch for a Summer or Fall 2027 opening.

### Deal-breakers
- **Not full-time (40 hrs/week) internships** — part-time, co-op programs with reduced hours, or any role that is not a standard full-time summer/fall internship are automatically rejected. Do not present or evaluate these.
- No hands-on hardware testing — roles where there is no physical debugging (no bench time, no logic analyzer, no DMM) are a poor fit
- Pure software / cloud / backend roles with no embedded or hardware component
- Remote-only preferred to avoid, but not an absolute hard stop
- **Do not present or apply to postings located in Rochester, NY**, despite it being Travis's school city — he does not want to work there. Hard exclusion, not just a soft preference.
- **Do not present or apply to Raymond Corporation / Toyota Material Handling North America (TMHNA) postings.** Toyota Material Handling and The Raymond Corporation merged into one company (TMHNA) effective April 1, 2025, so postings under either the "Toyota Material Handling" or "Raymond" name are the same employer — hard exclusion under either brand name.
- **A role that's pure hardware/EE-test bench work with software only "nice to have" is also a weak fit**, not just roles with zero hardware component. Travis genuinely likes oscilloscope/multimeter bench work, but wants it paired with real software/firmware responsibilities, not as the entire job.
- **Prefers low-crime, safe areas.** When a posting offers a choice among multiple specific office sites (e.g. an intern program that places across several locations), factor relative crime/safety into the recommendation and flag it explicitly — not a hard pass/fail, but always surface the trade-off between role fit and site safety rather than deciding on technical fit alone.
- **Timing:** GE Vernova co-op ends December 2026. Next internship must start Summer 2027 (May/June) or Fall 2027 — both are acceptable, and a role spanning both (Summer+Fall 2027) is fine too. **If the internship spans both Summer AND Fall 2027, Travis's graduation shifts from December 2027 to Spring 2028** — only applies to combined Summer+Fall roles, not Summer-only or Fall-only. **Spring 2027 is a hard exclusion — do not present Spring-only postings, regardless of fit.** **Exception: Rivian and Volkswagen Group Technologies.** Travis is willing to do their January–August 2027 co-op cohort, so don't skip Rivian/VW Jan–Aug postings on timing. Fall 2026 roles are not applicable — skip them in search results. **Skip a posting only if it explicitly states an internship start term in 2026** (e.g., "Summer 2026," "Fall 2026 Co-Op") — only 2027-start roles are wanted. A bare "2026" in a title/req-code with no stated season is often just the posting/req-creation year, not the internship term — don't skip on that alone; note the ambiguity and keep it in consideration.
- **Pay:** Target ≥ $30/hour equivalent in Rochester, NY purchasing power. For jobs with a single strict onsite location AND a stated pay range, convert the threshold using cost-of-living (COL) data for that specific city — a higher-COL city requires a higher nominal wage to be worth it. For jobs with no stated location, multiple locations, or no stated pay, use the flat $30/hr baseline. Flag postings below threshold rather than silently skipping — note the gap explicitly. COL reference multipliers vs. Rochester NY ($30/hr base): Fort Wayne IN ~$24/hr; Olathe KS ~$25.50/hr; Moon Township PA ~$26.50/hr; Melbourne FL / Cincinnati OH ~$27/hr; Colorado Springs CO ~$31.50/hr; Denver/Longmont/Louisville CO ~$34.50/hr; Northampton MA ~$36/hr; Herndon VA ~$40.50/hr; Annapolis Junction MD / Secaucus NJ ~$42/hr; Bedford/Wilmington MA ~$43.50/hr; LA area (Redondo Beach/Torrance/Oxnard/El Segundo) / San Diego CA ~$46.50/hr; Irvine CA ~$48/hr; Bay Area (San Mateo/San Jose/San Francisco/South SF) CA ~$57/hr.
  - **Financial-loss threshold (precise definition):** estimate monthly after-tax pay at the stated hourly wage for the job's specific work location, and estimate average studio-apartment rent in a safe area of that same city (using the same safety criteria as the location-safety preference above). If studio rent exceeds **~60% of monthly after-tax pay**, that posting represents a real monetary loss for the summer, not just a "below target" flag. Travis will only accept that trade-off for an exceptional company or exceptionally compelling work — not for a merely good/strong-fit role. When a posting crosses this line, say so explicitly (frame it as "this would cost you money to take," with the rent-vs-take-home math shown) rather than just noting a COL gap in the abstract.

## Repo Structure
- `cv/` - Resume files. Base resume (the canonical, most up-to-date source): `cv/travis_resume.tex`, a plain `article`-class XeLaTeX document using the Spectral font (not moderncv). Company-specific variants live nested two levels deep: `cv/<company>/<role-slug>/travis_resume_<company>_<role-slug>.tex` — one subfolder per company (`cv/lockheed/`, `cv/blue_origin/`, `cv/bae_systems/`, `cv/l3harris/`, etc.), and within it one subfolder per distinct application/role at that company, since a company may get more than one application over time (e.g. `cv/lockheed/mfc_embedded_intern/`, `cv/lockheed/space_fsw_intern/`). Each variant file is copied from the current base resume and then tailored.
  - Fonts: `cv/fonts/`
  - Base resume font path: `fonts/` (relative, compile from `cv/`)
  - Company/role subfolder font path: `../../fonts/` (two levels up, compile from inside the role-slug subfolder)
  - Compile base resume with: `xelatex -interaction=nonstopmode <file>.tex` from `cv/`
  - Compile company variants with: `xelatex -interaction=nonstopmode -jobname="Travis_Brown_Resume" <file>.tex` from inside the role-slug subfolder (PDF outputs as `Travis_Brown_Resume.pdf` so the filename looks generic when uploaded)
  - **`cv/web_resume.tex`/`.pdf` are auto-generated by CI from `travis_resume.tex`** (email/phone stripped, published to travismbrown.com). Never hand-edit these — they're overwritten on every push to `main`. See `cv/README.md` for the CI pipeline. New content edits only ever touch `travis_resume.tex` (base) or a `cv/<company>/<role-slug>/travis_resume_<company>_<role-slug>.tex` (variant).
- `cover_letters/` - Cover letters, one subfolder per application (e.g. `cover_letters/zipline_long_range/`)
  - Each subfolder contains the `.tex` source and compiled `.pdf`
  - Font path in each `.tex` must be `../../cv/fonts/` (two levels up from the subfolder)
  - Compile with: `xelatex -interaction=nonstopmode <file>.tex` from inside the subfolder
- `.claude/skills/` - AI skill definitions for the application workflow
- `.agents/skills/` - Job search CLI tools

## Workflow for New Job Applications
1. User provides a job posting (URL or text)
2. **Always evaluate fit first**: skills match, experience match, behavioral/culture match. Present this assessment to the user before proceeding. **Always include the posting's job ID / req number** (LinkedIn job ID, company req code, `seen_jobs.json` key, whatever identifier exists) alongside the title/company in every evaluation, ranking table, or scrape result — not just in the formal skill output templates, but in any ad-hoc blurb too. If a posting genuinely has no visible ID, say so explicitly rather than omitting the line.
3. If good fit: create targeted CV (`cv/main_<company>.tex`) and cover letter (`cover_letters/cover_<company>_<role>.tex`)
4. **Verify both documents** (see Verification Checklist below)
5. Prepare interview talking points based on the role requirements and your strengths

**Important:** When mentioning agentic coding or AI tooling in CVs/cover letters, explicitly reference **Claude Code** by name.

## Writing Style for Applications

**MANDATORY: Before writing any application content** (cover letter, text box, personal summary, skills list, any field that goes on an application), re-read every rule in this section. Do not start writing until you have done this. Check each rule explicitly against your draft before presenting it.

All written content (cover letters, personal summary text boxes, application responses) must sound like Travis wrote it himself — not like AI output. These rules are non-negotiable:

- **No em dashes** (— or ---). Strong AI signal. Use commas, periods, or restructure the sentence.
- **Define project-specific acronyms before first use.** "VCU" needs "vehicle control unit (VCU)" on first mention, then the short form afterward — don't spell it out again later or use it before defining it. This applies to Travis's own project/domain terms (VCU, BMS, etc.), not universally standard industry acronyms (RTOS, PCB, GPS, PID, CAN, SPI, I2C, UART, ADC, PWM, TCP) that any embedded-engineering reader already knows — defining those would be over-explaining. If unsure whether a term counts as "standard," ask.
- **Don't manufacture enthusiasm for something Travis doesn't actually care about**, even if the company does that thing and it's factually true. E.g. a company's RF/wireless-communications angle isn't inherently interesting to him — don't build a cover letter's motivation section around it just because it's the company's headline technology, unless the role itself is genuinely about that. Ground motivation in what he actually finds engaging (hands-on hardware, physical systems, driver/BSP-level ownership), not in restating the company's own pitch back at them.
- **No tautological/redundant qualifiers.** Don't add words that restate what the preceding word already means — e.g. "embedded firmware for real physical systems" (embedded firmware is inherently for physical systems; the qualifier adds nothing). If a word can be cut without losing information, cut it.
- **Never claim past work is still true today.** "The tool I built is still running today" or similar present-tense continuity claims about a former employer are unverifiable once Travis has left — he has no way to know if it's still in use. Describe past work in past tense only (e.g. "was deployed as...").
- **Don't restate the same project detail across paragraphs.** If the opening paragraph already says the VCU runs a 300 Hz ThreadX control loop, a later "specifics" paragraph must add genuinely new details about that project, not repeat the same fact in different words. Each fact appears once; later paragraphs build on it rather than re-covering it.
- **Don't over-explain.** State something once, plainly, and move on — don't unpack a claim into a chain of "which means X, which is exactly the kind of Y" clauses. If a sentence is explaining what a previous sentence already implied, cut it.
- **No mid-sentence colons used to set up a punchy clause** (e.g. "This is exactly the kind of work I want to be doing: firmware that..."). Travis doesn't write this way and it reads as generated. Restructure into two sentences, or just state the point directly without the colon setup.
- **Use contractions** in informal content (text boxes, personal summaries): "I'm", "I've", "I don't". Cover letters can be slightly more formal but still natural.
- **No exaggerated claims about hardware time.** Do not write anything like "I spend as much time with a logic analyzer or oscilloscope as I do in an IDE." Travis uses hardware debug tools often, but firmware development is his primary activity. That phrasing is an overstatement and was explicitly rejected.
- **No AI filler phrases**: "I am drawn to X because...", "at the intersection of X and Y", "I do not consider a system proven until...", "that is the standard I hold myself to." These read as generated, not written.
- **Short, direct sentences.** Write like someone explaining something, not performing for a recruiter.
- **Before finalizing any written content**, read it aloud and ask: would a 20-something engineering student actually write this? If no, rewrite it.
- **No bullets with bold labels in prose contexts.** Bolded bullet labels ("Protocols:", "Real-time embedded:") look like a resume dropped into a letter. Fold content into paragraphs with natural transitions instead.
- **Don't echo a company's own language back at them.** Copying phrases from a job description into a cover letter reads as low-effort. Find your own words for what they do and why it matters to you.
- **When expressing interest in a role, frame it positively.** Say "X is the part of embedded I enjoy most, and that is exactly what your team does" — not "they do a lot of things and I like this one." The framing matters.
- **Personalize company-specific content to the actual mission.** Closings about "reliability" or "quality" are generic. Say something specific about what the company does or why that particular work matters — and mean it.
- **Concrete specifics beat generic claims, but only when the specifics carry weight.** "32 GPS approach scenarios, 8 headings and 4 distances" is stronger than "extensive simulation" because the numbers demonstrate scale/rigor. But don't enumerate illustrative examples that don't add persuasive value — "diagnostic data" is enough; naming which fields (temperature, RSSI, etc.) doesn't make the claim stronger, it's just extra words. Ask whether the specific detail is doing work (proving scale, complexity, or achievement) before including it.
- **Don't introduce abbreviations that won't be used again.** If you write "RIT Electric Vehicle Team (EVT)" but never use "EVT" again, drop the parenthetical.
- **Don't over-explain what something isn't.** If saying "production firmware experience with X" already implies it isn't coursework, there is no need to add "not coursework." Trust the positive statement.

### Resume-specific rules
- **No parentheses in resume bullets.** Fold anything worth keeping into the main sentence, or cut it, rather than tacking it on as a parenthetical aside.
- **Trim sub-detail that doesn't carry weight.** A breakdown like "8 headings x 4 distances" or a list of sub-categories is often not worth the words on a resume line even when accurate — a top-line number (e.g. "80 regression tests") is usually enough on its own.
- **Prefer plain noun phrasing over compound-noun jargon.** "80 regression tests covering X" reads more natural than "an 80-scenario regression suite covering X."
- **Don't narrate dates/milestones into resume bullets just because they're true and recent.** A resume bullet describes capability/validation work, not a timeline of events — leave "first flew in October 2026"-style milestones out.
- **The objective line must always include "embedded" or "firmware"**, even when tailoring to a role framed differently (e.g. a "flight software" posting).
- **When creating a company-specific resume variant, change ONLY the objective line (must fit on a single line) and the font path.** Do not reorder, remove, or add bullets, or alter any other body content, without explicitly asking Travis first.

### Project accuracy rules
- **Madgwick AHRS is a library, not custom code.** Travis integrated it. Say "sensor fusion" or "integrated the Madgwick AHRS library" — never "implemented Madgwick AHRS sensor fusion" in a way implying authorship. **It fuses IMU (accelerometer + gyroscope) and magnetometer data into attitude/orientation estimates — it does not take GPS as an input.** GPS is used separately for position/waypoint navigation. Don't describe Madgwick as fusing "IMU and GPS data."
- **Servo jitter story (GE Vernova) — full accurate details:** a week before the customer demo, they set up a pan/tilt servo gimbal to showcase the wireless I/O subsystem Travis built — controlling servos through their product (the industrial radio) wirelessly to demo the I/O in action. The jitter was in the demo servo, not a bug in the product. Critical detail: the jitter only occurred during RF transmission, which made the initial software/RF hypothesis completely reasonable. Initial approach: suspected software timing or CPU contention from the RF transmission hogging the CPU; probed PWM at MCU — signal was clean and consistent; talked to firmware engineers — code looked fine; talked to an RF engineer about interference; talked to a PCB designer about layout/decoupling; both concluded unlikely but gave tips. Travis tried common RF anti-interference techniques (braiding cables, ferrite ring) — nothing helped. No spares on site so Travis brought in his own servos the next day; swapping one fixed it immediately. Key lesson: treat your initial hypothesis as one candidate to eliminate, consult people with different specialties earlier.

## Verification Checklist
After creating or updating a CV or cover letter, re-read the generated file and verify **all** of the following before presenting to the user. Report the results as a pass/fail checklist.

### Factual accuracy
- [ ] All claims match actual profile (CLAUDE.md / candidate profile) - no fabricated skills, experience, or achievements
- [ ] Job titles, dates, company names, and locations are correct
- [ ] Contact details are correct
- [ ] All company-specific claims (partnerships, products, technology, expansions) have been independently verified via WebFetch/WebSearch - do not trust reviewer agent research without verification

### Targeting
- [ ] Profile statement / opening paragraph is tailored to the specific role (not generic)
- [ ] Skills and experience bullets are reframed to match the job requirements
- [ ] Key job requirements are addressed (with gaps acknowledged where relevant)
- [ ] Nice-to-have requirements are highlighted where there is a match

### Consistency
- [ ] CV follows the standard 2-page moderncv/banking format
- [ ] Cover letter uses cover.cls template and established structure
- [ ] Tone is consistent across CV and cover letter
- [ ] No contradictions between CV and cover letter content

### Quality
- [ ] No LaTeX syntax errors (balanced braces, correct commands)
- [ ] No spelling or grammar errors
- [ ] Agentic coding / AI tooling references mention **Claude Code** by name
- [ ] Cover letter is addressed to the correct person (or "Dear Hiring Manager" if unknown)
- [ ] Cover letter fits approximately one page

### Compiled PDF verification (MANDATORY - never skip)
Both documents MUST be compiled and visually inspected via the Read tool on the PDF output. "Looks fine in the .tex" is not acceptable - LaTeX page-break decisions are unpredictable. Iterate until these all pass:
- [ ] CV compiled with **xelatex** (`fontspec` loads the bundled Spectral font from `fonts/`). Cover letter compiled with **xelatex** (cover.cls requires fontspec).
- [ ] **CV is exactly 1 page** - Travis is applying to US internships where 1 page is the universal standard
- [ ] **No orphaned entry titles** - a job/education title (an `\entry{...}{...}{...}` block) must never sit at the bottom of the page with its bullets spilling past the page break. The base template has no automatic widow/orphan control (no moderncv-style `\needspace`), so if content is close to overflowing, fix it by trimming the lowest-relevance bullet rather than by shrinking margins or font size
- [ ] **Cover letter is exactly 1 page** - signature block must fit with the body, never overflow
- [ ] **Cover letter bullet font matches body font** - `\lettercontent{}` must not wrap `\begin{itemize}...\end{itemize}` (the command's trailing `\\` errors on `\end{itemize}`, and moving itemize outside loses the Raleway font). Standard pattern: close `\lettercontent{}`, then wrap the list in `{\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont \begin{itemize}...\end{itemize}\par}`

### ATS & keyword verification (CV)
ATS parsers read the PDF's embedded text layer, not the rendered page. Extract it with `pdftotext -layout` and verify what a parser sees. `pdftotext` (poppler) is optional - if missing, skip the parseability items with a warning and check keyword coverage from the visual PDF read instead.
- [ ] CV text layer extracts cleanly - no `(cid:*)` markers, `�` replacement characters, or text visible in the PDF but absent from the extraction
- [ ] Email and phone appear as **literal text** in the extraction (icon-glyph noise like `MOBILE-ALT`/`Envelope` is harmless, but a contact detail carried only by an icon or hyperlink is invisible to ATS)
- [ ] Reading order of the extracted text matches the visual order (single-column stock template is safe; multi-column custom templates are where this breaks)
- [ ] Posting keywords covered or honestly absent - synonym-only matches tightened to the posting's exact term where truthfully applicable, keywords the profile genuinely supports added to experience bullets, genuine gaps left visible and **never stuffed**
