### 项目结构说明
* RemoteClientStartUp.bat  真正的启动脚本，需要以超管权限启动
* RemoteClientStartJart.bat   启动jar的命令，请注意调整jar的路径！！！
* RemoteClientService.exe 服务注册exe，负责复制winlogon的token，然后通过runjar.bat启动jar进程
* RemoteClient.jar 远程桌面控制jar（拉取最新的https://github.com/SpringStudent/remote-desktop-control 代码，并编译client项目的产出物）
