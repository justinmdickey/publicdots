function tempclaude --description 'Start claude in a new temp directory'
    cd (mktemp -d) && claude $argv
end
