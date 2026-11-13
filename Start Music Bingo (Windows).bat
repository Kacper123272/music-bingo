@echo off
cd /d "%~dp0"
set PORT=8765
set PY=

rem Find Python (py launcher first, then python - skipping the Microsoft Store stub)
py --version >nul 2>nul && set PY=py
if not defined PY python --version >nul 2>nul && set PY=python

if not defined PY (
  echo.
  echo  Python is not installed, so Music Bingo can't start.
  echo  1. Install it from https://www.python.org/downloads/
  echo     ^(tick "Add python.exe to PATH" on the first screen^)
  echo  2. Then double-click this file again.
  echo.
  pause
  exit /b 1
)

echo Music Bingo is running at http://localhost:%PORT%
echo Leave this window open during the game. Close it when you're done.

rem Open the browser 2 seconds from now, once the server is up
start "" /b powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 2; Start-Process 'http://localhost:%PORT%/index.html'"

%PY% -m http.server %PORT% --bind 127.0.0.1

echo.
echo The server stopped. If there's an error above, send it over.
pause
