# claude-fsd

Automated project development - let AI build your project while you sleep.

## What is this?

claude-fsd is an automated development system that runs continuous development cycles without constant supervision. Write a brief description of what you want, answer some clarifying questions, then let it build your project autonomously.

Think of it like **Tesla FSD for code** - it handles the driving, but you should keep an eye on it and occasionally take the wheel when needed.

### How the Agent System Works

The system operates with multiple specialized AI agents working together:

- 🧑‍💻 **Developer Agent**: Writes code, implements features, fixes bugs
- 📋 **Planner Agent**: Breaks down tasks, manages the development roadmap  
- 👀 **Reviewer Agent**: Reviews code quality, catches issues, ensures best practices
- 🧪 **Tester Agent**: Runs tests, validates changes, commits clean code

The agents work in continuous cycles:
```
Plan → Develop → Review → Test → Commit → Repeat
```

You can leave it running while you grab lunch or sleep - it just keeps going until it thinks the project is complete.

## Installation

```bash
npm install -g claude-fsd
```

## Quick Start

```bash
claude-fsd
```

The system will walk you through the setup process:

1. **Create a BRIEF.md** - Write a short description of what you want to build
2. **Answer questions** - The AI will generate clarifying questions for you to answer
3. **Let it rip** - Start the automated development process

### Working with Multiple Projects

You can run multiple projects in the same repository using the `--working-dir` parameter:

```bash
# Default behavior (uses 'docs' directory)
claude-fsd

# Custom project directories
claude-fsd --working-dir=frontend
claude-fsd --working-dir=backend
claude-fsd --working-dir=client-app/docs
```

## Commands

### Main wrapper command
```bash
claude-fsd                    # Interactive mode (recommended for beginners)
claude-fsd dev                # Jump straight into development mode
claude-fsd interview          # Interactive requirements gathering
claude-fsd create-plan        # Generate development plan from requirements

# With custom working directory
claude-fsd --working-dir=project1 dev
claude-fsd --working-dir=backend interview

# Fast mode (skips slow o3-pro planning)
claude-fsd create-plan --fast
claude-fsd --working-dir=project1 --fast create-plan

# claudefsd also works the same way
claudefsd                     # Same as claude-fsd
```

### Individual commands (if you know what you're doing)

#### claudefsd-dev
Runs the development agent fleet. This command:
- Reads your project plan from `PLAN.md` in your working directory
- Intelligently selects and executes tasks (single agent for complex work, parallel agents for independent tasks)
- Has the code reviewed and tested
- Updates the plan to track progress
- Repeats until all tasks are done

Every 4th cycle, it activates "megathinking mode" using the Opus model for architectural planning.

#### claudefsd-interview
Interactive expert Q&A session that:
- Analyzes your BRIEF.md with multiple AI personas (DBA, Architect, UX Expert, etc.)
- Asks targeted questions to understand requirements
- Saves answers in QUESTIONS.md and consolidated requirements in REQUIREMENTS.md
- Supports resuming interrupted sessions

#### claudefsd-create-plan
Generates a comprehensive development plan based on:
- Your project brief (BRIEF.md)
- Interview answers (QUESTIONS.md) or requirements (REQUIREMENTS.md)
- Creates PLAN.md with prioritized tasks and CLAUDE-NOTES.md with architectural analysis
- Uses Opus model for standard planning, o3-pro for deep strategic analysis (when codex available)
- Use `--fast` flag to skip o3-pro step for quicker results

## How it Works

1. **Write a BRIEF.md** - Describe what you want to build in your working directory
2. **Run the interview** - Answer AI-generated questions from domain experts
3. **Generate the plan** - AI creates a comprehensive development roadmap
4. **Start the development loop** - The system automatically:
   - Analyzes all open tasks in PLAN.md
   - Intelligently executes tasks (sequentially or in parallel)
   - Updates the plan to track progress
   - Repeats until all tasks are complete or **<ALL DONE>** is detected

## Monitoring Progress (Like Tesla FSD)

This isn't sci-fi level "sleep through the entire project" automation - it's more like Tesla FSD. The system handles most of the work, but you should monitor it and be ready to intervene when needed.

**Recommended monitoring approach:**
- **Run a parallel Claude session** - Open another Claude window/tab to chat about the project
- **Check status periodically** - Ask the parallel Claude: "What's the current status of my project?"
- **Review the plan** - Look at `PLAN.md` in your working directory to see what's been completed
- **Watch for drift** - If the system goes off track, intervene before it gets too far

**When you need to course-correct:**
- **Update the plan** - Add urgent fixes or redirections to the top of `PLAN.md`
- **Direct intervention** - Use your parallel Claude session to directly fix issues
- **The system adapts** - claude-fsd will pick up plan changes on the next loop iteration

**Interruptible design:**
- Hit Ctrl+C anytime to pause
- Restart later with `claude-fsd dev`
- Perfect for running overnight, during meetings, or while getting lunch

## Requirements

### Required
- Node.js >= 14.0.0
- Unix-like environment (macOS, Linux)
- [Claude CLI](https://docs.anthropic.com/en/docs/claude-code) (`claude` command)

### Optional (but recommended)
- [Codex](https://github.com/Codex-ai/codex) - For enhanced code review capabilities
- OpenAI API key - For Codex features (set `OPENAI_API_KEY` environment variable)

## Project Structure

Default structure (using 'docs' as working directory):
```
your-project/
├── docs/
│   ├── BRIEF.md         # Project overview and requirements
│   ├── PLAN.md          # The development plan (tasks with [ ] checkboxes)
│   ├── CLAUDE-NOTES.md  # AI architect's analysis and notes
│   ├── QUESTIONS.md     # Interview questions and answers
│   ├── REQUIREMENTS.md  # Consolidated requirements from interview
│   ├── IDEAS.md         # Future ideas and improvements
│   └── INTERVIEW-SESSION.json  # Interview session metadata
├── logs/                # Logs from each AI session
└── [your code files]
```

With custom working directory:
```
your-project/
├── frontend/
│   ├── BRIEF.md
│   ├── PLAN.md
│   └── ...
├── backend/
│   ├── BRIEF.md
│   ├── PLAN.md
│   └── ...
└── logs/
```

## Tips for Success

1. **Keep your BRIEF.md concise** - A few clear paragraphs work better than lengthy specifications
2. **Answer questions thoroughly** - The AI's questions help it understand your exact needs
3. **Monitor periodically** - Check progress while it runs, especially during initial cycles
4. **Use the plan as your steering wheel** - Update `PLAN.md` to guide development direction
5. **Trust the process** - Let it run autonomously, but verify the results
6. **Use --working-dir for multiple projects** - Run different projects in parallel by specifying different directories

## Model Selection Strategy

The system intelligently selects AI models based on task complexity:

- **o3-pro Model**: Used for the most complex strategic work (requires codex CLI)
  - Deep architectural planning (create-plan, unless --fast used)
  - Takes 5-15 minutes but provides exceptional strategic reasoning
  
- **Opus Model**: Used for complex architectural work
  - Requirements gathering (interview)
  - Standard architecture planning (create-plan with --fast or when codex unavailable)
  - Megathinking mode (every 4th dev iteration)
  
- **Sonnet Model**: Used for regular development
  - Standard development tasks
  - Code implementation and reviews
  - Most development iterations


## License

MIT
