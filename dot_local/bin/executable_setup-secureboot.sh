#!/usr/bin/env bash
# Credits: https://github.com/CachyOS/CachyOS-Settings/blob/master/usr/bin/sbctl-batch-sign
# Added tpm sign in support
set -e

if [ -f /boot/limine.conf ]; then
  echo "Limine detected, please do not use this script."
  exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
  echo "Error: This script must be run with root privileges."
  exit 1
fi

export ESP_PATH=/boot/

sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft

sbctl verify 2>/dev/null | awk '/✗/ {print $2}' | while IFS= read -r entry; do
  # We expect users who use this script to enroll their
  # own keys alongside Microsoft's.
  # With that in mind, there's no need to sign MS ESP
  # files with our own keys.
  if [[ "$entry" =~ ^.*/EFI/(Microsoft|Windows) || "$entry" == *.mui || "$entry" == *.dll ||
    "$entry" =~ ^/boot/grub ]]; then
    continue
  fi
  sbctl sign -s "$entry"
done

sbctl status

# TPM sign in
echo "TPM Sign-in"
read -p "Enter your encryped parition name (Ex. - /dev/nvme0n1p4): " partition
systemd-cryptenroll $partition --recovery-key
systemd-cryptenroll $partition --wipe-slot=empty --tpm2-device=auto --tpm2-pcrs=7+15:sha256=0000000000000000000000000000000000000000000000000000000000000000
