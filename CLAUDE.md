# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

claude-fsd is an automated development system that runs continuous AI agent-driven development cycles. It operates like "Tesla FSD for code" - multiple specialized AI agents (Developer, Planner, Reviewer, Tester) work together autonomously to build projects while allowing human oversight and intervention.

## Core Commands

```bash
# Main entry points
claude-fsd              # Interactive mode with guided setup
claude-fsd dev          # Jump directly to development mode
claudefsd-dev           # Main development script with intelligent loop

# Planning and setup
claudefsd-interview     # Interactive expert Q&A to gather requirements (uses opus model)
claudefsd-create-plan   # Create development plan from interview results (uses opus model)

# Testing and validation
./test-failure-detection.sh  # Test failure detection mechanisms
```

## Model Selection Strategy

The system automatically selects Claude models based on the complexity and nature of each task:

- **Opus Model**: Used for complex architectural work requiring deep thinking
  - Requirements gathering (`claudefsd-interview`)
  - Architecture planning (`claudefsd-create-plan`)
  - Megathinking mode (every 4th iteration in development cycle)
  
- **Sonnet Model**: Used for regular development iterations
  - Standard development tasks (iterations 1, 2, 3, 5, 6, 7, etc.)
  - All three agents (Planner, Developer, Reviewer) use the same model per iteration

## Development Mode

The system uses an intelligent development loop that combines task planning with parallel execution:

- **Architecture**: Intelligent task selection with parallel Task agents
- **Features**: Loop-based with failure detection, megathinking every 4th iteration, adaptive execution
- **Approach**: Builds bulletproof systems while staying focused on the plan
- **Adaptability**: Automatically adjusts approach based on task complexity - can use single agent for complex sequential work or multiple parallel agents for independent tasks

## Architecture

### Development Loop Design
The system uses an intelligent development loop that:
- **Task Selection**: Analyzes docs/PLAN.md to identify open tasks and dependencies
- **Adaptive Execution**: Chooses between single-agent deep work or parallel Task agents based on task nature
- **Progress Tracking**: Updates docs/PLAN.md after each iteration
- **Megathinking**: Every 4th iteration activates opus model for architectural planning

### Key Files Structure
```
docs/
├── BRIEF.md         # Project description (preferred location)
├── PLAN.md          # Development roadmap (primary task list)
├── CLAUDE-NOTES.md  # AI architect analysis
├── QUESTIONS.md     # Clarification questions
└── IDEAS.md         # Future improvements
logs/                # AI session logs with timestamps
```

### Failure Detection System
- Monitors iteration timing (minimum 5 minutes expected)
- Tracks consecutive fast iterations (< 5 minutes)
- Exits after 3 consecutive fast iterations (indicates API throttling)
- Implements exponential backoff delays

## Development Workflow

### Loop Mechanics in claudefsd-dev
1. **Task Analysis**: Reads docs/PLAN.md and identifies all open tasks
2. **Execution Strategy**: Chooses between single-agent deep work or parallel multi-agent execution
3. **Implementation**: Executes tasks using selected approach with extensive error checking
4. **Progress Update**: Updates docs/PLAN.md to mark completed tasks
5. **Repeat**: Continues until all tasks complete or **<ALL DONE>** detected

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

## Common Bash Scripting Mistakes to Avoid
- **Never use `local` outside of functions**: The `local` keyword can only be used inside bash functions. Use regular variable assignment instead.
  ```bash
  # WRONG (outside function):
  local var_name=$(some_command)
  
  # CORRECT (outside function):
  var_name=$(some_command)
  ```