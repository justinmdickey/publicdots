function update --wraps=./home/justin/dots/Documents/Scripts/systemupdate.sh --wraps='cd ~/Documents/Scripts && ./systemupdate.sh' --description 'alias update cd ~/Documents/Scripts && ./systemupdate.sh'
  cd ~/Documents/Scripts && ./systemupdate.sh $argv
        
end
