# claude-fsd

Claude Full Stack Development (FSD) - Your AI-powered development team in a box.

## What is this?

Remember when junior developers were going to be replaced by AI? Well, the tables have turned. As explained in the excellent article ["Revenge of the Junior Developer"](https://sourcegraph.com/blog/revenge-of-the-junior-developer), AI has actually made junior developers more powerful than ever.

This tool takes that concept to the next level by creating an entire **agent fleet** - multiple AI agents working together like a development team:

- 🧑‍💻 **Developer Agent**: Writes code, implements features, fixes bugs
- 📋 **Planner Agent**: Breaks down tasks, manages the development roadmap
- 👀 **Reviewer Agent**: Reviews code quality, catches issues, ensures best practices
- 🧪 **Tester Agent**: Runs tests, validates changes, commits clean code

Think of it as having a full development team that never sleeps, never gets tired, and always follows best practices. The AI agents work in cycles, planning tasks, implementing them, reviewing the work, and then moving on to the next task.

## Installation

```bash
npm install -g claude-fsd
```

## Quick Start

Just run:
```bash
claude-fsd    # or claudefsd - both work the same
```

You'll get an interactive menu to choose what you want to do. It's that simple!

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
- Your project requirements (`docs/REQUIREMENTS.md`)
- Any existing code or documentation
- Best practices for your tech stack

## How it Works

1. **You define what you want** in `docs/REQUIREMENTS.md`
2. **AI creates a plan** breaking it down into manageable tasks
3. **The agent fleet executes** the plan task by task
4. **You review and guide** the process when needed

The agents work in a continuous loop:
```
Plan → Develop → Review → Test → Commit → Repeat
```

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
│   ├── REQUIREMENTS.md  # What you want built
│   ├── QUESTIONS.md     # Questions for clarification
│   └── IDEAS.md         # Future ideas and improvements
├── logs/                # Logs from each AI session
└── BRIEF.md            # Project overview (optional)
```

## Tips for Success

1. **Start small** - Break down your project into small, clear tasks
2. **Be specific** - The clearer your requirements, the better the results
3. **Review regularly** - Check in on what the agents are doing
4. **Use version control** - The agents will commit changes, but you should review them
5. **Trust but verify** - The agents are good but not perfect

## License

MIT