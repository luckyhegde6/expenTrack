# Expense Tracker

A Flask-based expense tracking application.

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
