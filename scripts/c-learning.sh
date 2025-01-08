#! /usr/bin/env sh

SESSION_NAME="C"

# Check if the session already exists
tmux has-session -t $SESSION_NAME

# If the session doesn't exist, create it
if [ $? != 0 ]; then
	# Locate project directory
	export C_DIRECTORY=$(find ~/ -type d -name C-Programming-Language -print -quit)

  # Start a new session
  tmux new-session -d -s $SESSION_NAME

  # Rename the first window to "Main Window"
  tmux rename-window -t $SESSION_NAME:0 'Main Window'

  # Change to working directory for the first window (CODE)
  tmux send-keys -t $SESSION_NAME:0.0 'cd $C_DIRECTORY/src' C-m

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
  tmux send-keys -t $SESSION_NAME:0.1 'cd $C_DIRECTORY/tasks' C-m

  # In the top-right pane (TASKS), open neovim
  tmux send-keys -t $SESSION_NAME:0.1 'nvim' C-m  # Open TASK

  # Now, add the CAVA pane at the bottom left (below CODE)
  tmux split-window -v -t $SESSION_NAME:0.0

  # Change to working directory for the third window (CODE)
  tmux send-keys -t $SESSION_NAME:0.3 'cd $C_DIRECTORY/src' C-m

	# Focus pane 0
	tmux select-pane -t $SESSION_NAME:0.0

  # Resize the bottom left pane (CAVA) to be smaller (just a few rows)
  tmux resize-pane -D 20 # Shrink CAVA pane

  # In the bottom left pane (CAVA), run cava (music visualizer)
  tmux send-keys -t $SESSION_NAME:0.1 'cava' C-m  # Run cava (music visualizer)

  # Attach to the session
  tmux attach-session -t $SESSION_NAME
else
  # If the session exists, just attach to it
  tmux attach-session -t $SESSION_NAME
fi
