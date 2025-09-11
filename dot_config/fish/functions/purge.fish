# This function removes orphaned pacman packages.
function purge
    if pacman -Qtdq &>/dev/null
        pacman -Qtdq | sudo pacman -Rsunc -
    else
        echo "No orphaned packages to purge."
    end
end
