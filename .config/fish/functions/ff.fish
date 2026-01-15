function ff --wraps=nvim\ .\ \'+FzfLua\ files\' --description alias\ ff\ nvim\ .\ \'+FzfLua\ files\'
  nvim . '+FzfLua files' $argv
        
end
