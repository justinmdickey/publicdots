function clock --wraps='tty-clock -t -c' --wraps='tty-clock -t -c -D' --wraps='tty-clock -t -c -D -C 4' --description 'alias clock tty-clock -t -c -D -C 4'
  tty-clock -t -c -D -C 5 $argv
        
end
