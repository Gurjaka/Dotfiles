{pkgs}:
pkgs.writeShellScriptBin "coding" ''
  SESSION_NAME="Coding"

  # Check if the session already exists
  tmux has-session -t $SESSION_NAME

  # If the session doesn't exist, create it
  if [ $? != 0 ]; then
  	# Start a new session
  	tmux new-session -d -s $SESSION_NAME

  	# Rename the first window to "Main Window"
  	tmux rename-window -t $SESSION_NAME:0 'Main Window'

  	# Split the window into two vertical panes: left (CODE) and right (TASKS + empty space)
  	tmux split-window -h -t $SESSION_NAME:0

  	# Resize the left pane (CODE) to take up approximately 40% of the screen
  	tmux resize-pane -R 40 # Shrink the right pane, make left larger

  	# In the left pane (CODE), run neovim or another editor
  	tmux send-keys -t $SESSION_NAME:0.0 'nvim' C-m  # Open neovim in CODE

  	# In the right pane, split it into two vertical panes (TASKS and empty space)
  	tmux split-window -v -t $SESSION_NAME:0.1

  	# Resize the bottom right pane to take up more space
  	tmux resize-pane -U 10 # Expand the bottom pane

  	# Change to working directory for the first window (CODE)
  	tmux send-keys -t $SESSION_NAME:0.1 'nvim tasks.md' C-m

  	# Focus pane 0
  	tmux select-pane -t $SESSION_NAME:0.0

  	# Attach to the session
  	tmux attach-session -t $SESSION_NAME
  else
  	# If the session exists, just attach to it
  	tmux attach-session -t $SESSION_NAME
  fi
''
