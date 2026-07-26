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
