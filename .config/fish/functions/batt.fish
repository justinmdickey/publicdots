function batt --wraps='cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT1/capacity' --description 'alias batt cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT1/capacity'
  cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT1/capacity $argv
        
end
