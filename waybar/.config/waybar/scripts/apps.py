#!/usr/bin/env python3
import json

apps = [
    {"icon": "", "tooltip": "Terminal", "command": "alacritty"},
    {"icon": "", "tooltip": "Firefox", "command": "firefox"},
    {"icon": "", "tooltip": "Files", "command": "nautilus"},
    {"icon": "", "tooltip": "Spotify", "command": "spotify"},
    {"icon": "", "tooltip": "Discord", "command": "discord"},
    {"icon": "", "tooltip": "Stremio", "command": "stremio"},
    {"icon": "󱑼", "tooltip": "CPU Freq", "command": "auto-cpufreq-gtk"},
]

result = [
    {
        "text": app["icon"],
        "tooltip": app["tooltip"],
        "on-click": app["command"],
        "class": "apps",
    }
    for app in apps
]

print(json.dumps(result, ensure_ascii=False))
