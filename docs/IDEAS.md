# Ideas

- Enforce a pre-commit hook to disallow `--dangerously-skip-permissions` flags in scripts.
- Add automated tests to verify that documentation files (`BRIEF.md`, `docs/PLAN.md`, etc.) exist and include required sections before running tasks.
- Create docs/test-manual.md template with manual and integration test scenarios for full pipeline validation.
- Provide CI integration test that runs the planner step and checks for `<analysis>` and `<task_description>` tags in output.
- Add automated checks to detect any simulation of failures (e.g., output containing "Mock Claude") and treat it as an error.