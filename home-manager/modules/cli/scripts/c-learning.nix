{pkgs}:
pkgs.writeScriptBin "c-learning" ''
  SESSION_NAME="C"

  tmux has-session -t $SESSION_NAME

  if [ $? != 0 ]; then
  	export C_DIRECTORY=$(find ~/ -type d -name C-Programming-Language -print -quit)

    tmux new-session -d -s $SESSION_NAME

    tmux rename-window -t $SESSION_NAME:0 'Main Window'

    tmux send-keys -t $SESSION_NAME:0.0 'cd $C_DIRECTORY/src' C-m

    tmux split-window -h -t $SESSION_NAME:0

    tmux resize-pane -R 40 # Shrink the right pane, make left larger

    tmux send-keys -t $SESSION_NAME:0.0 'nvim' C-m  # Open neovim in CODE

    tmux resize-pane -U 10 # Expand the bottom pane

    tmux send-keys -t $SESSION_NAME:0.1 'cd $C_DIRECTORY/tasks' C-m

    tmux send-keys -t $SESSION_NAME:0.1 'nvim' C-m  # Open TASK

    tmux split-window -v -t $SESSION_NAME:0.0

    tmux send-keys -t $SESSION_NAME:0.3 'cd $C_DIRECTORY/src' C-m

  	tmux select-pane -t $SESSION_NAME:0.0

    tmux resize-pane -D 20 # Shrink CAVA pane

    tmux attach-session -t $SESSION_NAME
  else
    tmux attach-session -t $SESSION_NAME
  fi
''
