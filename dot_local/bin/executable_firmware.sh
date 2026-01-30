#!/usr/bin/env bash
#set -x

# Help text for each firmware package
declare -A FW_HELP=(
  [linux-firmware-radeon]="Firmware for ATI Radeon GPUs"
  [linux-firmware-amdgpu]="Firmware for AMD Radeon GPUs"
  [linux-firmware-intel]="Firmware for Intel graphics, WiFi, Bluetooth"
  [linux-firmware-nvidia]="Firmware for NVIDIA GPUs"
  [linux-firmware-broadcom]="Firmware for Broadcom and Cypress network adapters"
  [linux-firmware-atheros]="Firmware for Atheros WiFi and Bluetooth asapters"
  [linux-firmware-realtek]="Firmware for Realtek devices (WiFi, Bluetooth, Audio and so on)"
  [linux-firmware-mediatek]="Firmware for MediaTek and Ralink devices (WiFi, Bluetooth, Audio and so on)"
  [linux-firmware-cirrus]="Firmware for Cirrus Logic audio devices"
  [linux-firmware-whence]="Metadata and shared firmware support (always required)"
  [linux-firmware-other]="Unsorted firmware for various devices"
)

# Commonly useful firmware packages even if not explicitly matched
RECOMMENDED_FW=(
  linux-firmware-realtek
  linux-firmware-broadcom
  linux-firmware-atheros
  linux-firmware-mediatek
  linux-firmware-other
)

# Define search keywords and associated firmware packages
declare -A KEYWORD_TO_FW=(
  [amd]="linux-firmware-amdgpu"
  [radeon]="linux-firmware-radeon"
  [ati]="linux-firmware-radeon"
  [intel]="linux-firmware-intel"
  [nvidia]="linux-firmware-nvidia"
  [broadcom]="linux-firmware-broadcom"
  [atheros]="linux-firmware-atheros"
  [realtek]="linux-firmware-realtek"
  [mediatek]="linux-firmware-mediatek"
  [intel]="linux-firmware-intel"
  [cirrus]="linux-firmware-cirrus"
)

# Collect hardware info (lowercase)
HARDWARE=$( (lspci; lsusb) | tr '[:upper:]' '[:lower:]' )

# Track matches
declare -A NEEDED_FW
declare -A MATCHES

# Match keywords against hardware output
for keyword in "${!KEYWORD_TO_FW[@]}"; do
  if echo "$HARDWARE" | grep -q "\W$keyword\W"; then
    fw="${KEYWORD_TO_FW[$keyword]}"
    NEEDED_FW["$fw"]=1
    MATCHES["$fw"]+="$keyword "
  fi
done

# Always needed
NEEDED_FW["linux-firmware-whence"]=1

# Show installed firmware packages
INSTALLED_FW=$(pacman -Q | grep '^linux-firmware-' | awk '{print $1}')

echo
echo "📦 Installed linux-firmware packages:"
echo "$INSTALLED_FW"
echo

echo "✅ Suggested firmware packages to keep:"
for fw in "${!NEEDED_FW[@]}"; do
  printf "  %-25s  %s\n" "$fw" "${FW_HELP[$fw]}"
done

echo
echo "💡 Recommended firmware packages to keep:"
for fw in "${RECOMMENDED_FW[@]}"; do
  if [[ -z "${NEEDED_FW[$fw]}" && "$INSTALLED_FW" =~ $fw ]]; then
    printf "  %-25s  %s\n" "$fw" "${FW_HELP[$fw]}"
  fi
done

echo
echo "❌ Possibly unused firmware packages:"
for fw in $INSTALLED_FW; do
  if [[ -z "${NEEDED_FW[$fw]}" ]]; then
    # Skip if it's in the recommended list
    skip=0
    for rec in "${RECOMMENDED_FW[@]}"; do
      [[ "$fw" == "$rec" ]] && skip=1 && break
    done
    [[ $skip -eq 1 ]] && continue

    printf "  %-25s  %s\n" "$fw" "${FW_HELP[$fw]}"
  fi
done

echo
