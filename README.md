### File Description
* RemoteClientStartUp.bat - The actual startup script, requires Administrator privileges to run
* RemoteClientStartJar.bat - Batch script that starts the JAR file
* RemoteClientService.exe - Service registration executable, responsible for duplicating winlogon token and starting RemoteClient.jar through RemoteClientStartJar.bat
* RemoteClient.jar - Remote desktop control JAR, compiled from the latest client project code at: https://github.com/SpringStudent/remote-desktop-control

### How to Use
Replace with your own compiled RemoteClient.jar,Run RemoteClientStartUp.bat with Administrator privileges to start the program

### Q&A
* Service fails to start
First install VC_redist.x64.exe

* Clipboard not working
Due to session isolation issues with service startup, the clipboard may not function properly. The clipboard feature will be refactored in the future to run as a separate user process.