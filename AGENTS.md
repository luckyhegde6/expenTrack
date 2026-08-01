# AGENTS.md

This file provides guidance for AI agents working in this repository.

## Agentic Workflow Setup

### 1. Core Principles

- **Surgical Changes**: Touch only what you must. Clean up only your own mess.
- **Simplicity First**: Minimum code that solves the problem. Nothing speculative.
- **Think Before Coding**: State assumptions explicitly. If uncertain, ask.
- **Goal-Driven**: Define success criteria. Loop until verified.

### 2. Required Skills for Agents

Agents should invoke relevant skills BEFORE any response or action:

| Task Type | Skill to Invoke |
|-----------|-----------------|
| New feature implementation | `superpowers:brainstorming` → implementation skills |
| Bug fixing | `superpowers:systematic-debugging` → domain skills |
| Code review | `code-review:code-review` |
| Planning multi-step work | `superpowers:writing-plans` → `feature-dev:feature-dev` |
| Research | `deep-research:deep-research` |
| Test-driven development | `superpowers:test-driven-development` |

### 3. Agent Communication

- Use `SendMessage` tool to communicate with other agents
- Reference agents by name: `"main"`, `"researcher"`, etc.
- Subagent results return via final text — use `schema` for structured output

### 4. Project-Specific Rules

**Flask Routes:**
- All routes live in `app.py` with `# --- Step N ---` comment markers
- New features belong in the appropriate step section
- Use `render_template()` with templates extending `base.html`

**Database:**
- `database/db.py` is a placeholder — implement `get_db()`, `init_db()`, `seed_db()` in Step 1
- Database file: `expense_tracker.db` (gitignored)
- Use SQLite with `row_factory` and foreign keys enabled

**Templates:**
- Extend `base.html` via `{% extends "base.html" %}`
- Fill `{% block content %}` and optionally `{% block scripts %}`
- Currency: **₹ (Rupee)** throughout UI

**Testing:**
- `pytest` for all tests
- `pytest tests/test_app.py` for single file
- `pytest -k <name>` for specific test

**Commands:**
```bash
# Run app
python app.py          # http://localhost:5001

# Full setup
.\init.ps1             # venv + deps + start

# Dependencies
pip install -r requirements.txt
```

### 5. File Conventions

- Line endings: LF (configure git `core.autocrlf=input`)
- Python: 4-space indent, type hints where helpful
- HTML: 4-space indent, Django/Jinja2 template syntax
- CSS: BEM-ish class naming (`.nav-inner`, `.hero-title`)

### 6. Git Workflow

- Branch for features: `feature/<name>`
- Conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`
- Never force-push to main
- PR required for main branch changes

### 7. Quality Gates

Before marking work complete:
- [ ] All tests pass (`pytest`)
- [ ] App runs without errors (`python app.py`)
- [ ] No unused imports/variables from your changes
- [ ] Style matches existing code