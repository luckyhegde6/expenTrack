# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Project Overview

**Spendly** — a Flask-based personal expense tracker. The app is structured as a step-by-step learning project where routes and features are progressively implemented.

## Architecture

```
expense-tracker/
├── app.py               # Flask app — all routes and app configuration
├── database/            # Data layer (Step 1)
│   ├── __init__.py      # Package init (placeholder)
│   └── db.py            # get_db(), init_db(), seed_db() (to be implemented)
├── templates/           # Jinja2 HTML templates
│   ├── base.html        # Layout shell with nav, footer, {% block %} sections
│   ├── landing.html     # Landing / homepage
│   ├── login.html       # Login page
│   └── register.html    # Registration page
├── static/              # Static assets
│   ├── css/style.css    # Stylesheet
│   └── js/main.js       # Client-side JS
├── agents/              # Agent-related files
├── .venv/               # Virtual environment
├── init.ps1             # Setup script (create venv, install deps, start app)
└── requirements.txt     # flask, werkzeug, pytest, pytest-flask
```

**Key architectural points:**
- `app.py` is the single entry point — all routes, app config, and the `__main__` block live here
- Templates extend `base.html` via `{% extends %}` and fill `{% block content %}` / `{% block scripts %}`
- The `database/` package is a placeholder — `db.py` contains comments describing `get_db()`, `init_db()`, and `seed_db()` which students implement in Step 1
- The app runs on port **5001** in debug mode (`app.run(debug=True, port=5001)`)

## Commands

| Task | Command |
|------|---------|
| Run the app | `python app.py` |
| Run all tests | `pytest` |
| Run a single test file | `pytest tests/test_app.py` |
| Run a specific test by name | `pytest -k register` |
| Setup (venv + deps + start) | `.\init.ps1` |
| Install dependencies after activating venv | `pip install -r requirements.txt` |

**Running the app:** Flask's built-in dev server is used — `python app.py` starts it on `http://localhost:5001`.

## Project Conventions

- Routes are grouped in `app.py` with `# --- Step N ---` comment markers; new features belong in the appropriate step section
- The app uses **Rupee (₹)** as the currency throughout the UI
- The database file is `expense_tracker.db` in the project root (gitignored)
- The venv directory (`.venv/`) is gitignored
