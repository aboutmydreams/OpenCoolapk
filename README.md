# Open Coolapk

使用Flutter实现酷安app
=,=
# 注意! 本项目主要对desktop(或宽屏设备)进行支持，ui方面不适合竖屏使用~

    下载源码:
    git clone git@github.com:roykio/OpenCoolapk.git

## 在pc平台运行:
    首先你要查看这两个项目
        https://github.com/go-flutter-desktop/go-flutter
        https://github.com/go-flutter-desktop/hover

    你的电脑上要有配置好的golang环境
    然后在控制台安装
        go get -u github.com/go-flutter-desktop/hover

    然后重启控制台，输入hover
    如果有输出则安装成功
    启动本项目:
    到本项目目录下:
        hover run
    
    hover还不支持release打包，性能会有限

## android编译:
    flutter build apk --release

## android debug:
    连接手机
    允许usb调试
    到本目录:
        flutter run

## 没有ios设备，也没有mac
    故没有ios版编译教程

## 预览
    
![image](https://github.com/roykio/OpenCoolapk/tree/master/_pre/pre1.png)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
