# Check systemd failed services
systemctl --failed

# Log files check
sudo journalctl -p 3 -xb

# Yay Update
paru

# Remove Orphan packages
purge

# Clean the Cache
rm -rf .cache/*

# Clean the journal
sudo journalctl --vacuum-time=2weeks

# Explicitly installed packages
paru -Qe

# List installed packages not in configured repos
paru -Qm

# List dependencies of a package with no dependents
paru -Qdt
