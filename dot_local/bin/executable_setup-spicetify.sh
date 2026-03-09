paru -S spotify-launcher spietify-cli spicetify-marketplace-bin

sed -i "s|^\(spotify_path\s*=\s*\).*|\1$HOME/.local/share/spotify-launcher/install/usr/share/spotify/|" config-xpui.ini

# 2. Native command of spicetify but need to launch spotify first for directories to exist
# spotify
# echo "spicetify config prefs_path $HOME/.local/share/spotify-launcher/install/usr/share/spotify/"

spicetify config inject_css 1
spicetify config replace_colors 1
spicetify config current_theme marketplace
spicetify config custom_apps marketplace

spicetify config custom_apps lyrics-plus

spicetify backup apply
