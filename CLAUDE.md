# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

claude-fsd is an automated development system that runs continuous AI agent-driven development cycles. It operates like "Tesla FSD for code" - multiple specialized AI agents (Developer, Planner, Reviewer, Tester) work together autonomously to build projects while allowing human oversight and intervention.

## Core Commands

```bash
# Main entry points
claude-fsd              # Interactive mode with guided setup
claude-fsd dev          # Jump directly to development mode
claudefsd-dev           # Direct development agent execution (continuous loop)

# Planning and setup
claudefsd-analyze-brief # Generate questions from BRIEF.md (uses opus model)
claudefsd-create-plan   # Create development plan from answered questions (uses opus model)

# Testing and validation
./test-failure-detection.sh  # Test failure detection mechanisms
```

## Model Selection Strategy

The system automatically selects Claude models based on the complexity and nature of each task:

- **Opus Model**: Used for complex architectural work requiring deep thinking
  - Upfront planning (`claudefsd-analyze-brief`)
  - Architecture planning (`claudefsd-create-plan`)
  - Megathinking mode (every 4th iteration in development cycle)
  
- **Sonnet Model**: Used for regular development iterations
  - Standard development tasks (iterations 1, 2, 3, 5, 6, 7, etc.)
  - All three agents (Planner, Developer, Reviewer) use the same model per iteration

## Architecture

### Agent System Design
The system uses multiple AI agents working in cycles:
- **Planner Agent**: Analyzes docs/PLAN.md and selects next task with megathinking mode every 4th iteration
- **Developer Agent**: Implements tasks using Claude Code with `--dangerously-skip-permissions`
- **Reviewer Agent**: Uses Codex (if available) for static code review in background
- **Tester Agent**: Reviews, validates, and can commit changes

### Key Files Structure
```
docs/
├── PLAN.md          # Development roadmap (primary task list)
├── CLAUDE-NOTES.md  # AI architect analysis
├── QUESTIONS.md     # Clarification questions
└── IDEAS.md         # Future improvements
BRIEF.md             # Project description
logs/                # AI session logs with timestamps
```

### Failure Detection System
- Monitors iteration timing (minimum 5 minutes expected)
- Tracks consecutive fast iterations (< 5 minutes)
- Exits after 3 consecutive fast iterations (indicates API throttling)
- Implements exponential backoff delays

## Development Workflow

### Loop Mechanics in claudefsd-dev
1. **Task Selection**: Planner reads docs/PLAN.md and selects next open task
2. **Implementation**: Developer implements with extensive error checking
3. **Review**: Parallel static review with Codex + comprehensive Claude review
4. **Testing/Commit**: Validates changes and handles git operations
5. **Repeat**: Continues until all tasks marked complete

### Megathinking Mode
Every 4th development cycle activates architectural planning mode for high-level system design considerations.

## Error Handling Philosophy
- **No cheating patterns**: Never disable tests, exclude files from compilation, or use silent fallbacks
- **Fail fast**: Integration failures should throw exceptions, not return mock data
- **No production fallbacks**: Avoid try/catch blocks that hide errors with default values
- **Defensive programming**: All edge cases must throw proper exceptions

## Dependencies
- **Required**: `claude` command (Claude CLI)
- **Optional**: `codex` command for enhanced code review
- **Optional**: OPENAI_API_KEY environment variable for Codex features

## Git Branch Strategy
- Stays on current branch if it's a proper feature branch
- Avoids branch switching during automated cycles
- Uses git for version control (no backup copies needed)

## Testing Strategy
- Emphasizes integration tests over unit tests
- Tests should exercise real systems (databases, APIs) non-destructively  
- No mocking without explicit permission
- Lint and architecture tests run frequently during development