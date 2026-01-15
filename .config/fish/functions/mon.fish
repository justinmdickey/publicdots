function mon --wraps='hyprctl monitors | head -n 2' --description 'alias mon hyprctl monitors | head -n 2'
  hyprctl monitors | head -n 2 $argv
        
end
