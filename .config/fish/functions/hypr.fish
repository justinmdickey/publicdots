function hypr --wraps='nvim ~/.config/hypr/hyprland.conf' --description 'alias hypr nvim ~/.config/hypr/hyprland.conf'
  cd ~/dots/.config/hypr/ && nvim '+Oil .' $argv
        
end
