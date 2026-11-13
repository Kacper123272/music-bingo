#!/bin/bash
# Double-click to start Music Bingo. Keep this window open while you play.
cd "$(dirname "$0")"
PORT=8765
echo "Music Bingo is running at http://localhost:$PORT"
echo "Leave this window open during the game. Close it when you're done."
(sleep 1; open "http://localhost:$PORT/index.html") &
python3 -m http.server $PORT --bind 127.0.0.1
