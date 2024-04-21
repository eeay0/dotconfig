if status is-interactive

    set fish_greeting

    zoxide init fish | source

    set -x EDITOR nvim
    set -x PATH $PATH $HOME/.bin

    alias ls="eza --sort type"
    alias eza="eza --sort type"
    alias l="eza -lahg --icons=always --smart-group"
    alias lt="eza --tree --icons"
    alias update="paru -Syyu"
    alias install="paru -S"
    alias remove="paru -R"
    alias remover="paru -Rns"
    alias search="paru -Ss"
    alias mirror="sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist --verbose"
    alias fm="ranger"
    alias v="nvim"
    alias run="./run.sh"
    alias mkdir="mkdir -p"
    alias ff="fastfetch"
    alias gc="git clone"
    alias web="firefox-developer-edition"
    alias rm="rm -r"

    alias run="./run.sh"


end
