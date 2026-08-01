# Agent Skills Registry for Spendly

## Available Skills (Auto-Loaded)

### Process Skills (Invoke First)
| Skill | When to Use | Trigger |
|-------|-------------|---------|
| `superpowers:brainstorming` | New features, architectural decisions | "Add X", "Implement Y", multiple approaches |
| `superpowers:systematic-debugging` | Bug fixes, errors, unexpected behavior | "Fix bug", "Why does X fail", "Error in Y" |
| `superpowers:writing-plans` | Multi-step implementation | "Build feature", "Refactor X", >2 files |
| `superpowers:test-driven-development` | New logic, validation, calculations | "Add validation", "Calculate totals", "Filter data" |

### Implementation Skills
| Skill | When to Use | Trigger |
|-------|-------------|---------|
| `feature-dev:feature-dev` | Building new features end-to-end | After plan approved |
| `feature-dev:code-explorer` | Understanding existing code | "How does X work", "Trace flow for Y" |
| `feature-dev:code-architect` | Designing architecture | "Design system for X", "Plan data model" |

### Quality Skills
| Skill | When to Use | Trigger |
|-------|-------------|---------|
| `code-review:code-review` | Pre-PR review, post-implementation | Before commit/PR |
| `simplify:simplify` | Post-implementation cleanup | After feature complete |
| `superpowers:verification-before-completion` | Final verification | "Done", "Ready to commit" |

### Research Skills
| Skill | When to Use | Trigger |
|-------|-------------|---------|
| `deep-research:deep-research` | External docs, best practices, comparisons | "Best way to X", "Compare Y vs Z" |
| `mcp__plugin_context7_context7__resolve-library-id` | Library docs (Flask, pytest, etc.) | "Flask route params", "pytest fixtures" |

## Skill Invocation Protocol

```
1. User request received
2. CHECK: Does ANY skill apply? (Even 1% chance → INVOKE)
3. INVOKE highest-priority matching skill FIRST
4. Follow skill instructions exactly
5. If skill delegates to subagent → Wait for result
6. Continue with next skill or implementation
```

## Project-Specific Skill Mappings

### Flask Route Development
```
1. feature-dev:code-explorer (understand current routes)
2. superpowers:brainstorming (design new route)
3. superpowers:writing-plans (plan implementation)
4. feature-dev:feature-dev (implement)
5. superpowers:test-driven-development (add tests)
6. code-review:code-review (verify)
```

### Database Work (Step 1)
```
1. feature-dev:code-explorer (read db.py comments)
2. superpowers:brainstorming (schema design)
3. superpowers:writing-plans (plan tables, functions)
4. feature-dev:feature-dev (implement get_db, init_db, seed_db)
5. superpowers:test-driven-development (test DB functions)
```

### Template/UI Changes
```
1. feature-dev:code-explorer (read base.html, CSS)
2. superpowers:brainstorming (design decisions)
3. feature-dev:feature-dev (implement template + CSS)
4. superpowers:verification-before-completion (visual check)
```

## Forbidden Patterns

❌ **Never** start coding without checking skills
❌ **Never** skip brainstorming for new features
❌ **Never** skip systematic-debugging for bugs
❌ **Never** skip verification-before-completion
❌ **Never** assume — ask if unclear

## Quick Reference: Skill Commands

```bash
# In conversation, invoke via:
/brainstorming
/systematic-debugging
/writing-plans
/test-driven-development
/feature-dev
/code-review
/simplify
/verification-before-completion
/deep-research
```