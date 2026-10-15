# Job Evaluation Framework

<!-- SETUP: Skill match areas and career goals are personalized by running /setup -->

## Scoring Dimensions

Evaluate each job posting against these five dimensions:

### 1. Technical Skills Match (0-100)
How well do the required/preferred skills align with the candidate's capabilities?

| Score | Meaning |
|-------|---------|
| 80-100 | Core requirements are primary skills |
| 60-79 | Most requirements match, 1-2 gaps that are learnable |
| 40-59 | Partial match, significant upskilling needed |
| 0-39 | Fundamental mismatch |

**Strong match areas:** Embedded C/C++, STM32 microcontrollers (F4/F7/F446), ThreadX RTOS, CAN/CANopen, SPI/I2C/UART/PWM/ADC, hardware debugging (logic analyzer, oscilloscope, J-Link Segger), KiCad PCB design, Rust (embedded)
**Moderate match areas:** Python scripting/automation, CI/CD (GitLab), Flask, PostgreSQL, Git/GitHub/GitLab
**Weak match areas:** Data science/ML, cloud infrastructure, front-end web, enterprise/backend software engineering

### 2. Experience Match (0-100)
Does work history align with what they're looking for?

| Score | Meaning |
|-------|---------|
| 80-100 | Direct experience in the same domain and role type |
| 60-79 | Related experience, transferable skills clear |
| 40-59 | Adjacent experience, would need to make the case |
| 0-39 | Unrelated experience |

**Strong:** Embedded firmware development (STM32, GE Vernova), RTOS integration (ThreadX, VCU project), communication protocols (CAN/CANopen/SPI/I2C), QA automation (Lockheed Martin), PCB design and bring-up (EVT, personal projects)
**Moderate:** Python tooling, CI/CD pipelines, web dashboards (Flask)
**Entry-level:** Pure software roles, data engineering, cloud-native development

### 3. Behavioral/Culture Fit (0-100)
Does the role and company culture match the behavioral profile?

| Score | Meaning |
|-------|---------|
| 80-100 | Culture strongly matches behavioral preferences |
| 60-79 | Mixed signals but mostly compatible |
| 40-59 | Some friction areas |
| 0-39 | Significant culture mismatch |

**Red flags to research:** Department disorganization, work dominated by maintenance over development, poor chemistry with leadership, culture mismatches. Check reviews, media coverage, LinkedIn connections, and network contacts for insider perspective.

### 4. Location & Logistics (Pass/Fail + Notes)
- In-person or hybrid, anywhere in the US: PASS
- Remote (US): PASS with flag — Travis prefers in-person/hybrid; note it in evaluation
- Requires relocation within US: PASS — open to it
- International / outside the US: FAIL
- Frequent international travel: FLAG (discuss with user)
- **Safety/crime rate:** When a posting offers a choice among multiple specific sites (e.g. an intern program that places across several offices), factor in each site's relative crime/safety profile alongside role fit, and note it explicitly rather than silently picking on technical fit alone. This isn't a pass/fail gate — a lower-safety site with a much stronger role match is still worth presenting — but always surface the trade-off so Travis can weigh it himself.

### 5. Career Alignment & Motivation (0-100)
Does this role advance career goals and contain tasks that energize?

| Score | Meaning |
|-------|---------|
| 80-100 | Strongly aligned with career direction, clear growth path |
| 60-79 | Good role but only partially aligned with long-term goals |
| 40-59 | Decent job but doesn't build toward career goals |
| 0-39 | Dead end or backwards step |

**Career goals:**
- Secure an Embedded/Firmware Engineering internship for May–August 2027 in defense, automotive/EV, aerospace, or robotics
- Build toward a full-time embedded/firmware engineering role after completing the BS/MS at RIT (December 2027) — specifically in a domain where code has real physical effects (sensors, actuators, moving systems)

**Motivation filter:** Evaluate not just whether you *can* do the tasks, but whether the tasks will *energize* you. Consider:
- Tasks that energize: Working with physical systems — sensors providing input, actuators producing real-world output (motors, flaps, arms); hands-on bench debugging (logic analyzer, DMM, oscilloscope); firmware that makes something move or respond
- Tasks that drain: Pure signal/radio work with no physical actuation; pure software/cloud/backend with no hardware component; roles with no hands-on testing at all
- Non-task factors: In-person or hybrid strongly preferred; culture that values hands-on engineering over abstraction

**Domain breadth:** Travis's current GE Vernova internship is embedded C firmware for industrial radios (I/O subsystems, Modbus/MQTT protocol stacks over RF). He wants his next internship to build breadth, not repeat that domain. A role that is essentially "embedded firmware for a radio/comms product" again should be scored down on Career Alignment even when technical/experience match is strong — call this out explicitly in the evaluation rather than silently folding it into the score, so Travis can weigh domain novelty against raw fit himself. This is a preference, not a deal-breaker.

**Life situation alignment:** Consider personal constraints:
- **Security**: Student; internship compensation relevant but secondary to domain fit
- **Flexibility**: Open to relocating anywhere in the US for the right internship; in-person/hybrid strongly preferred over remote
- **Professional development**: Deepening embedded expertise in physical/actuation-heavy domains (robotics, aerospace, EV); building sensor fusion and control systems experience alongside firmware

**Financial-loss threshold (precise definition):** estimate monthly after-tax pay at the stated hourly wage for the job's specific work location, and estimate average studio-apartment rent in a safe area of that same city (same safety criteria as the location-safety preference). If studio rent exceeds **~60% of monthly after-tax pay**, that's a real monetary loss for the summer, not just a "below target" flag. Travis will only accept that trade-off for an exceptional company or exceptionally compelling work, not a merely good/strong-fit role — when presenting such a posting, frame it as "this would cost you money to take," with the rent-vs-take-home math shown, not just a COL number gap.

### 6. Salary Benchmark (Optional)

If the salary lookup tool is configured (`salary_data.json` exists), look up the company:
```
python salary_lookup.py "<Company Name>" --json
```

If a city is known from the posting, add `--city "<City>"` to narrow results.

Present findings as:
```
### Salary Benchmark
| Metric | Value |
|--------|-------|
| [Category] index | XX.X (+/-X.X% vs baseline) |
| Overall index | XX.X (+/-X.X% vs baseline) |
```

Interpret results relative to the baseline defined in the data file's metadata. For index-based data, higher typically means above-market compensation.

If the salary tool is not configured, skip this section.

## Output Format

Present the evaluation as:

```
## Job Fit Evaluation: [Role] at [Company]

**Job ID / Req #:** [posting's job ID, req number, or other identifier exactly as it appears in the source (LinkedIn job ID, company req code, etc.) — always include this, even if it means noting "not stated in posting"]
**URL:** [posting URL, if known]

| Dimension | Score | Notes |
|-----------|-------|-------|
| Technical Skills | XX/100 | [brief note] |
| Experience Match | XX/100 | [brief note] |
| Behavioral Fit | XX/100 | [brief note] |
| Location | PASS/FAIL | [brief note] |
| Career Alignment | XX/100 | [brief note] |

**Overall Score: XX/100** (weighted average of scored dimensions)

### Verdict: [Strong Fit / Good Fit / Moderate Fit / Weak Fit / Poor Fit]

### Key Strengths for This Role
- [bullet points]

### Gaps to Address
- [bullet points]

### Recommendation
[1-2 sentences: apply/skip/apply with caveats]

### Company Research Checklist
- [ ] Checked company website (mission, values, recent news)
- [ ] Checked review sites (Glassdoor, Jobindex, etc.)
- [ ] Checked LinkedIn for team size, recent hires, connections
- [ ] Checked media for restructuring, growth, or workplace issues
- [ ] Identified network contacts who may know the team/manager
```

## Weighting
- Technical Skills: 30%
- Experience Match: 25%
- Behavioral Fit: 15%
- Career Alignment: 30%

(Location is pass/fail, not weighted)

## Thresholds
- **Strong Fit** (75+): Definitely apply, tailor everything
- **Good Fit** (60-74): Apply, address gaps in cover letter
- **Moderate Fit** (45-59): Consider carefully, discuss with user
- **Weak Fit** (30-44): Probably skip unless strategic reasons
- **Poor Fit** (<30): Skip

## Pre-Application: Call the Employer (Best Practice)

Before writing the application, consider whether the candidate should call the contact person listed in the posting. **Only call if there are substantive questions** - never call just to "be remembered."

### When to Suggest Calling
- The posting has unclear or ambiguous requirements
- It's unclear which competencies are essential vs. nice-to-have
- The role description is vague about day-to-day tasks
- There's a named contact person who invites questions

### Good Questions to Ask
- "What are the primary challenges in this role?"
- "How is time typically divided across the listed responsibilities?"
- "Which competencies are most critical for success in this position?"
- "What does success look like in the first 6-12 months?"

### Rules for the Call
- Prepare a 30-second "elevator pitch" about your background in case they ask
- The call's purpose is **gathering information**, not delivering a pitch
- Take notes - use what you learn to tailor the application
- Reference the conversation naturally in the cover letter ("After speaking with [name], I was especially drawn to...")
