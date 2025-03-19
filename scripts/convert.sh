#!/bin/bash
set -e

# Get the root directory of the project
ROOT=$(git rev-parse --show-toplevel)
STYLE=$1

if [ "$STYLE" != "fancy" ] && [ "$STYLE" != "thick" ]; then
    echo "Error: Style must be either 'fancy' or 'thick'"
    exit 1
fi

# Create wezterm-$STYLE.png from wezterm.png if needed
# This is a placeholder as your original Makefile didn't specify how to create these
# You may need to implement this depending on your actual requirements

# Convert PNG to ICNS
echo "Converting wezterm-$STYLE.png to wezterm-$STYLE.icns"
npx png2icons "${ROOT}/icons/wezterm-${STYLE}.png" "${ROOT}/icons/wezterm-${STYLE}" -icns
