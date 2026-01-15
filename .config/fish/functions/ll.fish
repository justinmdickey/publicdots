function ll --wraps=ls --wraps='eza -alh' --description 'alias ll eza -alh -icons=always'
  eza -alh --icons=always $argv
        
end
