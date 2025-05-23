#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check dependencies
check_dependencies() {
    local check_codex=${1:-true}  # Check codex by default
    local missing_deps=()
    local warnings=()
    
    # Check for claude
    if ! command_exists claude; then
        missing_deps+=("claude")
    fi
    
    # Check for codex (optional but recommended)
    if [ "$check_codex" = true ] && ! command_exists codex; then
        warnings+=("codex is not installed. Some review features will be unavailable.")
        warnings+=("Install it from: https://github.com/Codex-ai/codex")
    fi
    
    # Check for OPENAI_API_KEY (optional for codex)
    if [ "$check_codex" = true ] && [[ ! -v OPENAI_API_KEY ]] || [[ -z "$OPENAI_API_KEY" ]]; then
        warnings+=("OPENAI_API_KEY is not set. Codex features will be limited.")
        warnings+=("Set it with: export OPENAI_API_KEY='your-key-here'")
    fi
    
    # Show critical errors
    if [ ${#missing_deps[@]} -ne 0 ]; then
        echo -e "${RED}❌ Missing required dependencies:${NC}"
        for dep in "${missing_deps[@]}"; do
            echo -e "  - $dep"
            if [ "$dep" = "claude" ]; then
                echo -e "    Install from: https://docs.anthropic.com/en/docs/claude-code"
            fi
        done
        echo
        exit 1
    fi
    
    # Show warnings
    if [ ${#warnings[@]} -ne 0 ]; then
        echo -e "${YELLOW}⚠️  Optional dependencies:${NC}"
        for warning in "${warnings[@]}"; do
            echo -e "  - $warning"
        done
        echo
    fi
}

# If sourced directly, run the check
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    check_dependencies "$@"
fi