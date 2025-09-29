[English](README.md) | [中文](README_zh.md)

### 文件说明
* RemoteClientStartUp.bat  真正的启动脚本，需要以超管权限启动
* RemoteClientStartJar.bat 启动jar的bat脚本
* RemoteClientService.exe 服务注册exe，负责复制winlogon的token，然后通过RemoteClientStartJar.bat启动RemoteClient.jar
* RemoteClient.jar 远程桌面控制jar，拉取最新的https://github.com/SpringStudent/remote-desktop-control 代码，并编译client项目的产出物
### 怎么用

替换自己编译好的RemoteClient.jar；然后以超管权限运行RemoteClientStartUp.bat即可启动程序！

### Q&A

* 服务启动失败

先安装VC_redist.x64.exe

* 粘贴板不可用

由于服务启动的session隔离问题会导致粘贴板不可用，后续要重构粘贴板，将粘贴板抽取出来单独作为一个用户进程启动