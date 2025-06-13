#!/bin/bash

# Test script for the new interview system integration

set -e

echo "Testing claudefsd interview integration..."
echo

# Check if main script shows the new menu
echo "1. Testing menu display:"
echo "claudefsd (press 5 to exit):" 
echo "5" | ./bin/claudefsd | grep -E "(Interactive interview|Batch questions)" && echo "✓ Menu updated correctly" || echo "✗ Menu not updated"

echo
echo "2. Testing command line interface:"

# Check if interview command is recognized
./bin/claudefsd interview --help 2>&1 | grep -q "No BRIEF.md" && echo "✓ Interview command recognized" || echo "✗ Interview command not found"

echo
echo "3. Testing file detection:"

# Create a test environment
TEST_DIR=$(mktemp -d)
cd $TEST_DIR

# Copy the bin directory
cp -r $OLDPWD/bin .
cp -r $OLDPWD/prompts .

# Test without BRIEF.md
echo "5" | ./bin/claudefsd | grep -q "BRIEF.md missing" && echo "✓ Detects missing BRIEF.md" || echo "✗ Failed to detect missing BRIEF.md"

# Create docs directory and BRIEF.md (prefer docs location)
mkdir -p docs
echo "# Test Project" > docs/BRIEF.md

# Test default choice logic
echo "Testing default choice: "
echo "" | timeout 2 ./bin/claudefsd 2>&1 | grep -q "Enter your choice \[1\]" && echo "✓ Default is interview when no requirements" || echo "✗ Wrong default choice"

# Cleanup
cd $OLDPWD
rm -rf $TEST_DIR

echo
echo "Integration test complete!"