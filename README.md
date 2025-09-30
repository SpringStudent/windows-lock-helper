[English](README.md) | [中文](README_zh.md)

### 拉取最新的https://github.com/SpringStudent/remote-desktop-control 代码，切换到feature_seperate_robot分支尝试

### 文件说明
* Start.bat  真正的启动脚本，需要以超管权限启动
* RobotsServer.bat 启动RobotsServer.jar的脚本
* RemoteClientService.exe 服务注册exe，负责复制winlogon的token，然后以System权限通过RobotsServer.bat启动RobotsServer.jar，以用户权限启动RemoteClient.jar
* RemoteClient.jar 远程桌面控制jar，用户权限用户界面客户端程序，以用户权限启动保证用户session下粘贴板、鼠标、键盘事件的执行，锁屏时发送指令到RobotsServer保证锁屏可用，编译client项目的产出物
* RobotsServer.jar 用于通过JNA调用C++开发DLL，用于锁屏场景抓图、模拟键盘和鼠标事件服务，需要以系统System权限启动的服务，编译robots项目的产出物
### 怎么用

替换自己编译好的RemoteClient.jar和RobotsServer.jar；然后以超管权限运行Start.bat即可启动程序！

### Q&A

* 服务启动失败

先安装VC_redist.x64.exe

* 鼠标键盘事件不可用

建议关闭360，这玩意会拦截RemoteClient.jar的Robot鼠标事件模拟，导致我排查了一夜，擦
