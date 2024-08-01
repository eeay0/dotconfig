if status is-interactive

    function fish_greeting
        printf "Ctrl+Alt+F (F for file)\nCtrl+Alt+L (L for Log)\nCtrl+Alt+S (S for status)\nCtrl+R (R for reverse-i-search)\nCtrl+Alt+P (P for process)\nCtrl+V (V for variable)\n"
    end

    function sssh
        killall ssh-agent
        eval (ssh-agent -c)
        ssh-add ~/.ssh/git_remote
    end


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
    alias mirror="sudo reflector --latest 50 --sort rate --save /etc/pacman.d/mirrorlist --verbose -c TR,DE,FR,NL,SE,IT,PL,RU,CZ,GR"
    alias fm="ranger"
    alias v="nvim"
    alias run="./run.sh"
    alias mkdir="mkdir -p"
    alias ff="fastfetch"
    alias gc="git clone"
    alias rm="rm -r"
    alias mkdir="mkdir -p "
    alias zb="zig build "


end
