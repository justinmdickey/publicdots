function host --wraps=hostnamectl\ \|\ awk\ \'NR==1\{print\ \;\ exit\}\' --description alias\ host\ hostnamectl\ \|\ awk\ \'NR==1\{print\ \;\ exit\}\'
  hostnamectl | awk 'NR==1{print ; exit}' $argv
        
end
