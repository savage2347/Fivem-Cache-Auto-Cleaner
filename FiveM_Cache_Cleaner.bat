
@echo off
title FiveM Cache Cleaner

echo ===============================
echo     FiveM Cache Cleaner
echo ===============================
echo.

setlocal enabledelayedexpansion

REM Default FiveM locations
set paths[0]=%LocalAppData%\FiveM\FiveM.app
set paths[1]=%ProgramFiles%\FiveM\FiveM.app
set paths[2]=%ProgramFiles(x86)%\FiveM\FiveM.app

set fivemPath=

for /L %%i in (0,1,2) do (
    for %%p in ("!paths[%%i]!") do (
        if exist %%p (
            set fivemPath=%%p
            goto :found
        )
    )
)

echo Impossible de trouver FiveM automatiquement.
pause
exit

:found
echo FiveM detecte : %fivemPath%
echo.

set deleteList[0]=crashes
set deleteList[1]=logs
set deleteList[2]=data\server-cache-priv
set deleteList[3]=data\server-cache
set deleteList[4]=data\cache

for /L %%i in (0,1,4) do (
    set folder=%fivemPath%\!deleteList[%%i]!
    if exist "!folder!" (
        echo Suppression : !folder!
        rmdir /s /q "!folder!"
    ) else (
        echo Introuvable : !folder!
    )
)

echo.
echo ===============================
echo       Nettoyage termine !
echo ===============================
pause
