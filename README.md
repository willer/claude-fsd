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
2. **Answer questions in QUESTIONS.md** - The AI will generate clarifying questions for you to answer
3. **Let it rip** - Start the automated development process

## Commands

### Main wrapper command
```bash
claude-fsd        # Interactive mode (recommended for beginners)
claude-fsd dev    # Jump straight into development mode
claude-fsd plan   # Jump straight into planning mode
claude-fsd plan-gen # Generate a new project plan

# claudefsd also works the same way
claudefsd         # Same as claude-fsd
```

### Individual commands (if you know what you're doing)

#### claudefsd-dev
Runs the development agent fleet. This command:
- Reads your project plan from `docs/PLAN.md`
- Picks the next open task
- Assigns it to the developer agent
- Has the code reviewed by the reviewer agent
- Tests and commits the changes if everything looks good
- Repeats until all tasks are done

Every 4th cycle, it activates "megathinking mode" for architectural planning.

#### claudefsd-plan
Interactive planning session where you work with AI to:
- Define project requirements
- Break down complex features into tasks
- Prioritize and organize work
- Update the project roadmap

#### claudefsd-plan-gen
Generates an initial project plan from scratch based on:
- Your project brief (`BRIEF.md`)
- Any existing code or documentation
- Best practices for your tech stack

## How it Works

1. **Write a BRIEF.md** - Describe what you want to build
2. **Answer AI-generated questions** in `QUESTIONS.md` 
3. **Start the development loop** - The system automatically:
   - Picks the next task from your plan
   - Implements the feature
   - Reviews the code
   - Runs tests and commits changes
   - Repeats until complete

## Monitoring Progress (Like Tesla FSD)

This isn't sci-fi level "sleep through the entire project" automation - it's more like Tesla FSD. The system handles most of the work, but you should monitor it and be ready to intervene when needed.

**Recommended monitoring approach:**
- **Run a parallel Claude session** - Open another Claude window/tab to chat about the project
- **Check status periodically** - Ask the parallel Claude: "What's the current status of my project?"
- **Review the plan** - Look at `docs/PLAN.md` to see what's been completed and what's next
- **Watch for drift** - If the system goes off track, intervene before it gets too far

**When you need to course-correct:**
- **Update the plan** - Add urgent fixes or redirections to the top of `docs/PLAN.md`
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

Your project should have:
```
your-project/
├── docs/
│   ├── PLAN.md          # The development plan (tasks to do)
│   ├── CLAUDE-NOTES.md  # AI architect's analysis and notes
│   ├── QUESTIONS.md     # Questions for clarification
│   └── IDEAS.md         # Future ideas and improvements
├── logs/                # Logs from each AI session
└── BRIEF.md            # Project overview (optional)
```

## Tips for Success

1. **Keep your BRIEF.md concise** - A few clear paragraphs work better than lengthy specifications
2. **Answer questions thoroughly** - The AI's questions help it understand your exact needs
3. **Monitor periodically** - Check progress while it runs, especially during initial cycles
4. **Use the plan as your steering wheel** - Update `docs/PLAN.md` to guide development direction
5. **Trust the process** - Let it run autonomously, but verify the results


## License

MIT
