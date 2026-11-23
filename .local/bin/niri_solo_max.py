#!/usr/bin/env python3
import json
import subprocess

# Set your default width when 2+ windows are open (e.g., "50%")
DEFAULT_WIDTH = "50%"

def niri_action(*args):
    subprocess.run(["niri", "msg", "action", *args], check=False)

def main():
    # Track tiled windows: {window_id: workspace_id}
    windows = {}
    # Track which workspaces are currently in solo-maximized state
    solo_workspaces = set()

    proc = subprocess.Popen(
        ["niri", "msg", "--json", "event-stream"],
        stdout=subprocess.PIPE,
        text=True,
        bufsize=1,
    )

    for line in proc.stdout:
        event = json.loads(line)
        changed = False

        if "WindowsChanged" in event:
            windows = {
                w["id"]: w["workspace_id"]
                for w in event["WindowsChanged"]["windows"]
                if not w.get("is_floating") and w.get("workspace_id") is not None
            }
            changed = True

        elif "WindowOpenedOrChanged" in event:
            w = event["WindowOpenedOrChanged"]["window"]
            if w.get("is_floating") or w.get("workspace_id") is None:
                windows.pop(w["id"], None)
            else:
                windows[w["id"]] = w["workspace_id"]
            changed = True

        elif "WindowClosed" in event:
            windows.pop(event["WindowClosed"]["id"], None)
            changed = True

        if not changed:
            continue

        # Count tiled windows per workspace
        counts = {}
        for ws_id in windows.values():
            counts[ws_id] = counts.get(ws_id, 0) + 1

        # Evaluate each workspace
        all_ws = set(counts.keys()) | solo_workspaces
        for ws_id in all_ws:
            count = counts.get(ws_id, 0)

            if count == 1 and ws_id not in solo_workspaces:
                solo_ws_win = next(wid for wid, wsid in windows.items() if wsid == ws_id)
                niri_action("set-window-width", "--id", str(solo_ws_win), "100%")
                solo_workspaces.add(ws_id)

            elif count != 1 and ws_id in solo_workspaces:
                for wid, wsid in windows.items():
                    if wsid == ws_id:
                        niri_action("set-window-width", "--id", str(wid), DEFAULT_WIDTH)
                solo_workspaces.remove(ws_id)

if __name__ == "__main__":
    main()

#### END OF FILE ####
