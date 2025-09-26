### 项目结构说明
* startup.bat  真正的启动脚本，需要以超管权限启动
* runjar.bat   启动jar的命令，注意调整jar的路径
* register.exe 服务注册exe，负责复制winlogon的token，然后调用通过runjar.bat启动jar进程
* RemoteClient.jar 远程桌面控制jar（拉取最新的https://github.com/SpringStudent/remote-desktop-control代码的client项目产出物）
