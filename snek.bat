:truestart
@echo off
Title Wiggle Snek
:titlepage
cls
color 07
echo [Wiggle Snek] v1.3
timeout /t 1 /nobreak >nul
echo.
echo :Start Game: [W]
echo.
echo :Instructions: [I]
choice /n /c wi
if %errorlevel%==1 goto startgame
if %errorlevel%==2 goto instructions

:instructions
cls
echo [Press any key to advance faster through instructions]
timeout /t 3 >nul
cls
echo Goals:
echo Collect food to beat the level. Levels become harder as you progress.
echo Avoid running into obstacles, as this will end the game.
timeout /t 5 >nul
echo.
echo Controls:
echo Move forward: [W]
echo Move left: [A]
echo Move right: [S]
echo Pause: [P]
timeout /t 4 >nul
echo.
echo Tiles:
echo O = Snake
echo * = Food
echo # = Obstacle
timeout /t 4 >nul
echo.
echo You will move forward every turn. This makes left and right become more like diagonals.
rem (Wiggle wiggle)
timeout /t 3 >nul
echo Use this to your advantage by slipping past the corners of obstacles.
rem (Snek the untouchable)
timeout /t 3 >nul
echo Waiting more than 1 second to move will just move you forward.
rem (This isn't slow snek here)
timeout /t 3 >nul
echo You can only see eight tiles ahead of you, so plan ahead.
rem (Snek has bad eyesight ;c)
timeout /t 3 >nul
echo There are five levels. To beat one, you need to obtain 35 score.
rem (Snek GROOOW)
timeout /t 3 >nul
echo You can check your score in the pause menu at any time. (Only time can stop snek!)
timeout /t 2 /nobreak >nul
echo.
echo [Press any key to return to the main menu]
pause >nul
cls
goto titlepage



:startgame
cls
set pposx=13
set length=0
set level=1
set rainbow=0

:clearvariables

set fx1=-1
set fx2=-1
set fx3=-1
set fx4=-1
set fx5=-1
set fx6=-1
set fx7=-1
set fx8=-1
set fx9=-1

set tx1=-1
set tx2=-1
set tx3=-1
set tx4=-1
set tx5=-1
set tx6=-1
set tx7=-1
set tx8=-1
set tx9=-1

set iy1= 
set iy2= 
set iy3= 
set iy4= 
set iy5= 
set iy6= 
set iy7= 
set iy8= 

set y2= 
set y3= 
set y4= 
set y5= 
set y6= 
set y7= 
set y8= 
set y9= 
set y10= 
set y11= 
set y12= 
set y13= 
set y14= 
set y15= 
set y16= 
set y17= 
set y18= 
set y19= 
set y20= 
set y21= 
set y22= 
set y23= 
set y24= 
set y25= 
set y26= 
set y27= 
set y28= 
set y29= 
set y30= 
set y31= 
set y32= 
set y33= 
set y34= 
set y35= 

:displayscript
set x1= 
set x2= 
set x3= 
set x4= 
set x5= 
set x6= 
set x7= 
set x8= 
set x9= 
set x10= 
set x11= 
set x12= 
set x13= 
set x14= 
set x15= 
set x16= 
set x17= 
set x18= 
set x19= 
set x20= 
set x21= 
set x22= 
set x23= 
set x24= 
set x25=

set ix1= 
set ix2= 
set ix3= 
set ix4= 
set ix5= 
set ix6= 
set ix7= 
set ix8= 
set ix9= 
set ix10= 
set ix11= 
set ix12= 
set ix13= 
set ix14= 
set ix15= 
set ix16= 
set ix17= 
set ix18= 
set ix19= 
set ix20= 
set ix21= 
set ix22= 
set ix23= 
set ix24= 
set ix25= 

rem snake display row and item display 1st row storage cleared

if %level% LEQ 5 goto level%level%
if %level%==6 goto levelbonus

:level1
color a
rem spawn food 100%
SET /a spawnloc=%random% * 25 / 32768 + 1
set ix%spawnloc%=*
set fx1=%spawnloc%
rem spawn trap 20%
set /a genchance=%random% %% 10
if %genchance% GTR 8 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=#
	if %spawnloc%==fx1 set fx1=0
	set tx1=%spawnloc%
) else (
	set tx1=0
)

goto esclevelgen

:level2
color b
rem spawn food 80%
set /a genchance=%random% %% 10
if %genchance% GTR 2 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=*
	set fx1=%spawnloc%
) else (
	set fx1=0
)
rem spawn trap 40%
set /a genchance=%random% %% 10
if %genchance% GTR 6 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=#
	if %spawnloc%==fx1 set fx1=0
	set tx1=%spawnloc%
) else (
	set tx1=0
)


goto esclevelgen

:level3
color e
rem spawn food 60%
set /a genchance=%random% %% 10
if %genchance% GTR 4 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=*
	set fx1=%spawnloc%
) else (
	set fx1=0
)
rem spawn trap 60%
set /a genchance=%random% %% 10
if %genchance% GTR 4 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=#
	if %spawnloc%==fx1 set fx1=0
	set tx1=%spawnloc%
) else (
	set tx1=0
)

goto esclevelgen

:level4
color c
rem spawn food 40%
set /a genchance=%random% %% 10
if %genchance% GTR 6 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=*
	set fx1=%spawnloc%
) else (
	set fx1=0
)
rem spawn trap 80%
set /a genchance=%random% %% 10
if %genchance% GTR 2 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=#
	if %spawnloc%==fx1 set fx1=0
	set tx1=%spawnloc%
) else (
	set tx1=0
)


goto esclevelgen

:level5
color d
rem spawn food 20%
set /a genchance=%random% %% 10
if %genchance% GTR 8 (
    SET /a spawnloc=%random% * 25 / 32768 + 1
	set ix%spawnloc%=*
	set fx1=%spawnloc%
) else (
	set fx1=0
)
rem spawn trap 100%
SET /a spawnloc=%random% * 25 / 32768 + 1
set ix%spawnloc%=#
if %spawnloc%==fx1 set fx1=0
set tx1=%spawnloc%


goto esclevelgen

:levelbonus
rem spawn food 100%
SET /a spawnloc=%random% * 25 / 32768 + 1
set ix%spawnloc%=*
set fx1=%spawnloc%
rem spawn trap 0%

goto esclevelgen

:esclevelgen
if %length% GEQ 34 set y35=%y34%
if %length% GEQ 33 set y34=%y33%
if %length% GEQ 32 set y33=%y32%
if %length% GEQ 31 set y32=%y31%
if %length% GEQ 30 set y31=%y30%
if %length% GEQ 29 set y30=%y29%
if %length% GEQ 28 set y29=%y28%
if %length% GEQ 27 set y28=%y27%
if %length% GEQ 26 set y27=%y26%
if %length% GEQ 25 set y26=%y25%
if %length% GEQ 24 set y25=%y24%
if %length% GEQ 23 set y24=%y23%
if %length% GEQ 22 set y23=%y22%
if %length% GEQ 21 set y22=%y21%
if %length% GEQ 20 set y21=%y20%
if %length% GEQ 19 set y20=%y19%
if %length% GEQ 18 set y19=%y18%
if %length% GEQ 17 set y18=%y17%
if %length% GEQ 16 set y17=%y16%
if %length% GEQ 15 set y16=%y15%
if %length% GEQ 14 set y15=%y14%
if %length% GEQ 13 set y14=%y13%
if %length% GEQ 12 set y13=%y12%
if %length% GEQ 11 set y12=%y11%
if %length% GEQ 10 set y11=%y10%
if %length% GEQ 9 set y10=%y9%
if %length% GEQ 8 set y9=%y8%
if %length% GEQ 7 set y8=%y7%
if %length% GEQ 6 set y7=%y6%
if %length% GEQ 5 set y6=%y5%
if %length% GEQ 4 set y5=%y4%
if %length% GEQ 3 set y4=%y3%
if %length% GEQ 2 set y3=%y2%
if %length% GEQ 2 set y3=%y2%
if %length% GEQ 1 set y2=%y1%

set iy9=%iy8%
set iy8=%iy7%
set iy7=%iy6%
set iy6=%iy5%
set iy5=%iy4%
set iy4=%iy3%
set iy3=%iy2%
set iy2=%iy1%

rem item and snake render bumped
set x%fx9%=*
set x%tx9%=#

set fx9=%fx8%
set fx8=%fx7%
set fx7=%fx6%
set fx6=%fx5%
set fx5=%fx4%
set fx4=%fx3%
set fx3=%fx2%
set fx2=%fx1%

set tx9=%tx8%
set tx8=%tx7%
set tx7=%tx6%
set tx6=%tx5%
set tx5=%tx4%
set tx4=%tx3%
set tx3=%tx2%
set tx2=%tx1%

rem hitboxing bumped

set x%pposx%=O

rem snake head and missed items rendered

set fhx=%fx9%
set thx=%tx9%
set fx9=0
set tx9=0


set iy1=%ix1%%ix2%%ix3%%ix4%%ix5%%ix6%%ix7%%ix8%%ix9%%ix10%%ix11%%ix12%%ix13%%ix14%%ix15%%ix16%%ix17%%ix18%%ix19%%ix20%%ix21%%ix22%%ix23%%ix24%%ix25%
set y1=%x1%%x2%%x3%%x4%%x5%%x6%%x7%%x8%%x9%%x10%%x11%%x12%%x13%%x14%%x15%%x16%%x17%%x18%%x19%%x20%%x21%%x22%%x23%%x24%%x25%

rem new row 1 of item and snake rendered

echo. %iy1%>game.txt
echo. %iy2%>>game.txt
echo. %iy3%>>game.txt
echo. %iy4%>>game.txt
echo. %iy5%>>game.txt
echo. %iy6%>>game.txt
echo. %iy7%>>game.txt
echo. %iy8%>>game.txt

echo. %y1%>>game.txt
echo. %y2%>>game.txt
echo. %y3%>>game.txt
echo. %y4%>>game.txt
echo. %y5%>>game.txt
echo. %y6%>>game.txt
echo. %y7%>>game.txt
echo. %y8%>>game.txt
echo. %y9%>>game.txt
echo. %y10%>>game.txt
echo. %y11%>>game.txt
echo. %y12%>>game.txt
echo. %y13%>>game.txt
echo. %y14%>>game.txt
echo. %y15%>>game.txt
echo. %y16%>>game.txt
echo. %y17%>>game.txt
echo. %y18%>>game.txt
echo. %y19%>>game.txt
echo. %y20%>>game.txt
echo. %y21%>>game.txt
echo. %y22%>>game.txt
echo. %y23%>>game.txt
echo. %y24%>>game.txt
echo. %y25%>>game.txt
echo. %y26%>>game.txt
echo. %y27%>>game.txt
echo. %y28%>>game.txt
echo. %y29%>>game.txt
echo. %y30%>>game.txt
echo. %y31%>>game.txt
echo. %y32%>>game.txt
echo. %y33%>>game.txt
echo. %y34%>>game.txt
echo. %y35%>>game.txt

rem item and snake renders printed
:unpause
type game.txt

choice /n /t 1 /d w /c wadp>nul
if %errorlevel%==1 goto cls
if %errorlevel%==2 set /a pposx=%pposx%-1
if %errorlevel%==3 set /a pposx=%pposx%+1
if %errorlevel%==4 goto pausemenu

if %pposx% LSS 1 set pposx=1
if %pposx% GTR 25 set pposx=25
rem player moves
:cls
if %pposx%==%fhx% set /a length=%length%+1
if %pposx%==%thx% goto gameover

rem hitboxing checked and resulted

if %length% GEQ 35 goto levelup
if %level%==6 goto rainbow
:escrainbow
cls
goto displayscript

rem borders are checked and levelup is checked

:pausemenu
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo     -=Game Paused=-
echo     [P] Unpause
echo     [R] Restart
echo     [E] Exit to Menu
if %length% GTR 9 echo        [Score: %length%]
if %length% LEQ 9 echo        [Score: 0%length%]
choice /n /c prel
if %errorlevel%==1 goto unpause
if %errorlevel%==2 goto startgame
if %errorlevel%==3 goto titlepage
if %errorlevel%==4 set /a length=%length%+1
goto pausemenu

:rainbow
set /a rainbow=%random% %% 14
if %rainbow% LEQ 9 (
	color %rainbow%
) else (
	if %rainbow%==10 color a
	if %rainbow%==11 color b
	if %rainbow%==12 color c
	if %rainbow%==13 color d
	if %rainbow%==14 color e
	if %rainbow%==15 color f
)
goto escrainbow


:levelup
set /a level=%level%+1
if %level% GTR 6 set level=6
set /a length=%length%-35
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo        [Level Up!]
timeout /t 1 /nobreak >nul
if %level% LEQ 5 echo        [Level: 0%level%]
if %level%==6 echo      [Level: BONUS!]
timeout /t 2 /nobreak >nul
goto clearvariables


:gameover
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo       -=Game Over=-
if %length% GTR 9 echo        [Score: %length%]
if %length% LEQ 9 echo        [Score: 0%length%]
echo        [Level: 0%Level%]
echo     [R] Restart
echo     [E] Exit to Menu
choice /n /c rel
if %errorlevel%==1 goto startgame
if %errorlevel%==2 goto titlepage
if %errorlevel%==3 cls
goto unpause

:end
pause
