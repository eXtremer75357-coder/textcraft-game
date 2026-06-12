@echo off
title TextCraft
color 0a

:: =========================
:: INTRO
:: =========================
cls
echo Not Mojang :)
timeout /t 5 >nul
cls

echo =========================
echo       TEXTCRAFT
echo =========================
echo.
echo Type PLAY to start
echo.

:start
set /p cmd=

if /i "%cmd%"=="play" goto villageintro
goto start

:: =========================
:: VILLAGE INTRO
:: =========================
:villageintro
cls
echo You wake up on a dusty road...
echo.
echo A village is ahead.
echo.
echo Press W to go to village

:village
set /p move=

if /i "%move%"=="w" goto village2
goto village

:village2
cls
echo You arrived at the village!
timeout /t 2 >nul

echo A villager came to you.
echo.
echo Press T to talk

:talk
set /p cmd=

if /i "%cmd%"=="t" goto quest
goto talk

:quest
cls
echo Villager: Welcome to TextCraft!
echo.
echo There's a portal ahead.
echo Bring me a carrot from the farm.
echo.
echo Press D to go to farm

:farm
set /p cmd=

if /i "%cmd%"=="d" goto farm2
goto farm

:farm2
cls
echo You arrived at the farm...
echo.
echo Press G to get carrot

:carrot
set /p cmd=

if /i "%cmd%"=="g" goto gotcarrot
goto carrot

:gotcarrot
cls
echo You got a carrot!
set carrot=1
timeout /t 2 >nul

echo Press A to return

:back
set /p cmd=

if /i "%cmd%"=="a" goto returnvillager
goto back

:returnvillager
cls
echo Villager: Thank you!
echo I will activate the portal!
timeout /t 2 >nul
goto portalintro

:: =========================
:: NETHER DIMENSION
:: =========================
:portalintro
cls
echo The portal glows...
echo Press W to enter

:portal
set /p cmd=

if /i "%cmd%"=="w" goto nether
goto portal

:nether
cls
echo You step into a purple portal...
timeout /t 2 >nul
cls
echo Welcome to the NETHER!
echo.
echo Fire and lava surround you...
echo Press W to explore

:netherexplore
set /p cmd=

if /i "%cmd%"=="w" goto ghast
goto netherexplore

:ghast
cls
echo A Ghast appears!
echo Press K to kill

:ghastfight
set /p cmd=

if /i "%cmd%"=="k" goto ghast2
goto ghastfight

:ghast2
cls
echo You killed the Ghast!
echo + Ghast Tear
timeout /t 2 >nul
goto wither

:wither
cls
echo A Wither Skeleton blocks your path!
echo Press K to fight

:witherfight
set /p cmd=

if /i "%cmd%"=="k" goto wither2
goto witherfight

:wither2
cls
echo You defeated the Wither Skeleton!
echo + Soul Sand
timeout /t 2 >nul

echo Press S to find the End Portal

:netherend
set /p cmd=

if /i "%cmd%"=="s" goto blaze
goto netherend

:blaze
cls
echo You discover a Blaze spawner!
echo Press K to fight the Blaze

:blazefight
set /p cmd=

if /i "%cmd%"=="k" goto blaze2
goto blazefight

:blaze2
cls
echo You defeated the Blaze!
echo + Blaze Rod
timeout /t 2 >nul
echo.
echo You found the End Portal frame!
echo Press W to go to The End

:endportal
set /p cmd=

if /i "%cmd%"=="w" goto enderman
goto endportal

:enderman
cls
echo Press W to go forward...

:endwalk
set /p cmd=

if /i "%cmd%"=="w" goto endfight
goto endwalk

:endfight
cls
echo An Enderman appears!
echo Press K to kill

:endkill
set /p cmd=

if /i "%cmd%"=="k" goto craft
goto endkill

:: =========================
:: CRAFT EYE OF ENDER
:: =========================
:craft
cls
echo You got Ender Pearl + Blaze Rod
echo.
echo Press M to craft Eye of Ender

:crafting
set /p cmd=

if /i "%cmd%"=="m" goto crafted
goto crafting

:crafted
cls
echo Eye of Ender crafted!
timeout /t 2 >nul

echo Press S to go to portal

:backportal
set /p cmd=

if /i "%cmd%"=="s" goto bossintro
goto backportal

:: =========================
:: FINAL BOSS
:: =========================
:bossintro
cls
echo You step into the void portal...
timeout /t 2 >nul
cls

set playerhp=10
set bosshp=20
set potions=3

echo THE VOID DRAGON APPEARS!
echo HP: %bosshp%
pause

:battle
cls
echo =========================
echo VOID DRAGON BATTLE
echo =========================
echo Player HP: %playerhp%
echo Dragon HP: %bosshp%
echo Potions: %potions%
echo =========================
echo A = Attack
echo D = Dodge
echo H = Heal
echo.

set /p action=

if /i "%action%"=="a" goto attack
if /i "%action%"=="d" goto dodge
if /i "%action%"=="h" goto heal
goto battle

:attack
set /a bosshp-=3
echo You attack the dragon!
timeout /t 1 >nul
if %bosshp% LEQ 0 goto win
goto dragon

:dodge
set /a r=%random% %% 2
if %r%==0 (
echo Dodge success!
) else (
set /a playerhp-=2
echo Dodge failed!
)
timeout /t 1 >nul
goto dragon

:heal
if %potions% LEQ 0 (
echo No potions!
pause
goto battle
)
set /a potions-=1
set /a playerhp+=3
echo You healed!
timeout /t 1 >nul
goto dragon

:dragon
set /a dmg=%random% %% 3 + 1
set /a playerhp-=dmg
echo Dragon attacks! You take %dmg% damage!
timeout /t 2 >nul

if %playerhp% LEQ 0 goto lose
goto battle

:win
cls
echo =========================
echo YOU DEFEATED THE VOID DRAGON!
echo =========================
timeout /t 2 >nul
goto credits

:lose
cls
echo YOU WERE DEFEATED...
pause
exit

:: =========================
:: CREDITS
:: =========================
:credits
cls
echo TEXTCRAFT
timeout /t 2 >nul

cls
echo Not Mojang :)
timeout /t 2 >nul

cls
echo ChatGPT
timeout /t 2 >nul

cls
echo Gamify the Gamer
timeout /t 2 >nul

cls
echo THANK YOU FOR PLAYING!
pause
exit