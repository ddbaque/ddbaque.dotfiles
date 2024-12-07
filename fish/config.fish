if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias l="lsd"
alias lt="lsd -ltr"
alias brow="brave-browser --force-device-scale-factor=1.3 &>/dev/null & disown"
alias ..="cd .."
alias ubiwan="ssh f3652743@ubiwan.epsevg.upc.edu"
alias vim="nvim"
alias dev="npm run dev"
alias robotc="/home/david/custom-scripts/compile-robot.sh"
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

neofetch

eval "$(zoxide init fish)"
