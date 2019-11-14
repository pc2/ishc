#!/bin/bash

pbpaste -Prefer rtf | /usr/local/bin/highlight --syntax=c --out-format=rtf | pbcopy -Prefer rtf
 
osascript << 'EOF'
tell application "System Events"
    set activeApp to name of first application process whose frontmost is true
    if "Microsoft PowerPoint" is in activeApp then
        tell process "Microsoft Powerpoint"
            keystroke "v" using {command down, control down}
            key code 125
            key code 76
        end tell
    else
        keystroke "v" using command down
    end if
end tell
EOF
