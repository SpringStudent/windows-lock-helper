@echo off

REM ����Ƿ����˲���
if "%*"=="" (
  echo ���������������: registerService.bat --ppp=123 --abc=456
)

set args=%*

REM ��ȡ���ö˿�
for /f "delims=" %%p in ('powershell -Command "$port=49152; while($port -le 65535) { $t = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Any, $port); try { $t.Start(); $t.Stop(); Write-Host $port; break; } catch { $port++; } }"') do (
    set "available_port=%%p"
)

echo find avaliable_port: %available_port%

sc stop RemoteClientService

sc delete RemoteClientService

echo ��������: sc create RemoteClientService binPath= "\"%~dp0RemoteClientService.exe\" --exepath=\"%~dp0RobotsServerStart.bat\" --robotPort=%available_port% %args%" start= auto

sc create RemoteClientService binPath= "\"%~dp0RemoteClientService.exe\" --exepath=\"%~dp0RobotsServerStart.bat\" --robotPort=%available_port% %args%" start= auto

sc start RemoteClientService

start "" java -jar -DrobotPort=%available_port% "%~dp0RemoteClient.jar"