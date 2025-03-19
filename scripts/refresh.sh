#!/bin/bash
set -e

echo "Refreshing icon cache..."
rm -f ~/Library/Caches/com.apple.dock.iconcache || true
rm -rf ~/Library/Caches/com.apple.iconservices* || true
killall Dock
