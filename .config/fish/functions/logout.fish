function logout --wraps='systemctl restart ly' --wraps='systemctl restart gdm' --description 'alias logout systemctl restart gdm'
  systemctl restart gdm $argv
        
end
