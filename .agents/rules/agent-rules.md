# Agent Rules for Spendly Expense Tracker

## Core Operating Principles

1. **ALWAYS invoke relevant skills before acting** — including clarifying questions
2. **Surgical changes only** — touch only what the task requires
3. **Match existing style** — don't "improve" adjacent code
4. **Verify before completing** — tests must pass, app must run

## Mandatory Workflows

### Before Implementing Any Feature
```
1. superpowers:brainstorming (if new feature / unclear requirements)
2. superpowers:writing-plans (create implementation plan)
3. Present plan for approval
4. Implement with feature-dev:feature-dev
5. superpowers:verification-before-completion (run tests, verify app)
```

### Before Fixing Any Bug
```
1. superpowers:systematic-debugging (reproduce, isolate, fix, verify)
2. Write failing test first
3. Fix, then verify test passes
```

### Code Review (Before PR)
```
1. code-review:code-review (low/medium effort)
2. Address findings
3. simplify:simplify (optional cleanup)
```

## File-Specific Rules

### app.py (Flask Routes)
- All routes grouped with `# --- Step N ---` comments
- New routes go in correct step section
- Use `render_template()` — no inline HTML
- Debug mode on port 5001 only

### database/db.py
- Implement: `get_db()`, `init_db()`, `seed_db()`
- SQLite with `row_factory=sqlite3.Row`
- Foreign keys enabled: `PRAGMA foreign_keys = ON`
- DB file: `expense_tracker.db` (project root, gitignored)

### Templates (templates/*.html)
- Extend `base.html` via `{% extends "base.html" %}`
- Fill `{% block content %}` and optionally `{% block scripts %}`
- Currency: **₹** only (no $, €, etc.)
- Class naming: BEM-ish (`.nav-inner`, `.hero-title`)

### Static Assets
- CSS: `static/css/style.css` — mobile-first, custom properties
- JS: `static/js/main.js` — minimal, vanilla only

### Tests
- Location: `tests/` (create if missing)
- Naming: `test_<module>.py`
- Run: `pytest`, `pytest -k <name>`

## Communication Rules

- Use `SendMessage` for agent-to-agent communication
- Never fabricate pending agent results
- Report outcomes faithfully (tests pass/fail, what was done/skipped)

## Quality Standards

- Zero dead code from YOUR changes (remove unused imports/vars/functions)
- Don't remove pre-existing dead code unless asked
- Every changed line traces to user request
- If 200 lines could be 50, rewrite it

## Red Flags — Stop and Ask

- "Let me explore first" → Check skills first
- "This is simple" → Still check skills
- "I'll just do this one thing" → Plan first
- Multiple valid approaches exist → Present options, don't pick silently