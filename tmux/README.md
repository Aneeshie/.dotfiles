# Tmux Commands & Keybindings Reference

## Basic Setup Commands

### Install and Start Tmux
```bash
# Install tmux (macOS)
brew install tmux

# Install tmux (Ubuntu/Debian)
sudo apt install tmux

# Start a new tmux session
tmux

# Start a named session
tmux new-session -s mysession

# List all sessions
tmux list-sessions
tmux ls

# Attach to a session
tmux attach-session -t mysession
tmux a -t mysession

# Kill a session
tmux kill-session -t mysession
```

## Prefix Key
- **New Prefix**: `Ctrl+c` (instead of default `Ctrl+b`)
- All commands below use `Ctrl+c` as the prefix unless specified as "direct"

## Window Management

### Smart Window Switching (Direct - No Prefix Needed)
- `Option+1` through `Option+9` - Switch to window 1-9 (create if doesn't exist)
- `Option+0` - Switch to window 10 (create if doesn't exist)

### Window Operations (Prefix Required)
- `Ctrl+c` then `c` - Create new window (in current directory)
- `Ctrl+c` then `n` - Next window
- `Ctrl+c` then `p` - Previous window
- `Ctrl+c` then `w` - List all windows
- `Ctrl+c` then `,` - Rename current window
- `Ctrl+c` then `&` - Kill current window
- `Ctrl+c` then `s` - Choose session/window tree

## Pane Management

### Pane Creation (Prefix Required)
- `Ctrl+c` then `|` - Split pane vertically (side by side)
- `Ctrl+c` then `-` - Split pane horizontally (top/bottom)

### Pane Navigation (Prefix Required)
- `Ctrl+c` then `h` - Move to left pane
- `Ctrl+c` then `j` - Move to bottom pane
- `Ctrl+c` then `k` - Move to top pane
- `Ctrl+c` then `l` - Move to right pane

### Pane Resizing (Prefix Required - Repeatable)
- `Ctrl+c` then `H` - Resize pane left (hold to repeat)
- `Ctrl+c` then `J` - Resize pane down (hold to repeat)
- `Ctrl+c` then `K` - Resize pane up (hold to repeat)
- `Ctrl+c` then `L` - Resize pane right (hold to repeat)

### Pane Operations (Prefix Required)
- `Ctrl+c` then `z` - Toggle pane zoom (fullscreen)
- `Ctrl+c` then `x` - Kill current pane
- `Ctrl+c` then `q` - Show pane numbers
- `Ctrl+c` then `{` - Move pane left
- `Ctrl+c` then `}` - Move pane right

## Copy Mode & Text Selection

### Enter Copy Mode
- `Ctrl+c` then `Escape` - Enter copy mode
- `Ctrl+c` then `[` - Enter copy mode (alternative)

### Copy Mode Navigation (Vim-style)
- `h/j/k/l` - Move cursor
- `w` - Move word forward
- `b` - Move word backward
- `0` - Move to beginning of line
- `$` - Move to end of line
- `g` - Go to top
- `G` - Go to bottom

### Text Selection in Copy Mode
- `v` - Start visual selection
- `V` - Start line selection
- `r` - Toggle rectangle selection
- `y` - Copy selection and exit copy mode
- `Escape` - Exit copy mode

## Session Management

### Session Operations (Prefix Required)
- `Ctrl+c` then `d` - Detach from session
- `Ctrl+c` then `$` - Rename session
- `Ctrl+c` then `X` - Kill session (with confirmation)
- `Ctrl+c` then `s` - Choose session interactively

## Configuration & System

### Config Operations (Prefix Required)
- `Ctrl+c` then `r` - Reload tmux configuration
- `Ctrl+c` then `:` - Enter command mode
- `Ctrl+c` then `?` - Show all keybindings

### System Operations
- `Ctrl+c` then `t` - Show time
- `Ctrl+c` then `i` - Display session info

## Special Features

### Mouse Support
- **Click** - Select pane
- **Drag** - Resize panes
- **Double-click** - Select word
- **Scroll** - Scroll through history

### Screen Clearing (Direct - No Prefix)
- `Ctrl+l` - Clear screen and tmux history

## Command Line Usage

### Basic Commands
```bash
# Create new session with name
tmux new -s work

# List all sessions
tmux ls

# Attach to session
tmux attach -t work

# Kill specific session
tmux kill-session -t work

# Kill all sessions
tmux kill-server

# Send command to session
tmux send-keys -t work "ls -la" Enter
```

### Advanced Commands
```bash
# Create session with multiple windows
tmux new-session -d -s dev
tmux new-window -t dev -n editor
tmux new-window -t dev -n server
tmux send-keys -t dev:editor "nvim" Enter
tmux send-keys -t dev:server "npm start" Enter

# Split window into panes
tmux split-window -h -t dev:editor
tmux split-window -v -t dev:editor

# Capture pane content
tmux capture-pane -t dev:editor -p
```

## Quick Reference Card

| Action | Keybinding |
|--------|------------|
| **Prefix** | `Ctrl+c` |
| **Switch Window** | `Option+1-9,0` |
| **Split Vertical** | `Ctrl+c` + `\|` |
| **Split Horizontal** | `Ctrl+c` + `-` |
| **Navigate Panes** | `Ctrl+c` + `h/j/k/l` |
| **Resize Panes** | `Ctrl+c` + `H/J/K/L` |
| **New Window** | `Ctrl+c` + `c` |
| **Copy Mode** | `Ctrl+c` + `Escape` |
| **Reload Config** | `Ctrl+c` + `r` |
| **Detach** | `Ctrl+c` + `d` |

## Tips & Tricks

1. **Window Indexing**: Windows start at 1 (not 0)
2. **Smart Switching**: `Option+Number` creates window if it doesn't exist
3. **Mouse Enabled**: Click and drag to interact with panes
4. **Vim Keys**: All navigation uses vim-style hjkl keys
5. **Current Directory**: New panes/windows open in current directory
6. **Visual Feedback**: Catppuccin theme provides clear visual cues
