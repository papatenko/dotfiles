@REM Only for Windows also why is rem on here

PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell %USERPROFILE%\OneDrive\scripts\downloadAutoWin.ps1 >> "%TEMP%\StartupLog.txt" 2>&1