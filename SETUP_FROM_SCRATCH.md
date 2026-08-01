# Spendly Expense Tracker — From-Scratch Setup Guide

This document describes how to recreate this repository from zero.

---

## Prerequisites

- Python 3.14+ installed
- Git installed
- GitHub CLI (`gh`) installed and authenticated (`gh auth login`)
- PowerShell (Windows) or Bash (macOS/Linux)

---

## Step 1: Initialize Project Structure

```bash
mkdir expense-tracker
cd expense-tracker

# Core directories
mkdir -p database templates static/css static/js agents tests .agents/rules .agents/skills .agents/workflows

# Initialize git
git init
```

---

## Step 2: Create Core Files

### `requirements.txt`
```txt
flask==3.1.3
werkzeug==3.1.6
pytest==8.3.5
pytest-flask==1.3.0
```

### `.gitignore`
```gitignore
venv/
expense_tracker.db
__pycache__/
*.pyc
*.pyo
.env
.DS_Store
.claude/plans/
```

### `app.py` — Flask Application
```python
from flask import Flask, render_template

app = Flask(__name__)


# ------------------------------------------------------------------ #
# Routes                                                              #
# ------------------------------------------------------------------ #

@app.route("/")
def landing():
    return render_template("landing.html")


@app.route("/register")
def register():
    return render_template("register.html")


@app.route("/login")
def login():
    return render_template("login.html")


# ------------------------------------------------------------------ #
# Placeholder routes — students will implement these                  #
# ------------------------------------------------------------------ #

@app.route("/logout")
def logout():
    return "Logout — coming in Step 3"


@app.route("/profile")
def profile():
    return "Profile page — coming in Step 4"


@app.route("/expenses/add")
def add_expense():
    return "Add expense — coming in Step 7"


@app.route("/expenses/<int:id>/edit")
def edit_expense(id):
    return "Edit expense — coming in Step 8"


@app.route("/expenses/<int:id>/delete")
def delete_expense(id):
    return "Delete expense — coming in Step 9"


if __name__ == "__main__":
    app.run(debug=True, port=5001)
```

### `database/__init__.py`
```python
# Package init — placeholder
```

### `database/db.py` — Database Module (Step 1 placeholder)
```python
# Students will write this file in Step 1 — Database Setup
# This file should contain:
#   get_db()   — returns a SQLite connection with row_factory and foreign keys enabled
#   init_db()  — creates all tables using CREATE TABLE IF NOT EXISTS
#   seed_db()  — inserts sample data for development
```

---

## Step 3: Create Templates

### `templates/base.html` — Layout Shell
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% block title %}Spendly{% endblock %}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}">
    {% block head %}{% endblock %}
</head>
<body>

    <nav class="navbar">
        <div class="nav-inner">
            <a href="{{ url_for('landing') }}" class="nav-brand">
                <span class="brand-icon">◈</span>
                <span class="brand-name">Spendly</span>
            </a>
            <div class="nav-links">
                <a href="{{ url_for('login') }}">Sign in</a>
                <a href="{{ url_for('register') }}" class="nav-cta">Get started</a>
            </div>
        </div>
    </nav>

    <main class="main-content">
        {% block content %}{% endblock %}
    </main>

    <footer class="footer">
        <div class="footer-inner">
            <span class="brand-icon">◈</span>
            <span class="footer-name">Spendly</span>
            <p class="footer-copy">Track every rupee. Own your finances.</p>
        </div>
    </footer>

    <script src="{{ url_for('static', filename='js/main.js') }}"></script>
    {% block scripts %}{% endblock %}
</body>
</html>
```

### `templates/landing.html` — Homepage
```html
{% extends "base.html" %}

{% block title %}Spendly — Track Every Rupee{% endblock %}

{% block content %}

<section class="hero">
    <div class="hero-inner">
        <div class="hero-badge">Personal Finance Tracker</div>
        <h1 class="hero-title">
            Know where your<br>
            <em>money goes</em>
        </h1>
        <p class="hero-subtitle">
            Log expenses, understand your spending patterns,
            and take control of your financial life —
            one transaction at a time.
        </p>
        <div class="hero-actions">
            <a href="{{ url_for('register') }}" class="btn-primary">Start tracking free</a>
            <a href="{{ url_for('login') }}" class="btn-ghost">Sign in</a>
        </div>
    </div>
    <div class="hero-visual">
        <div class="mock-card">
            <div class="mock-card-header">
                <span class="mock-label">March 2026</span>
                <span class="mock-total">₹12,450</span>
            </div>
            <div class="mock-bars">
                <div class="mock-bar-row">
                    <span class="mock-cat">Bills</span>
                    <div class="mock-bar-track">
                        <div class="mock-bar" style="width: 72%"></div>
                    </div>
                    <span class="mock-amt">₹4,500</span>
                </div>
                <div class="mock-bar-row">
                    <span class="mock-cat">Food</span>
                    <div class="mock-bar-track">
                        <div class="mock-bar mock-bar-2" style="width: 52%"></div>
                    </div>
                    <span class="mock-amt">₹3,200</span>
                </div>
                <div class="mock-bar-row">
                    <span class="mock-cat">Health</span>
                    <div class="mock-bar-track">
                        <div class="mock-bar mock-bar-3" style="width: 33%"></div>
                    </div>
                    <span class="mock-amt">₹2,050</span>
                </div>
                <div class="mock-bar-row">
                    <span class="mock-cat">Transport</span>
                    <div class="mock-bar-track">
                        <div class="mock-bar mock-bar-4" style="width: 28%"></div>
                    </div>
                    <span class="mock-amt">₹1,800</span>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="features">
    <div class="features-inner">
        <div class="feature-card">
            <div class="feature-icon">₹</div>
            <h3 class="feature-title">Log expenses instantly</h3>
            <p class="feature-body">Add any expense in seconds. Category, amount, date, description — all in one simple form.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">◎</div>
            <h3 class="feature-title">Understand your patterns</h3>
            <p class="feature-body">See exactly where your money goes with category breakdowns and monthly summaries.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">◷</div>
            <h3 class="feature-title">Filter by time period</h3>
            <p class="feature-body">View your spending for any date range — last week, last month, or a custom period.</p>
        </div>
    </div>
</section>

<section class="cta-section">
    <div class="cta-inner">
        <h2 class="cta-title">Ready to take control?</h2>
        <p class="cta-body">Join thousands of people who track their expenses with Spendly.</p>
        <a href="{{ url_for('register') }}" class="btn-primary">Create free account</a>
    </div>
</section>

{% endblock %}
```

### `templates/login.html`
```html
{% extends "base.html" %}

{% block title %}Sign In — Spendly{% endblock %}

{% block content %}
<section class="auth-page">
    <div class="auth-card">
        <div class="auth-header">
            <span class="brand-icon">◈</span>
            <h1 class="auth-title">Welcome back</h1>
            <p class="auth-subtitle">Sign in to your Spendly account</p>
        </div>

        <form class="auth-form" method="POST" action="{{ url_for('login') }}">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required autocomplete="email">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required autocomplete="current-password">
            </div>

            <button type="submit" class="btn-primary btn-block">Sign in</button>
        </form>

        <p class="auth-footer">
            Don't have an account? <a href="{{ url_for('register') }}">Create one</a>
        </p>
    </div>
</section>
{% endblock %}
```

### `templates/register.html`
```html
{% extends "base.html" %}

{% block title %}Create Account — Spendly{% endblock %}

{% block content %}
<section class="auth-page">
    <div class="auth-card">
        <div class="auth-header">
            <span class="brand-icon">◈</span>
            <h1 class="auth-title">Create your account</h1>
            <p class="auth-subtitle">Start tracking expenses in seconds</p>
        </div>

        <form class="auth-form" method="POST" action="{{ url_for('register') }}">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required autocomplete="name">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required autocomplete="email">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required minlength="8" autocomplete="new-password">
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" required autocomplete="new-password">
            </div>

            <button type="submit" class="btn-primary btn-block">Create account</button>
        </form>

        <p class="auth-footer">
            Already have an account? <a href="{{ url_for('login') }}">Sign in</a>
        </p>
    </div>
</section>
{% endblock %}
```

---

## Step 4: Create Static Assets

### `static/css/style.css` — (12KB — copy from existing or create minimal)

```css
/* Minimal starter — replace with full design */
:root {
  --color-primary: #2563eb;
  --color-bg: #f8fafc;
  --color-surface: #ffffff;
  --color-text: #1e293b;
  --color-muted: #64748b;
  --radius: 8px;
  --shadow: 0 1px 3px rgba(0,0,0,0.1);
}

* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: 'DM Sans', sans-serif; background: var(--color-bg); color: var(--color-text); line-height: 1.6; }
.navbar { background: var(--color-surface); border-bottom: 1px solid #e2e8f0; padding: 1rem 2rem; }
.nav-inner { max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; }
.nav-brand { display: flex; align-items: center; gap: 0.5rem; text-decoration: none; color: var(--color-text); font-weight: 600; font-size: 1.25rem; }
.brand-icon { font-size: 1.5rem; }
.nav-links { display: flex; gap: 1rem; align-items: center; }
.nav-links a { text-decoration: none; color: var(--color-text); font-weight: 500; }
.nav-cta { background: var(--color-primary); color: white !important; padding: 0.5rem 1.25rem; border-radius: var(--radius); }
.main-content { max-width: 1200px; margin: 0 auto; padding: 3rem 2rem; }
.footer { background: var(--color-surface); border-top: 1px solid #e2e8f0; padding: 2rem; text-align: center; color: var(--color-muted); }
.footer-inner { display: flex; flex-direction: column; align-items: center; gap: 0.5rem; }
.btn-primary { background: var(--color-primary); color: white; border: none; padding: 0.75rem 1.5rem; border-radius: var(--radius); font-weight: 600; cursor: pointer; text-decoration: none; display: inline-block; }
.btn-ghost { background: transparent; color: var(--color-primary); border: 2px solid var(--color-primary); padding: 0.75rem 1.5rem; border-radius: var(--radius); font-weight: 600; text-decoration: none; display: inline-block; }
.btn-block { width: 100%; }
.auth-page { min-height: 60vh; display: flex; align-items: center; justify-content: center; padding: 2rem; }
.auth-card { background: var(--color-surface); padding: 2.5rem; border-radius: 16px; box-shadow: var(--shadow); width: 100%; max-width: 400px; }
.auth-header { text-align: center; margin-bottom: 2rem; }
.auth-title { font-family: 'DM Serif Display', serif; font-size: 1.75rem; margin-bottom: 0.5rem; }
.auth-subtitle { color: var(--color-muted); }
.form-group { margin-bottom: 1.25rem; }
.form-group label { display: block; margin-bottom: 0.5rem; font-weight: 500; }
.form-group input { width: 100%; padding: 0.75rem 1rem; border: 1px solid #e2e8f0; border-radius: var(--radius); font-size: 1rem; }
.form-group input:focus { outline: none; border-color: var(--color-primary); box-shadow: 0 0 0 3px rgba(37,99,235,0.1); }
.auth-footer { text-align: center; margin-top: 1.5rem; color: var(--color-muted); }
.auth-footer a { color: var(--color-primary); font-weight: 500; }
.hero { display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; align-items: center; margin-bottom: 4rem; }
.hero-badge { display: inline-block; background: #eff6ff; color: var(--color-primary); padding: 0.25rem 0.75rem; border-radius: 999px; font-size: 0.875rem; font-weight: 500; margin-bottom: 1rem; }
.hero-title { font-family: 'DM Serif Display', serif; font-size: 3rem; line-height: 1.1; }
.hero-title em { font-style: italic; }
.hero-subtitle { font-size: 1.125rem; color: var(--color-muted); margin: 1.5rem 0; max-width: 400px; }
.hero-actions { display: flex; gap: 1rem; }
.mock-card { background: var(--color-surface); border-radius: 16px; padding: 1.5rem; box-shadow: var(--shadow); }
.mock-card-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem; }
.mock-label { color: var(--color-muted); font-size: 0.875rem; }
.mock-total { font-family: 'DM Serif Display', serif; font-size: 1.5rem; }
.mock-bar-row { display: flex; align-items: center; gap: 1rem; margin-bottom: 1rem; }
.mock-cat { width: 80px; font-weight: 500; }
.mock-bar-track { flex: 1; height: 8px; background: #e2e8f0; border-radius: 4px; overflow: hidden; }
.mock-bar { height: 100%; background: var(--color-primary); border-radius: 4px; }
.mock-bar-2 { background: #10b981; }
.mock-bar-3 { background: #f59e0b; }
.mock-bar-4 { background: #ef4444; }
.mock-amt { width: 80px; text-align: right; font-weight: 500; }
.features { margin-bottom: 4rem; }
.features-inner { display: grid; grid-template-columns: repeat(3, 1fr); gap: 2rem; }
.feature-card { background: var(--color-surface); padding: 2rem; border-radius: 16px; box-shadow: var(--shadow); text-align: center; }
.feature-icon { font-size: 2.5rem; margin-bottom: 1rem; }
.feature-title { font-family: 'DM Serif Display', serif; font-size: 1.25rem; margin-bottom: 0.5rem; }
.feature-body { color: var(--color-muted); }
.cta-section { text-align: center; padding: 3rem 2rem; background: var(--color-primary); border-radius: 16px; color: white; }
.cta-title { font-family: 'DM Serif Display', serif; font-size: 2rem; margin-bottom: 1rem; }
.cta-body { font-size: 1.125rem; opacity: 0.9; margin-bottom: 1.5rem; }
.cta-section .btn-primary { background: white; color: var(--color-primary); }
.cta-section .btn-primary:hover { background: #f1f5f9; }

@media (max-width: 768px) {
  .hero { grid-template-columns: 1fr; }
  .hero-visual { display: none; }
  .features-inner { grid-template-columns: 1fr; }
  .nav-links a:not(.nav-cta) { display: none; }
}
```

### `static/js/main.js` — Minimal Client JS
```javascript
// Spendly — minimal client-side JS
console.log('Spendly loaded');

// Confirm password validation
document.addEventListener('DOMContentLoaded', () => {
  const confirmInput = document.getElementById('confirm_password');
  const passwordInput = document.getElementById('password');
  if (confirmInput && passwordInput) {
    confirmInput.addEventListener('input', () => {
      if (confirmInput.value !== passwordInput.value) {
        confirmInput.setCustomValidity('Passwords do not match');
      } else {
        confirmInput.setCustomValidity('');
      }
    });
  }
});
```

---

## Step 5: Create Init Script

### `init.ps1`
```powershell
# init.ps1 — Initializes the virtual environment, installs dependencies, and starts the app

Write-Host "=== Expense Tracker Setup ===" -ForegroundColor Cyan

# Step 1: Create virtual environment if it doesn't exist
if (-Not (Test-Path ".venv")) {
    Write-Host "Creating virtual environment..." -ForegroundColor Yellow
    python -m venv .venv
} else {
    Write-Host "Virtual environment already exists." -ForegroundColor Green
}

# Step 2: Activate the virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Yellow
& ".\.venv\Scripts\Activate.ps1"

# Step 3: Install dependencies
Write-Host "Installing dependencies..." -ForegroundColor Yellow
pip install -r requirements.txt

# Step 4: Start the app
Write-Host ""
Write-Host "=== Starting Expense Tracker on http://localhost:5001 ===" -ForegroundColor Cyan
python app.py
```

---

## Step 6: Create Documentation

### `README.md` — (use the full version from earlier)
### `CLAUDE.md` — (use the full version from earlier)
### `AGENTS.md` — (use the full version from earlier)

---

## Step 7: Create Agentic Flow Files

### `.agents/rules/agent-rules.md` — (use from earlier)
### `.agents/skills/skill-registry.md` — (use from earlier)
### `.agents/workflows/development-workflows.md` — (use from earlier)

---

## Step 8: Initialize Git & Push to GitHub

```bash
# Stage and commit
git add -A
git commit -m "Initial commit: Flask expense tracker with full setup"

# Create GitHub repo and push
gh repo create <username>/expenTrack --public --source=. --remote=origin --push
```

---

## Step 9: Verify Setup

```bash
# Run the setup script
.\init.ps1

# Or manually:
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python app.py

# Visit http://localhost:5001
# Test routes: /, /register, /login

# Run tests
pytest
```

---

## Expected Result

After completing all steps, you should have:

```
expense-tracker/
├── app.py
├── database/__init__.py
├── database/db.py
├── templates/base.html
├── templates/landing.html
├── templates/login.html
├── templates/register.html
├── static/css/style.css
├── static/js/main.js
├── requirements.txt
├── .gitignore
├── init.ps1
├── README.md
├── CLAUDE.md
├── AGENTS.md
├── .agents/rules/agent-rules.md
├── .agents/skills/skill-registry.md
└── .agents/workflows/development-workflows.md
```

The app runs on `http://localhost:5001` with landing page, registration, and login templates ready. Database module is a placeholder for Step 1 implementation.