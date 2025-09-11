# su - use fish when root
function su
    command su --shell=/usr/bin/fish $argv
end
