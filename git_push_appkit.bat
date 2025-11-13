@echo off
setlocal

REM === Einstellungen ===
set "PROJECT_DIR=C:\Users\PC\Documents\01_Ideen\Appentwicklung\appkit"
set "COMMIT_MSG=auto: %date% %time%"

cd /d "%PROJECT_DIR%" || (
  echo [FEHLER] Projektordner nicht gefunden.
  pause
  exit /b 1
)

echo.
echo === Git Auto-Push fuer ShortcutMap ===
echo [ADD] alle geaenderten Dateien...
git add -A

echo [COMMIT] %COMMIT_MSG%
git commit -m "%COMMIT_MSG%"

echo [PUSH] auf main branch...
git push origin main

echo.
echo [FERTIG] Repository aktualisiert!
pause
