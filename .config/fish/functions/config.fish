function config --wraps=cd\ \~/dots/.config\ \&\&\ nvim\ \'+NeoTree\' --wraps=cd\ \~/dots/.config\ \&\&\ nvim\ \'+Neotree\' --wraps='cd ~/dots/.config && nvim' --description 'alias config cd ~/dots/.config && nvim'
  cd ~/dots/.config && nvim $argv
        
end
