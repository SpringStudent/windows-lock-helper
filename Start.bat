@echo off

REM ����Ƿ����˲���
if "%*"=="" (
  echo ���������������: registerService.bat --ppp=123 --abc=456
)

echo ���ڳ��Թر����е� RobotsServer.jar ����...

for /f "tokens=2 delims=," %%a in ('tasklist /FI "IMAGENAME eq javaw.exe" /FO CSV /NH') do (
    for /f "tokens=*" %%b in ('wmic process where "ProcessId=%%~a" get CommandLine /value 2^>nul ^| findstr /i "RobotsServer.jar"') do (
        echo �ҵ��ɽ��� PID=%%~a�����ڽ���...
        taskkill /PID %%~a /F >nul 2>nul
    )
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

sc stop RemoteClientExe

sc delete RemoteClientExe

echo ��������: sc create RemoteClientExe binPath= "\"%~dp0RemoteClient.exe\"

sc create RemoteClientExe binPath= "\"%~dp0RemoteClient.exe\" --javaPath=\"javaw.exe\" --jarPath=\"%~dp0RemoteClient.jar\" --configFile=\"%~dp0Config.properties\" --robotPort=%available_port% %args%"  start= auto

sc start RemoteClientExe

