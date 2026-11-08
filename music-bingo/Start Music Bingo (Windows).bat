@echo off
cd /d "%~dp0"
echo Music Bingo is running at http://localhost:8765
echo Leave this window open during the game.
start "" http://localhost:8765/index.html
python -m http.server 8765 --bind 127.0.0.1 || py -m http.server 8765 --bind 127.0.0.1
pause
