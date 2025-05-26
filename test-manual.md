# Manual Testing Instructions

## Test Real Token Limit Scenarios

### Setup Test Project:
```bash
mkdir test-project && cd test-project
echo "# Test Project" > BRIEF.md
mkdir docs
echo "# Test Plan\n- [ ] Simple test task" > docs/PLAN.md
```

### Test Scenarios:

#### 1. Normal Operation Test
- Run `claude-fsd dev` with valid Claude access
- Verify iterations take >5 minutes and system continues normally
- Should see: "Normal iteration timing - continuing..."

#### 2. Token Limit Test  
- Exhaust your Claude daily token limit first
- Run `claude-fsd dev` 
- Should see failure detection activate after 3 fast iterations

#### 3. Network Issues Test
- Disconnect internet during `claude-fsd dev` run
- Reconnect after a few iterations
- Verify system recovers gracefully

### Expected Behavior:
- **Fast iterations**: Yellow warnings, increasing delays
- **3rd consecutive**: Red error message, graceful exit
- **Mixed fast/normal**: Counter resets on normal iteration

### Verify Logs:
Check `logs/` directory for complete interaction logs from each iteration.