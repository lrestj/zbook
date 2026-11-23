#!/usr/bin/env python3
import json
import subprocess

# Get existing windows on startup so we don't move them
windows_out = subprocess.check_output(["niri", "msg", "-j", "windows"])
known_windows = {w["id"] for w in json.loads(windows_out)}

# Stream events directly from Niri
proc = subprocess.Popen(
    ["niri", "msg", "-j", "event-stream"],
    stdout=subprocess.PIPE,
    text=True,
    bufsize=1
)

for line in proc.stdout:
    event = json.loads(line)

    if "WindowOpenedOrChanged" in event:
        win = event["WindowOpenedOrChanged"]["window"]
        win_id = win["id"]

        if win_id not in known_windows:
            known_windows.add(win_id)

            # Ignore floating popups/dialogs
            if not win.get("is_floating", False):
                # Change to "move-column-to-first" if you want it at the far-left edge
                subprocess.run(["niri", "msg", "action", "move-column-left"])

#### END OF FILE ####
