function n
    set directory "/home/eeay/vaults"
    set folder (fd -a -t d --search-path "$directory" | sed "s|$directory/||" | fzf)
    if test -n "$folder"
        cd "$directory/$folder"
    end
end
