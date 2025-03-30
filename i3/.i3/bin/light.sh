brightnessctl get | awk '{printf "%.0f%%\n", $1 / 255 * 100}'
