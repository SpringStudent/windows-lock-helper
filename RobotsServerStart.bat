@echo off
setlocal enabledelayedexpansion

set "PORT="
set "all_args=%*"

echo ���в���: !all_args!

if not "!all_args:--robotPort=!"=="!all_args!" (
    set "temp=!all_args:*--robotPort=!"
    REM ȥ����ͷ�ĵȺ�
    set "temp=!temp:~1!"
    for /f "tokens=1 delims= " %%i in ("!temp!") do set "PORT=%%i"
    echo �������Ķ˿�: !PORT!
)

if "!PORT!"=="" (
    echo ����δ�������˿ڲ���
    pause
    exit /b 1
)

echo ���ն˿�: !PORT!
start "" javaw -jar -DrobotPort=!PORT! "%~dp0RobotsServer.jar" 
exit