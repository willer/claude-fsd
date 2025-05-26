#!/bin/bash

# Test script to verify failure detection in claudefsd-dev
# This simulates fast iterations by creating a mock Claude that exits quickly

set -e

echo "Testing failure detection mechanism..."

# Create a mock Claude script that exits immediately
mkdir -p test-env
cat > test-env/claude << 'EOF'
#!/bin/bash
echo "Mock Claude: Simulating API failure (exiting immediately)"
exit 0
EOF

chmod +x test-env/claude

# Temporarily modify PATH to use our mock Claude
export PATH="$(pwd)/test-env:$PATH"

# Create minimal test structure
mkdir -p docs logs
echo "# Test Brief" > BRIEF.md
echo "# Test Plan\n- [ ] Test task" > docs/PLAN.md

# Run claudefsd-dev with timeout to prevent infinite hanging
echo "Starting claudefsd-dev with mock Claude (should detect failure mode)..."
timeout 300 bin/claudefsd-dev || true

echo "Test completed. Check above output for failure detection messages."