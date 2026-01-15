if status is-interactive
    # Commands to run in interactive sessions can go here
 
    if test (uname) = "Darwin"
      fish_add_path /opt/homebrew/bin
    end
   
    # Fix paths (don't use -Ux repeatedly, it keeps appending)
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/swww/target/release
    
    set -x VISUAL nvim
    set -x EDITOR nvim
    set -gx MANPAGER 'nvim +Man!'

    # API keys - set your own
    # set -x OPENAI_API_KEY "your-key-here"
    # set -x ANTHROPIC_API_KEY "your-key-here"
    # set -x OMDB_API_KEY "your-key-here"
    # set -x OPENWEATHER_API_KEY "your-key-here"
    set -x KUBECONFIG /etc/rancher/k3s/k3s.yaml

    zoxide init --cmd cd fish | source
    starship init fish | source
    set -gx FZF_DEFAULT_OPTS "--margin 20% --no-info --layout reverse --border"
    source ~/.config/fish/welcome.fish
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -gx PATH ~/.npm-global/bin $PATH

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# Use fish_add_path instead of manually modifying PATH
fish_add_path /home/justin/.spicetify
fish_add_path /home/.cargo/bin
fish_add_path /usr/local/go/bin
fish_add_path /opt/homebrew/bin

# Special configuration for Cool Retro Term
if string match -q "*cool-retro-term*" $TERM; or string match -q "*cool-retro-term*" $TERM_PROGRAM
    # Disable possible sources of the "5u" indicator
    set --global pure_show_command_duration_threshold 0
    set --global pure_separate_prompt_on_error false
    set --global pure_enable_git false
    set --global pure_show_subsecond_command_duration false
    set --global pure_show_jobs false
    
    # You could also try this more drastic option if needed
    function fish_mode_prompt; end
end

# Neovim aliases - using simple lowercase names
alias nvclean='env NVIM_APPNAME=clean nvim --clean'
alias minvim='env NVIM_APPNAME=minvim nvim'
alias nvlazy='env NVIM_APPNAME=nvlazy nvim'
alias nvkick='env NVIM_APPNAME=nvkick nvim'
alias nvchad='env NVIM_APPNAME=nvchad nvim'
alias nvastro='env NVIM_APPNAME=nvastro nvim'

function nvims
    set -l options "Default" "Minvim" "Clean" "Kickstart" "LazyVim" "NvChad" "AstroNvim"
    set -l configs "" "minvim" "nvclean" "nvkick" "nvlazy" "nvchad" "nvastro"
    
    set -l selected_option (printf '%s\n' $options | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
    
    if test -z "$selected_option"
        echo "Nothing selected"
        return 0
    end
    
    # Find the index of the selected option
    set -l index 1
    for opt in $options
        if test "$opt" = "$selected_option"
            break
        end
        set index (math $index + 1)
    end
    
    # Get the corresponding config name
    set -l config $configs[$index]
    
    # Launch nvim with the appropriate config
    env NVIM_APPNAME=$config nvim $argv
end

function sshs
    set server (grep -E '^Host ' ~/.ssh/config | awk '{print $2}' | fzf)
    if test -n "$server"
        ssh $server
    end
end

# Added by LM Studio CLI (lms)
fish_add_path /home/justin/.lmstudio/bin


# opencode
fish_add_path /home/justin/.opencode/bin
