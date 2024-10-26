if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias l="lsd"
alias lt="lsd -ltr"
alias brow="brave --force-device-scale-factor=1 &>/dev/null & disown"
alias ..="cd .."
alias ubiwan="ssh f3652743@ubiwan.epsevg.upc.edu"
alias vim="nvim"
alias dev="npm run dev"
alias robotc="/home/david/custom-scripts/compile-robot.sh"
# set default editor for ranger
set -x VISUAL nvim
set -x EDITOR nvim

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
