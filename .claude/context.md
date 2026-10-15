# Session Context for Agents

Last updated: 2026-09-09. This file captures context from recent sessions not otherwise derivable from code, CLAUDE.md, or seen_jobs.json.

---

## Active Resume: cv/travis_resume.tex

`cv/travis_resume.tex` is the base resume and canonical source (there is no moderncv template in this repo anymore — `cv/main_example.tex` was removed). It's a plain XeLaTeX resume using the Spectral font, compiled with `xelatex`. It is exactly 1 page. Company-specific variants live nested two levels deep, one subfolder per company and within it one subfolder per distinct application/role: `cv/<company>/<role-slug>/travis_resume_<company>_<role-slug>.tex` (e.g. `cv/lockheed/mfc_embedded_intern/`, `cv/blue_origin/avionics_software_intern/`), each copied from the base and tailored. **Migrated 2026-10-09** from the old flat `cv/<company>/travis_resume_<company>.tex` layout — font path in variants is now `../../fonts/` (one level deeper). `cv/web_resume.tex`/`.pdf` are CI-generated from the base resume (email/phone stripped) for the travismbrown.com portfolio site — never hand-edited.

**2026-09-18 update:** reordered Education to list Master of Science before Bachelor of Science and dropped the "(Accelerated BS/MS Program)" parenthetical, across the base resume and all four company variants. Reworded the flight-controller project bullet from "Programmed a custom flight controller from scratch on an ESP32S3..." to "Programmed a custom ESP32S3 based flight controller...". All five `.tex` files recompiled clean at 1 page.

### Recent changes (2026-09-08/09 session)
- **PCB bullet updated** (FC project, bullet 3): now reads "Designed a modular PCB in KiCad with connector-based breakouts for five sensor interfaces (SPI and UART), eight PWM outputs for servos and ESC, MOSFET reverse polarity protection, and separate actuator and logic supply rails." — replaces the old vague "isolated power rails" wording.
- EVT collaboration bullet (Lockheed bullet 2), servo jitter result (GE bullet 4), SITL scenario breakdown (FC bullet 2), Chip-8 "custom" reduction all done in prior session.

### Pending resume items

**Objective line** — currently generic: *"Seeking an embedded/firmware engineering internship for Summer 2027."* Both reviewer agents and Travis flagged it as weak. Travis wants to keep it so recruiters immediately know it's an internship search (not full-time), but wants a stronger hook. Constraints: (a) must not name specific companies, (b) must not depend on currently being employed in embedded (goes stale after Dec 2026). Many options tried and rejected — revisit before sending any application. Do not change without proposing options to Travis first.

**Crypto bug standby bullet** — a strong GE Vernova bullet is being held off the resume for space reasons. When a line frees up, offer to add:
> "Found and root-caused a silent production cryptography bug — radio group master key generation failing on every call due to a parameter error; traced to the exact line via CubeIDE step-through."
Both a general reviewer and a senior embedded recruiter called this the single most memorable missing line on the resume.

**Two remaining "custom" instances** — "custom flight controller" (FC bullet 1) and "custom GNSS driver" (EVT bullet 3). Travis chose to leave these; do not change without asking.

**2026-09-20 confirmation:** Travis confirmed everything currently in the base resume is factually accurate as written. This resolves prior session flags raised during Qualcomm/CesiumAstro application drafting: the Lockheed bullet's "100+ repositories" and "mandatory GitLab CI gate on all merge requests" are accurate, the EVT "custom GNSS driver over UART/NMEA 0183" bullet is accurate, and the flight controller's "FreeRTOS" and "June 2026 – Present" start date are accurate. Do not re-flag these as unverified in future application drafts — the base resume itself is the verified source of truth going forward.

**Correction (2026-09-20):** A reviewer agent flagged the base resume's "Modbus TCP, RTU, and ASCII server support" bullet as an overclaim (claiming Modbus ASCII wasn't actually implemented in firmware, only pollable via the separate Flask dashboard) — this was wrong. Travis confirmed Modbus ASCII was genuinely implemented in firmware. The bullet was briefly changed to drop "ASCII" in the Qualcomm and CesiumAstro variants and has been reverted back to the original "TCP, RTU, and ASCII" wording in both. Lesson: a reviewer agent's claim about Travis's own work is not verified fact — it needs Travis's confirmation before being applied as an edit, same as any other factual-accuracy question about the base resume.

**Correction #2 (2026-09-20):** The Lockheed bullet 2 ("...deploying as a mandatory merge request gate") was reworded in the CesiumAstro variant to add "across the org" — this is inaccurate. Travis confirmed the mandatory gate applied only to the specific team he was on, not company-wide. Reverted to the original base-resume wording (no scope claim beyond "a mandatory merge request gate"). Do not add "across the org," "company-wide," or similar scope language to this bullet in any variant.

**Correction #5 (2026-09-20):** The CesiumAstro cover letter's "low-level interfaces" paragraph included MQTT alongside Modbus/CAN/CANopen/SPI/etc. as "production firmware experience." Travis clarified the GE Vernova MQTT work was all application-layer code — a library (Cyclone) handled the actual low-level network operations. This distinction was already correctly documented in CLAUDE.md ("Built MQTT protocol support from scratch (application layer over Cyclone's low-level MQTT)...") — the mistake was not applying that existing distinction when drafting. Fixed in CesiumAstro by removing MQTT from the "low-level interfaces" claim and substituting the STM32F446 hardware-agnostic peripheral library work (genuinely low-level, driver work from datasheets/reference manuals) instead. **Known issue, not fixable:** both already-sent Zipline cover letters (`cover_letters/zipline_long_range/`, `cover_letters/zipline_embedded/`) also lump MQTT into a "production firmware experience with CAN/CANopen, SPI, I2C, UART, ADC, PWM, Modbus..., and MQTT" claim — already sent, can't correct retroactively. Qualcomm's letter doesn't mention MQTT in its production-firmware clause, so it's unaffected. **Lesson:** when writing "low-level" or "production firmware" claims, cross-check against CLAUDE.md's actual bullet-level detail (which already distinguishes application-layer from low-level work) rather than pattern-matching from a flat skills list.

**Correction #4 (2026-09-20):** The CesiumAstro cover letter said the GE Vernova I/O subsystem was built with "low-level drivers and register maps underneath it" — inaccurate. Travis confirmed "register map" only correctly applies to the Modbus protocol implementation (Modbus is register-based, like an I2C device: you read/write registers to communicate). All other GE Vernova/EVT peripheral work used STM32 HAL calls, not raw register manipulation. Fixed to: "using the STM32 HAL underneath it, and implemented the Modbus register map that exposes that I/O over the network." Never describe non-Modbus work as "register-level" or involving "registers." Mirrored into `.claude/skills/job-application-assistant/01-candidate-profile.md`.

**Correction #3 (2026-09-20):** RIT Electric Vehicle Team (EVT) is a student club, not an employer — never describe EVT-only work (CAN/CANopen, the VCU, GNSS driver, peripheral drivers) as "production" firmware/experience. Found that the two already-submitted Zipline cover letters (`cover_letters/zipline_long_range/`, `cover_letters/zipline_embedded/`) both say "I have production firmware experience with CAN/CANopen, SPI, I2C..." — incorrectly folding EVT's CAN/CANopen work into a "production" claim alongside genuine GE Vernova production work. These are already sent and can't be corrected retroactively. The Qualcomm and CesiumAstro letters already phrase this correctly (keep "production firmware experience" scoped to SPI/I2C/UART/ADC/PWM — genuine GE Vernova work — and describe CAN/CANopen separately as "protocol work," not "production"). Keep this separation in every future letter: mirrored into `.claude/skills/job-application-assistant/01-candidate-profile.md`.

---

## Job Search State

All job data is in `.claude/skills/job-scraper/seen_jobs.json`. Key context:

### Scrape + rank ran 2026-09-08
All new postings from that run are now either `"status": "ranked"` or `"status": "new"` (couldn't be scored). No applications submitted yet — nothing in `job_search_tracker.csv`.

### Top ranked postings (shortlist)
| Score | Title | Company | Key note |
|-------|-------|---------|----------|
| 92 | Long Range Platform Embedded Firmware Intern (Summer 2027) | Zipline | Favorited. Confirmed still active. |
| 89 | Embedded Engineering Intern (Summer 2027) | Zipline | **$54/hr + housing + relocation.** Second distinct Zipline posting — may be a different team (telemetry/systems vs. long-range radio). Determine which team before applying. |
| 84 | Embedded Software Engineering Intern | E-Space | ⚠️ Listed as part-time — verify it's structured as a full-time summer internship before applying. No pay/season listed. |
| 81 | Systems Software Engineering Intern – Embedded Systems | BAE Systems | Defense, ~$26–35/hr (borderline). Season unverified. |
| 77 | Intern (A/B/C/D), Software Engineer | L3Harris Technologies | Multiple US locations. Season unverified — ask recruiter. |

### Could not score (JS-rendered, need manual check)
- **Raytheon/RTX — Embedded SW Intern, Gen 4 Tactical Airborne Radar (El Segundo CA, Summer 2027)**: search careers.rtx.com for current URL. Expected high fit (real-time C/C++ radar firmware, ~$27–43/hr). Status stays `"new"` in seen_jobs.json.
- **Northrop Grumman — 2027 Intern Software Engineer (Melbourne FL)**: check Workday URL in seen_jobs.json. Generic SW posting, defense sector. Status stays `"new"`.

### Watch list — postings not yet open
| Company | When to check | Notes |
|---------|--------------|-------|
| **Garmin** (Aviation, Olathe KS) | **Now / any day** | Embedded SW intern, ~$33/hr + housing. 2026 cycle opened late Aug — check careers.garmin.com immediately |
| **Rivian and VW Group Technologies** | **Applied, following up** | **Exception to the Spring exclusion:** Travis is willing to do Rivian/VW's Jan 11–Aug 13 2027 co-op. Applied to Software Engineering Intern - Vehicle Controls (Jan–Aug 2027), general application matched to a team later (IDs 4463551826 Irvine / 4463566357 Palo Alto). Contact (2026-10-13): met Courtney (tech recruiter) at an RIT EVT event, has his email and a photo of him on the EVT motorcycle; also met engineers Prosper and Cameron and walked them through the VCU. Follow-up email sent to Courtney 2026-10-13 with the photo and the Rivian resume variant (cv/rivian_vw/vehicle_controls_intern/). If no reply, a light check-in is reasonable around 2026-10-27. Other Rivian/VW Jan–Aug postings previously skipped only for timing could be re-evaluated (e.g. 4467800830 Test and Validation, Charging Products). The UIUC-only role 4470715379 is still excluded. |
| Collins Aerospace | Aug–Sep 2026 | Posting window just opening |
| Figure AI | Oct 2026 | Strong actuator/sensor embedded culture — C/C++/RTOS, very aligned with Travis's interests |
| Archer Aviation | Oct 2026 | DO-178C flight controls intern from 2026 cycle was strong fit |
| Tesla, Waymo, Boston Dynamics | Oct–Nov 2026 | Standard cycle start |
| General Dynamics | Oct 2026 | No 2027 posts yet |
| **H3X Technologies** | Oct 2026+ | Still Spring-only as of 2026-09-08 — watch for Summer/Fall 2027 opening |

### Companies confirmed not yet posting for Summer 2027
Agility Robotics, Figure AI, Tesla, Waymo, Boston Dynamics — all too early as of 2026-09-08. Cycle opens Oct–Nov 2026.

### ZipRecruiter / SpaceCrew / Handshake
No unique leads found on these platforms as of 2026-09-08 — too early. Re-check SpaceCrew in October 2026 when aerospace/defense Summer 2027 postings ramp up.

---

## Timing Reminder

Travis's GE Vernova co-op ends December 2026. Next internship must start Summer 2027 (May/June) or Fall 2027. Spring 2027 is a hard exclusion. See CLAUDE.md for full timing rules.
