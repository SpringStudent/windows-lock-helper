@echo off

REM 检查是否传入了参数
if "%*"=="" (
  echo 请输入参数，例如: registerService.bat --ppp=123 --abc=456
)

set args=%*

sc stop RemoteClientService

sc delete RemoteClientService

echo sc create RemoteClientService binPath= "\"%~dp0RemoteClientService.exe\" --exepath=\"%~dp0RemoteClientStartJar.bat\" %args%" start= auto

sc create RemoteClientService binPath= "\"%~dp0RemoteClientService.exe\" --exepath=\"%~dp0RemoteClientStartJar.bat\" %args%" start= auto

sc start RemoteClientService