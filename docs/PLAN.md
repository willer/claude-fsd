# Development Plan

- [ ] Restore the full contents of BRIEF.md to reflect the original project description and key requirements.
  - Current BRIEF.md contains only a placeholder "# Test Brief"; please restore the original project description and key requirements from version control.
- [ ] Create or restore docs/QUESTIONS.md and docs/CLAUDE-NOTES.md as per project specification (see CLAUDE.md F:CLAUDE.md†L49-L56).
  - docs/QUESTIONS.md and docs/CLAUDE-NOTES.md exist but must reflect planner agent outputs. QUESTIONS.md should contain only clarifying questions, and CLAUDE-NOTES.md should hold high-level architectural analysis logs.
- [ ] Update bin/claudefsd-dev to implement the planner step:
  - Read docs/PLAN.md, identify all open tasks, and generate the next_task prompt for project planning.
  - Ensure the script actually reads and embeds the full contents of docs/PLAN.md, BRIEF.md, docs/QUESTIONS.md, and docs/CLAUDE-NOTES.md into the planner prompt rather than only instructing the AI to "read" them.
  - Remove any `--dangerously-skip-permissions` flags from claude invocations to enforce content policy.
  - Add explicit error handling for API failures; do not simulate or mock failures silently.
  - Validate that planner output includes correctly wrapped <analysis> and <task_description> tags.
  - Add integration tests or CI checks to verify the planner step reads file contents and enforces output format.
- [ ] Update bin/claudefsd-dev to implement the developer step:
  - Parse implementation plan, execute changes, run linter/tests, and log results (see prompt specification in logs).
  - Implement parsing of AI output tags (<implementation_plan>, <execution>, <linter_output>, <changes>, <questions_update>, <ideas_update>) to apply code changes, run linters and tests locally, and update documentation files accordingly.
- [ ] Update bin/claudefsd-dev to implement the reviewer/tester step:
  - Run static code review to validate the developer's output for:
    * No bypass of tests or content policy (`--dangerously-skip-permissions` must not be used)
    * No silent exception handlers or fallback values
    * No disabled or ignored tests
    * No removed or modified documentation files (`BRIEF.md`, `docs/PLAN.md`, etc.)
    * No exclusions from compilation or build configuration
  - Enforce fail-fast behavior on review failures (exit non-zero and abort)
  - Commit changes only after full verification (see prompt spec in logs).
  - After AI review (<review_summary>), ensure the script updates docs/PLAN.md for incomplete tasks, appends new questions or ideas, and performs git commit operations where appropriate.
- [ ] Add pre-commit hooks for linting, testing, and to disallow `--dangerously-skip-permissions` flags in scripts.
  - Include a hook to scan scripts and prevent inclusion of `--dangerously-skip-permissions` flags.
- [ ] Validate the end-to-end flow by running integration tests and manual test scenarios (see test-manual.md).
  - Create docs/test-manual.md with step-by-step manual and integration test scenarios to verify the full pipeline.

# Notes:
- Missing documentation files (QUESTIONS.md, CLAUDE-NOTES.md, IDEAS.md) must be added.
- Ensure version in package.json is bumped only after completing all functional tasks.