function dcu --wraps='docker-compose up -d' --description 'alias dcu docker-compose up -d'
  docker-compose up -d $argv
        
end
