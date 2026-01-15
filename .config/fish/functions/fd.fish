function fd --wraps=nvim\ \'+Telescope\ find_files\' --description alias\ fd\ nvim\ \'+Telescope\ find_files\'
  nvim '+Telescope find_files' $argv
        
end
