# /apply - Drafter-Reviewer Job Application Workflow

You are orchestrating a two-agent job application workflow. The job posting is provided below as `$ARGUMENTS` (either a URL or pasted text).

Follow these steps **exactly in order**. Do not skip steps.

**Token-efficiency rules for this workflow:**
- Never re-Read a file whose contents are already in your context from an earlier step. If you read it in Step 1, it is still available in Step 2.
- When dispatching the reviewer agent, pass draft content **inline in the agent prompt** rather than asking the agent to Read files you already have in memory.
- Run the full verification checklist exactly once, at the end (Step 6). The reviewer focuses on content critique, not verification.
- Step 5 (compile and inspect PDFs) is mandatory and non-skippable — LaTeX page-break decisions are unpredictable, and `.tex` files that look fine often produce broken PDFs (orphaned entry titles, cover letters spilling to page 2, bullet fonts mismatching).

---

## Step 0: Parse Input

- If `$ARGUMENTS` looks like a URL, use `WebFetch` to retrieve the job posting content.
- If it is pasted text, use it directly.
- Extract: **company name**, **role title**, **department** (if mentioned), **location**, and **language** of the posting (Danish or English).
- Store these for use throughout the workflow.

---

## Step 1: DRAFTER - Evaluate Fit

Read the evaluation framework:
- `.claude/skills/job-application-assistant/04-job-evaluation.md`
- `.claude/skills/job-application-assistant/01-candidate-profile.md`

Using the framework from `04-job-evaluation.md`, evaluate the job posting against the candidate's profile. If the salary lookup tool is configured, run:

```bash
python salary_lookup.py "<Company Name>" --json
```

If the posting specifies a city, add `--city "<City>"` to narrow results. Parse the JSON output and include the salary benchmark in the evaluation. If the tool is not configured or returns an error, skip the salary benchmark.

Present the evaluation to the user with:

1. **Skills match** - which required/preferred skills match vs. gaps
2. **Experience match** - how work history maps to the role
3. **Behavioral/culture match** - how behavioral profile fits the role/company culture
4. **Salary benchmark** - salary index for the company (if available)
5. **Overall fit score** and recommendation (strong fit / moderate fit / weak fit)

After presenting the evaluation, ask the user:
> "Should I proceed with drafting the CV and cover letter for this role?"

**If the user says no, stop here.** If yes, continue to Step 2.

---

## Step 2: DRAFTER - Draft CV + Cover Letter

You already have `01-candidate-profile.md` and `04-job-evaluation.md` in context from Step 1. **Do not re-read them.**

Read only the reference files you do not yet have:
- `.claude/skills/job-application-assistant/03-writing-style.md`
- `.claude/skills/job-application-assistant/05-cv-templates.md`
- `.claude/skills/job-application-assistant/06-cover-letter-templates.md`

Also read the most recent existing CV and cover letter files for concrete structural reference:
- Read `cv/travis_resume.tex` (the base resume — always start a new variant from this, not an older company variant) as the structural reference
- Read the most recently modified `cover_letters/<company>/cover_*.tex` file as a template reference (prefer the newest one — it reflects the latest style fixes, e.g. no header block, `\raggedright`, generous paragraph spacing)

### CV (`cv/<company>/<role-slug>/travis_resume_<company>_<role-slug>.tex`) — exact 4-step process, every time

Follow these steps in order. Do not skip or compress them, and do not write any content change to the file until step 4.

1. **Copy the base resume file into the new subfolder and rename it** (`cv/travis_resume.tex` → `cv/<company>/<role-slug>/travis_resume_<company>_<role-slug>.tex`), unchanged, before deciding on any content. This gives you (and the user) a clean starting point identical to the base.
2. **Decide what changes you want to make**, relative to that copied file — objective line, bullet wording, skills reordering, additions/removals. Do this thinking silently; do not write or alter the file yet.
3. **Prompt the user for each individual change**, showing the exact old text and the exact new text for that one change (the literal wording that will go in the file, not a paraphrase or summary), plus a one-line reason. Present changes as a list if there are several, but each one must show its own literal old→new text.
4. **Apply only after approval.** If the user asks to reword a change, revise it and go back to step 3 with the updated wording — do not write anything until the final wording is approved. Once every proposed change is approved, apply them to the file.

Structural-only differences (compile-filename comment, font path, `WEB-RESUME:REMOVE` markers) don't need approval — only content changes go through steps 2-4.

General content rules while deciding what to change in step 2:
- Always in **English**
- Follow the plain-XeLaTeX/Spectral-font format from `05-cv-templates.md` (not moderncv)
- Tailor the objective line and experience/project bullets to the specific role
- Reframe skills and achievements to match job requirements
- Keep to exactly 1 page

### Cover Letter (`cover_letters/<company>/cover_<company>_<role>.tex`)
- **Match the language of the job posting** (Danish posting -> Danish cover letter, English posting -> English cover letter)
- Use the plain Spectral-font article-class template (matches the resume's style) — not the `cover.cls` template `06-cover-letter-templates.md` describes; that's a known doc/practice drift, follow the most recent existing cover letter file as the structural reference instead
- Compile with an explicit `-jobname="Travis_<Company>_Cover_Letter"` so the uploaded PDF has a clean name (see `06-cover-letter-templates.md`)
- Tailor the opening paragraph to the specific role and company
- Address to a named person if available in the posting, otherwise "Dear Hiring Manager" (or equivalent in posting language)
- Keep to approximately one page
- Any mention of agentic coding or AI tooling must reference **Claude Code** by name

Write the cover letter to disk once drafted (no pre-approval gate — it's new content each time, not a diff against a base, and gets full review at Step 6 anyway). Keep the exact text of both drafts in working memory — you will pass them inline to the reviewer in Step 3 and revise them in Step 4 without re-reading.

---

## Step 3: REVIEWER - Research & Critique

Use the **Agent tool** to spawn a `general-purpose` reviewer agent. The reviewer gets a fresh context, so pass the drafts **inline in the prompt** below (do not make the reviewer Read them). Scope the reviewer's file reads to content-critique essentials only — the reviewer does not need the LaTeX template files (`05`, `06`) to critique content, since those govern structural/LaTeX concerns the drafter already applied.

Replace `<COMPANY>`, `<ROLE>`, `<INSERT_JOB_POSTING_TEXT_HERE>`, `<INSERT_CV_DRAFT_HERE>`, and `<INSERT_COVER_LETTER_DRAFT_HERE>` with actual values before dispatching.

```
You are a hiring manager proxy reviewing a job application. Your job is to make the application as targeted and compelling as possible.

## Your Tasks

### 1. Research the Company
Use WebSearch and WebFetch to research:
- The company's website, mission, and recent news
- The specific department or team (if mentioned in the posting)
- Any recent projects, press releases, or strategic initiatives relevant to the role
- Company culture and values

### 2. Read Reference Materials (content-critique only)
Read these four files — and only these — to ground your critique:
- `.claude/skills/job-application-assistant/01-candidate-profile.md`
- `.claude/skills/job-application-assistant/02-behavioral-profile.md` — use this specifically to check whether the cover letter's voice matches the candidate's natural register. A "Collaborator" PI profile, for example, should not be given a combative, solo-hero tone; a "Persuader" profile should not be given over-hedged, apologetic phrasing.
- `.claude/skills/job-application-assistant/03-writing-style.md`
- `.claude/skills/job-application-assistant/04-job-evaluation.md`

Do NOT read `05-cv-templates.md` or `06-cover-letter-templates.md` — those govern LaTeX structure the drafter already applied and are not needed for content critique.

### 3. Drafts to Review
Both drafts are provided inline below. Do NOT use the Read tool on the draft files — use these exact texts.

<CV_DRAFT file="cv/<COMPANY>/<ROLE_SLUG>/travis_resume_<COMPANY>_<ROLE_SLUG>.tex">
<INSERT_CV_DRAFT_HERE>
</CV_DRAFT>

<COVER_LETTER_DRAFT file="cover_letters/<COMPANY>/cover_<COMPANY>_<ROLE>.tex">
<INSERT_COVER_LETTER_DRAFT_HERE>
</COVER_LETTER_DRAFT>

### 4. Job Posting
<JOB_POSTING>
<INSERT_JOB_POSTING_TEXT_HERE>
</JOB_POSTING>

### 5. Produce Feedback

Return your feedback in **two parts**:

**Part A — Structured edits (preferred format whenever possible):**
A JSON array of concrete edits the drafter can apply directly without re-reading the files. Each edit is an object:
```json
{
  "file": "cv/<COMPANY>/<ROLE_SLUG>/travis_resume_<COMPANY>_<ROLE_SLUG>.tex" | "cover_letters/<COMPANY>/cover_<COMPANY>_<ROLE>.tex",
  "old_string": "<exact text currently in the draft>",
  "new_string": "<replacement text>",
  "reason": "<one-line rationale: keyword match / company angle / reframing / style>"
}
```
Only use this format when you can quote the exact `old_string` from the drafts above. Make `old_string` unique — include enough surrounding context so it matches exactly once per file.

**Part B — Narrative suggestions (for judgment calls that are not mechanical edits):**
Prose suggestions grouped by category. Produce each category even if your finding is "no issues" — silence on a category can be mistaken for skipping it.
- **Missed keywords/requirements** — what to add and roughly where, if it cannot be expressed as a clean string replacement
- **Company/department-specific angles** — connections between experience and the company's strategic priorities, based on your research
- **Action-oriented reframing** — identify passive, generic, or low-energy statements and suggest action-oriented rewrites. Use this category especially for structural weakness that doesn't fit a single-sentence swap (e.g., "the whole opening paragraph reads as passive — restructure around your single strongest match to the posting").
- **Tone and style issues** — check against `03-writing-style.md` AND `02-behavioral-profile.md`. Flag any issues with tone, formality, or voice (cliches, hedging, over-humility, inconsistent register), and specifically flag any mismatch between the letter's voice and the candidate's natural register as described in the behavioral profile.

**CRITICAL RULE:** All suggestions must be grounded in actual profile data. Do NOT suggest fabricating skills, experience, or achievements. If a requirement is a gap, say so honestly and suggest how to frame adjacent experience instead.

Do **not** run a verification checklist — the drafter will do that in the final step. Focus on content critique.

Return Part A and Part B together as a single structured message.
```

---

## Step 4: DRAFTER - Revise Based on Feedback

Once the reviewer agent returns its feedback:

1. **CV edits go through the same steps 2-4 approval process as above, cover letter edits do not.** Sort the reviewer's Part A/B suggestions by target file. For `cover_letters/...`, apply directly (see below). For `cv/...`, present each proposed change individually with its exact old text and exact new text (not a paraphrase) and wait for approval before touching the file — do not call `Edit` on the CV until approved, and if the user asks for different wording, revise and re-present before applying. This applies even to edits the reviewer marked as corrections: a reviewer agent cannot independently verify a claim about Travis's own past work (see `03-writing-style.md` rule 6), so a reviewer-flagged "overclaim" in the CV is a proposal for the user to confirm, not a fact to apply.
2. **Apply Part A (structured edits) directly with the Edit tool** for the cover letter, and for the CV once its changes are approved. Do NOT re-read the draft files — you already have them in context from Step 2, and the reviewer's `old_string` values were quoted from that same text. Skip any whose rationale would require fabricating content.
3. **Apply Part B (narrative suggestions)** using judgment — these need interpretation, not mechanical replacement, but CV-targeted ones still go through step 1's approval gate. Walk through every Part B category the reviewer returned and address it:
   - **Missed keywords/requirements:** add the keyword or capability where it fits naturally in the CV or cover letter. Prefer the experience bullets (concrete evidence) over the profile statement (abstract claim).
   - **Company/department-specific angles:** weave the reviewer's research into the cover letter opening or motivation paragraph. Verify every company claim via WebFetch/WebSearch before including it — do not trust reviewer research at face value.
   - **Action-oriented reframing:** rewrite passive or generic phrasing (CV profile statement, cover letter opening, bullet leads). Structural weakness that the reviewer flagged without a clean JSON edit lives here. Watch for a rewrite quietly changing scope or specificity (e.g. adding "across the org" to a claim that was team-scoped) — that's a factual change riding along on a style fix, not just tightening.
   - **Tone and style issues:** apply the writing-style-guide fixes (no em-dashes, no cliches, no apologetic hedging, consistent first-person active voice).
   Use Edit for targeted changes; only re-read a file if an edit fails because the surrounding text has shifted.
4. Do NOT incorporate any suggestion that would fabricate skills or experience. If a posting requirement is a genuine gap, acknowledge it honestly and frame adjacent experience instead.

After all edits are applied (CV edits post-approval, cover letter edits directly), the two files on disk are the final drafts.

---

## Step 5: DRAFTER - Compile & Inspect PDFs (MANDATORY)

**Never skip this step.** The `.tex` files looking fine is not sufficient — LaTeX page-break decisions are unpredictable and commonly produce broken layouts (orphaned job titles separated from their bullets, cover letters spilling to 2 pages, bullet fonts not matching body text). Compile both documents and visually verify the PDFs before presenting.

### 5a. Compile

```bash
cd cv/<company>/<role-slug> && xelatex -interaction=nonstopmode -jobname="Travis_Brown_Resume" travis_resume_<company>_<role-slug>.tex
cd ../../../cover_letters/<company> && xelatex -interaction=nonstopmode -jobname="Travis_<Company>_Cover_Letter" cover_<company>_<role>.tex
```

- CV uses **xelatex** — the template's `fontspec`-loaded Spectral font requires it (not lualatex, not pdflatex).
- Cover letter uses **xelatex** — the plain Spectral-font article-class template also requires fontspec.

If either compile fails, fix the error and re-compile until clean.

### 5b. Inspect layout

Read both PDFs via the Read tool and verify:

**CV (`cv/<company>/<role-slug>/Travis_Brown_Resume.pdf`):**
- [ ] Exactly 1 page (not 2)
- [ ] No orphaned entry titles — an `\entry{}{}{}` title line must never sit alone at the bottom of the page with its bullets pushed past the page break. This is the most common failure.
- [ ] Section headings (`\resumesection{}`) are not isolated at the bottom of the page with no bullets below
- [ ] No awkward whitespace gaps, and no large empty gap at the bottom from `\vfill` (a sign content was cut too aggressively)

**Cover letter (`cover_letters/<company>/Travis_<Company>_Cover_Letter.pdf`):**
- [ ] Exactly 1 page
- [ ] Signature block visible, not cut off or pushed to a second page
- [ ] No header block (name/contact/rule) at the top — just the date, then the salutation, per Travis's standing preference
- [ ] Left-aligned text (`\raggedright`), not full-justified

### 5c. Iterate until clean

If the layout has problems, edit the `.tex` files and recompile. Common fixes (see `05-cv-templates.md` and `06-cover-letter-templates.md` for full details):

- **Orphaned CV entry title:** `\usepackage{needspace}` in preamble, then `\needspace{5\baselineskip}` immediately before the problematic `\entry{}{}{}` block
- **CV spills just barely onto a second page:** `\enlargethispage{2-3\baselineskip}` before `\end{document}` (or before the section that's spilling)
- **Substantial content on a second page:** cut content using **relevance-weighted cutting** (see `05-cv-templates.md` → "Relevance-weighted cutting"). Score each candidate line by (a) relevance to THIS posting's keywords and responsibilities, (b) uniqueness (is it duplicated elsewhere?), (c) narrative load (does the cover letter depend on it?). Cut the lowest-total-score line first, regardless of section. Do NOT mechanically apply a static section-based priority order — an older-role bullet that hits posting keywords is worth more than a recent-role bullet that does not.
- **Cover letter itemize breaks compile or uses wrong font:** close `\lettercontent{}` before the list, wrap the list in `{\raggedright\fontspec[Path = OpenFonts/fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont \begin{itemize}...\end{itemize}\par}`
- **Cover letter spills to 2 pages:** trim using the same relevance-weighted logic. First cut: sentences that restate what a bullet already said. Second cut: a bullet that does not hit posting keywords. Last resort: a bullet that does hit posting keywords. Never reduce geometry or line spacing.

Do not proceed to Step 6 until both PDFs pass inspection.

### 5d. ATS & keyword verification (CV)

An ATS parser reads the PDF's embedded **text layer**, not the rendered page. This template is a plain single-column layout with no icon fonts, so it's inherently low-risk, but still verify what a parser actually sees. It applies to the **CV only**; cover letters rarely go through keyword screening.

**Availability check:** run `pdftotext -v`. `pdftotext` (poppler) is an optional dependency, not part of TeX distributions. If it is missing, print a one-line warning that the mechanical parse check is skipped, do the keyword-coverage check (item 3 below) against your visual Read of the PDF instead, and note the degraded mode in the Step 6 report. Same graceful-skip pattern as the salary lookup.

**1. Extract the text layer:**

```bash
cd cv/<company>/<role-slug> && pdftotext -layout Travis_Brown_Resume.pdf Travis_Brown_Resume.txt
```

Read the `.txt` file.

**2. Parseability checks** on the extracted text:

- [ ] **Text extracted at all**, with no garbage runs: no `(cid:NNN)` markers, no `�` replacement characters, no stretches of missing text that are visible in the PDF
- [ ] **Email and phone survive as literal text.** The header prints email/phone/links directly via `\href{...}{visible text}`, with no icon glyphs — confirm both the email address and phone number appear verbatim in the extraction.
- [ ] **Reading order matches the visual order** — section headings appear in the same sequence as on the page, and lines from different sections are not interleaved. This single-column template should always extract cleanly; if it doesn't, something broke in the compile, not the template design.
- [ ] **Dates recognizable** — each role and degree has its years present in the extraction.

Failures here are template-level problems: fix them in the `.tex` (e.g. print the email as text rather than icon-only), then re-run 5a–5c and re-extract. If a custom template's layout fundamentally scrambles extraction order, tell the user prominently — they may be trading ATS compatibility for looks.

**3. Keyword coverage.** Reuse the required/preferred keyword list you extracted in Step 1 — do not re-derive it. Match each keyword against the extracted text, **in the posting's language** (a Danish posting's keywords are matched in Danish even though the CV is in English — where the CV legitimately covers the concept in English, count it as synonym-only and note the language difference). Report a table:

| Keyword | Priority | Status | Note |
|---------|----------|--------|------|
| ... | required/preferred | covered / synonym-only / missing (have it) / missing (gap) | where it appears, or why absent |

- **covered** — the term appears (verbatim or trivial inflection).
- **synonym-only** — the concept is present under a different term. If the posting's exact term is truthfully applicable per the profile, prefer the posting's term (ATS keyword matches are often literal).
- **missing (have it)** — the profile shows the candidate genuinely has this skill but the CV never says it: add it where it fits naturally, preferring experience bullets (concrete evidence) over the objective line, then re-run 5a–5c.
- **missing (gap)** — a genuine gap: leave it missing. **Never stuff keywords.** This is the same honesty rule the reviewer follows — a gap gets acknowledged in the cover letter's framing, not hidden in the CV.

**4. Clean up:** delete the extracted `.txt` file.

### 5e. Clean up build artifacts

After the final clean compile, delete the `.aux`, `.log`, `.out` files (keep the `.tex` and `.pdf`).

---

## Step 6: Present Final Output

Run the full verification checklist from `CLAUDE.md` now — this is the **only** verification pass in the workflow. Re-read both files once here to verify final state on disk matches your mental model after the Step 4 and Step 5 edits.

### Verification Checklist
Report pass/fail for each item in the CLAUDE.md verification checklist (factual accuracy, targeting, consistency, quality).

### Key Tailoring Decisions
Summarize 3-5 key decisions made to tailor the application:
- What was emphasized and why
- What company-specific angles were incorporated
- What the reviewer suggested that was most impactful
- Any gaps that were acknowledged or reframed

### Files Created
List the files written:
- `cv/<company>/<role-slug>/travis_resume_<company>_<role-slug>.tex`
- `cover_letters/<company>/cover_<company>_<role>.tex`

Tell the user: "Both files are ready for your review. Open them to check the final output before compiling."

Also mention: once they have actually submitted the application, `/outcome <company>` logs it in the tracker and starts the per-application record that `/setup` later uses to calibrate the fit framework.
