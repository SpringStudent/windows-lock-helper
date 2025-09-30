@echo off
setlocal enabledelayedexpansion

set "PORT="
set "all_args=%*"

echo 所有参数: !all_args!

if not "!all_args:--robotPort=!"=="!all_args!" (
    set "temp=!all_args:*--robotPort=!"
    REM 去掉开头的等号
    set "temp=!temp:~1!"
    for /f "tokens=1 delims= " %%i in ("!temp!") do set "PORT=%%i"
    echo 解析到的端口: !PORT!
)

if "!PORT!"=="" (
    echo 错误：未解析到端口参数
    pause
    exit /b 1
)

echo 最终端口: !PORT!
start "" javaw -jar -DrobotPort=!PORT! "%~dp0RobotsServer.jar" 
exit