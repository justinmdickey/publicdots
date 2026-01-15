function chat --wraps='aichat -s Chat' --wraps='cd ~/Chat && aichat -s Chat' --description 'alias chat cd ~/Chat && aichat -s Chat'
  cd ~/Chat && aichat -s Chat $argv
        
end
