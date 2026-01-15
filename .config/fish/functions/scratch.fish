function scratch --description 'alias scratch tmux attach-session -t scratch || tmux new-session -s scratch'
  tmux attach-session -t scratch || tmux new-session -s scratch $argv
        
end
