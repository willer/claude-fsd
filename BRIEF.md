# BRIEF.md

## Project: Claude FSD - Autonomous Development System

### Vision
Build an automated development system that operates like "Tesla Full Self-Driving" for code - AI agents continuously develop software with minimal human intervention while maintaining high quality standards.

### Core Requirements
- **Continuous Development Loop**: System should run indefinitely, selecting and implementing tasks autonomously
- **Multi-Agent Architecture**: Specialized agents for planning, development, review, and testing working in cycles
- **Human Oversight**: Allow monitoring and intervention without requiring constant attention
- **Failure Resilience**: Detect and handle API throttling, errors, and edge cases gracefully
- **Quality Enforcement**: Automated testing, linting, and code review before any commits

### Key Features Needed
1. Interactive setup mode for new projects
2. Automatic task selection from PLAN.md
3. Parallel code review capabilities (Claude + optional Codex)
4. Megathinking mode for architectural decisions every 4th cycle
5. Comprehensive logging of all agent activities
6. Git integration with smart commit messages

### Success Criteria
- Developers can start the system and walk away while it builds features
- System self-monitors and exits gracefully when throttled or stuck
- All code changes are reviewed and tested before committing
- Clear audit trail of decisions and implementations in logs