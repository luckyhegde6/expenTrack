# Agentic Development Workflows for Spendly

## Workflow 1: New Feature Implementation

```mermaid
graph TD
    A[User Request] --> B{Skill Check}
    B -->|New Feature| C[superpowers:brainstorming]
    C --> D[superpowers:writing-plans]
    D --> E[Present Plan for Approval]
    E --> F[feature-dev:feature-dev]
    F --> G[superpowers:test-driven-development]
    G --> H[code-review:code-review]
    H --> I[superpowers:verification-before-completion]
    I --> J[Complete]
```

### Steps Detail

| Step | Agent/Tool | Output |
|------|------------|--------|
| 1 | `superpowers:brainstorming` | Design options, trade-offs, recommended approach |
| 2 | `superpowers:writing-plans` | Step-by-step implementation plan with success criteria |
| 3 | User | Approve / modify plan |
| 4 | `feature-dev:feature-dev` | Code changes across files |
| 5 | `superpowers:test-driven-development` | Tests written, passing |
| 6 | `code-review:code-review` | Findings (bugs, simplifications) |
| 7 | `superpowers:verification-before-completion` | App runs, tests pass, no regressions |

---

## Workflow 2: Bug Fix

```mermaid
graph TD
    A[Bug Report] --> B[superpowers:systematic-debugging]
    B --> C[Reproduce & Isolate]
    C --> D[Write Failing Test]
    D --> E[Fix Root Cause]
    E --> F[Verify Test Passes]
    F --> G[Regression Test]
    G --> H[superpowers:verification-before-completion]
```

### Steps Detail

| Step | Action |
|------|--------|
| 1 | `systematic-debugging` skill: gather symptoms, form hypotheses |
| 2 | Reproduce locally (run app, trigger bug) |
| 3 | Isolate to specific function/route |
| 4 | Write `pytest` test that fails |
| 5 | Fix minimal code to make test pass |
| 6 | Run full test suite (`pytest`) |
| 7 | Manual verify: `python app.py` → test in browser |

---

## Workflow 3: Database Schema Change (Step 1+)

```mermaid
graph TD
    A[Schema Change] --> B[feature-dev:code-explorer]
    B --> C[Read db.py, understand current]
    C --> D[superpowers:brainstorming]
    D --> E[Design Tables + Migrations]
    E --> F[superpowers:writing-plans]
    F --> G[Implement get_db/init_db/seed_db]
    G --> H[Test DB Functions]
    H --> I[code-review:code-review]
```

---

## Workflow 4: Template/UI Change

```mermaid
graph TD
    A[UI Change] --> B[feature-dev:code-explorer]
    B --> C[Read base.html, style.css]
    C --> D[superpowers:brainstorming]
    D --> E[Design Decision: Class names, Layout, Responsive]
    E --> F[feature-dev:feature-dev]
    F --> G[Edit template + CSS]
    G --> H[superpowers:verification-before-completion]
    H --> I[Visual check in browser]
```

---

## Workflow 5: Refactor / Code Cleanup

```mermaid
graph TD
    A[Refactor Request] --> B[feature-dev:code-explorer]
    B --> C[Understand Current Code]
    C --> D[simplify:simplify]
    D --> E[Apply Simplifications]
    E --> F[Run Tests]
    F --> G[Verify No Behavior Change]
```

---

## Git Integration Points

| Workflow Stage | Git Action |
|----------------|------------|
| Plan approved | `git checkout -b feature/<name>` |
| Implementation | Commit per logical unit |
| Tests added | `git add tests/` |
| Review complete | `git commit -m "feat: <description>"` |
| Verification | `git push origin feature/<name>` |
| PR created | Link to GitHub PR |

---

## Success Criteria Checklist

Before marking ANY workflow complete:

- [ ] `pytest` passes (all tests)
- [ ] `python app.py` starts without errors
- [ ] Manual test: visit `http://localhost:5001`, test affected routes
- [ ] No unused imports/variables from your changes
- [ ] Style matches existing code (run `simplify` if needed)
- [ ] Git diff shows only intended changes

---

## Emergency Procedures

| Situation | Action |
|-----------|--------|
| Tests fail unexpectedly | `git stash` → run tests → if pass, your change broke it |
| App won't start | Check `app.py` syntax, port 5001 free, venv activated |
| DB errors | Delete `expense_tracker.db`, re-run `init_db()` |
| Merge conflicts | `git status`, resolve in favor of intended changes |