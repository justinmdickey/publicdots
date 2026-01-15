function c --wraps=config --wraps='cd ~/' --wraps='cd ~/dots/.config && nvim' --description 'alias c cd ~/dots/.config && nvim'
  cd ~/dots/.config && nvim $argv
        
end
