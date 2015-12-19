tmux has-session -t rmdev

if [ $? != 0 ]
then
  # New session, initial window named api, and detaching
  tmux new-session -s rmdev -n api -d

  # Get API rolling
  # C-m is the same as enter
  tmux send-keys -t rmdev 'cd ~/rm/api' C-m
  tmux send-keys -t rmdev 'vim' C-m

  tmux split-window -h -p 20 -t rmdev
  tmux split-window -v -p 50 -t rmdev

  tmux send-keys -t rmdev:1.2 'cd ~/rm/api' C-m

  tmux send-keys -t rmdev:1.3 'cd ~/rm/api' C-m
  tmux send-keys -t rmdev:1.3 'bundle && bundle exec rake db:migrate && rails s' C-m

  # Get dashboard rolling
  tmux new-window -n dashboard -t rmdev
  tmux send-keys -t rmdev:2 'cd ~/rm/project' C-m
  tmux send-keys -t rmdev:2 'vim' C-m

  tmux split-window -h -p 20 -t rmdev
  tmux split-window -v -p 50 -t rmdev

  tmux send-keys -t rmdev:2.2 'cd ~/rm/project' C-m

  tmux send-keys -t rmdev:2.3 'cd ~/rm/project' C-m
  tmux send-keys -t rmdev:2.3 'ember serve' C-m
fi
tmux attach -t rmdev

