#!/bin/bash
# Credits: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md

# Create uinput group
sudo groupdel uinput 2>/dev/null
sudo groupadd --system uinput

# Add yourself to input and uinput group
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER
groups
echo "If you do not appear in the input and uinput group, log out and log back in."

# Load uinput kernel module
sudo modprobe uinput

# Udev rules
sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF
sudo udevadm control --reload-rules && sudo udevadm trigger

# Start systemd service
systemctl --user daemon-reload
systemctl --user enable kanata.service
systemctl --user start kanata.service
systemctl --user status kanata.service # check whether the service is running
