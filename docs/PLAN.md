# Development Plan

- [ ] Restore the full contents of BRIEF.md to reflect the original project description and key requirements.
- [ ] Create or restore docs/QUESTIONS.md and docs/CLAUDE-NOTES.md as per project specification (see CLAUDE.md F:CLAUDE.md†L49-L56).
- [ ] Update bin/claudefsd-dev to implement the planner step:
  - Read docs/PLAN.md, identify all open tasks, and generate the next_task prompt for project planning.
- [ ] Update bin/claudefsd-dev to implement the developer step:
  - Parse implementation plan, execute changes, run linter/tests, and log results (see prompt specification in logs).
- [ ] Update bin/claudefsd-dev to implement the reviewer/tester step:
  - Run static code review to validate the developer's output for:
    * No bypass of tests or content policy (`--dangerously-skip-permissions` must not be used)
    * No silent exception handlers or fallback values
    * No disabled or ignored tests
    * No removed or modified documentation files (`BRIEF.md`, `docs/PLAN.md`, etc.)
    * No exclusions from compilation or build configuration
  - Enforce fail-fast behavior on review failures (exit non-zero and abort)
  - Commit changes only after full verification (see prompt spec in logs).
- [ ] Add pre-commit hooks for linting, testing, and to disallow `--dangerously-skip-permissions` flags in scripts.
- [ ] Validate the end-to-end flow by running integration tests and manual test scenarios (see test-manual.md).

# Notes:
- Missing documentation files (QUESTIONS.md, CLAUDE-NOTES.md, IDEAS.md) must be added.
- Ensure version in package.json is bumped only after completing all functional tasks.
