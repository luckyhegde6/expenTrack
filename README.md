# Spendly — Expense Tracker

A Flask-based personal expense tracking application built as a step-by-step learning project.

**Project Name:** Spendly  
**Currency:** Indian Rupee (₹)  
**Framework:** Flask 3.1.3  
**Database:** SQLite (placeholder in `database/db.py` — implement in Step 1)  
**Port:** 5001 (debug mode)

---

## Agentic Development Setup

This project includes a complete agentic workflow setup in `.agents/`:

```
.agents/
├── rules/
│   └── agent-rules.md       # Core operating principles for AI agents
├── skills/
│   └── skill-registry.md    # Available skills and when to invoke them
└── workflows/
    └── development-workflows.md  # Step-by-step workflows for features, bugs, DB, UI, refactor
```

**Key files for agents:**
- `AGENTS.md` — Agent guidance (principles, rules, quality gates)
- `CLAUDE.md` — Architecture + commands for Claude Code
- `.agents/rules/agent-rules.md` — Mandatory workflows and red flags
- `.agents/skills/skill-registry.md` — Skill invocation protocol
- `.agents/workflows/development-workflows.md` — 5 workflows with success criteria

See `SETUP_FROM_SCRATCH.md` for complete from-zero recreation guide.

## Setup

### Prerequisites

- Python 3.14 (or compatible)
- pip (Python package manager)
- PowerShell (for Windows users) / Terminal (for macOS/Linux users)

### Quick Start

1. **Create the virtual environment:**
   ```
   python -m venv .venv
   ```

2. **Activate the virtual environment (PowerShell):**
   ```
   .venv\Scripts\Activate.ps1
   ```

   > You may need to set the execution policy first if you haven't already:
   > ```
   > Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
   > ```

   **Activate the virtual environment (Command Prompt / cmd):**
   ```
   .venv\Scripts\activate.bat
   ```

3. **Install dependencies:**
   ```
   pip install -r requirements.txt
   ```

4. **Run the app:**
   ```
   python app.py
   ```

   The app runs on `http://localhost:5001` in debug mode.

### One-Command Setup

Use the init script to automate the full setup:

```
.\init.ps1
```

This will create the virtual environment, install all dependencies, and start the app.

## Project Structure

```
expense-tracker/
├── app.py              # Flask application and routes
├── database/           # Database module (Step 1)
│   ├── __init__.py
│   └── db.py           # DB connection and setup (to be implemented)
├── templates/          # HTML templates
│   ├── base.html
│   ├── landing.html
│   ├── login.html
│   └── register.html
├── static/             # Static assets (CSS, JS)
│   ├── css/
│   └── js/
├── requirements.txt    # Python dependencies
├── init.ps1           # Setup and start script
└── README.md
```

## Routes

| Route | Status |
|-------|--------|
| `/` | Landing page |
| `/register` | Registration page |
| `/login` | Login page |
| `/logout` | Coming in Step 3 |
| `/profile` | Coming in Step 4 |
| `/expenses/add` | Coming in Step 7 |
| `/expenses/<id>/edit` | Coming in Step 8 |
| `/expenses/<id>/delete` | Coming in Step 9 |

## Development

Run tests with:
```
pytest
```