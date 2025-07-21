if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias l="lsd"
alias lt="lsd -ltr"
alias brow="firefox --force-device-scale-factor=1.3 &>/dev/null & disown"
alias ..="cd .."
alias ubiwan="ssh f3652743@ubiwan.epsevg.upc.edu"
alias vim="nvim"
alias dev="npm run dev"
alias robotc="/home/david/custom-scripts/compile-robot.sh"
alias genJWT32='openssl rand -hex 32'
alias farma18='ssh farmaconnect@172.0.4.18'
alias farma20='ssh user@172.0.4.20'
# set default editor for ranger
set -x VISUAL nvim
set -x EDITOR nvim

set -U fish_user_paths $fish_user_paths /home/david/.local/bin

set -U fish_user_paths /usr/local/go/bin $fish_user_paths
set -U fish_user_paths /home/david/go/bin $fish_user_paths

alias fs="ranger"

# funcition to replace sudo !! of bash
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

alias google-java-format='java -jar ~/custom-scripts/google-java-format.jar'

# Git branch detection function
function __git_branch_name
    git branch --show-current 2>/dev/null
end

# Custom prompt function
function fish_prompt
    set -l last_status $status

    # Colors
    set -l normal (set_color normal)
    set -l user_color (set_color --bold brblue)
    set -l host_color (set_color --bold brgreen)
    set -l path_color (set_color --bold bryellow)
    set -l git_clean_color (set_color --bold brmagenta)
    set -l prompt_color (set_color --bold brwhite)

    # Status indicator color
    set -l status_color $normal
    if test $last_status -ne 0
        set status_color (set_color --bold red)
    end

    # User@host
    echo -n $user_color(whoami)$normal'@'$host_color(hostname)$normal' '

    # Current directory with folder icon
    echo -n $path_color'' ' '(prompt_pwd)$normal

    # Git branch with icon and colors
    set -l git_branch (__git_branch_name)
    if test -n "$git_branch"
        set -l git_color $git_clean_color

        # Color based on branch name
        switch $git_branch
            case main master
                set git_color (set_color --bold red)
            case dev develop development
                set git_color (set_color --bold blue)
            case '*'
                set git_color (set_color --bold '#4B39F2') # indigo
        end

        echo -n ''$git_color'  '$git_branch$normal
    end

    # Prompt symbol
    echo -n ' '$status_color'❯'$normal' '
end

neofetch

eval "$(zoxide init fish)"
nvm use v23.6.1
