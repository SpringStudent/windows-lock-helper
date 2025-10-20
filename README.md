[English](README.md) | [中文](README_zh.md)

### This project is designed to solve the inability to capture screens and simulate mouse/keyboard events on the Windows lock screen!

### Project file
* Start.bat The actual startup script, which needs to be run with Administrator privileges.
* RobotsServer.bat The script to launch RobotsServer.jar
* RemoteClientService.exe A service registration executable responsible for duplicating the winlogon token and then launching RobotsServer.jar via RobotsServer.bat with System privileges, ensuring proper execution of lock screen capture and mouse/keyboard events.
* RemoteClient.jar The remote desktop control JAR, a client program running with user privileges and a user interface. It starts with user privileges to ensure the execution of clipboard, mouse, and keyboard events within the user session. It sends commands to RobotsServer during lock screen to maintain functionality. This is the build output from the client project.
* RobotsServer.jar Used to call a C++ developed DLL via JNA for capturing the Windows lock screen and simulating keyboard/mouse events. This service needs to be started with System privileges. This is the build output from the robots project.
* RemoteClient.exe A program written in C++ that launches RemoteClient.jar interactively with Administrator privileges, ensuring Robot and clipboard functionality.
* Config.properties Configuration file for the client connection port and address.
### How to Use

Modify the server address information in the Config.properties configuration file according to your deployment. Then, run Start.bat with Administrator privileges to start the program!

### Q&A

* Service fails to start?

 install VC_redist.x64.exe.

