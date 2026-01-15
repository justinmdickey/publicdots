function blackpearl --wraps='ssh justin@192.168.0.168' --wraps='ssh justin@192.168.0.167' --description 'alias blackpearl ssh justin@192.168.0.167'
  ssh justin@192.168.0.167 $argv
        
end
