# 0.30.0 基本构建环境
* JDK 1.8
* Android SDK Platform 28
* NDK r18
* CMake 3.6+
* weex-playground@58981c2

# 构建
修改 `weex-playground/android/playground/build.gradle` 文件, `packagingOptions` 下配置增加 `doNotStrip '**.so'  // ADD THIS! #1`

# 调试

```bash
# AS高版本需要设置 debug so 搜索路径，不然找不到调试信息
# see https://stackoverflow.com/a/38426653
settings set target.exec-search-paths /Users/yaoxiao/Desktop/Coding/test/weex/android/sdk/build/intermediates/intermediate-jars/debug/jni/x86
```

AS 可以调试部分 c++ 模块，但是 js runtime 模块没法调试，因为 lldb 目前还不支持调试 fork 出来的子进程。这里需要借助 gdb 在 vscode 中调试，具体配置可以参考 `android/.vscode/launch.json`

```bash
# lldb 目前还不支持调试 fork 出来的子进程, 但是据可靠消息 v14 将支持，目前该参数无效
# see https://stackoverflow.com/a/69699331 and https://www.moritz.systems/blog/lldb-support-for-fork-and-vfork/
settings set target.process.follow-fork-mode child
```

# 模拟器 root
* 使用 [rootAVD](https://github.com/newbit1/rootAVD)
* [使用文章介绍](https://forum.xda-developers.com/t/script-rootavd-root-your-android-studio-virtual-device-emulator-with-magisk-android-12-linux-darwin-macos-win-google-play-store-apis.4218123/)

# 相关文章
* [使用 lldb 调试安卓](https://www.cnblogs.com/huangguanyuan/p/9651108.html)
* [vscode lldb](https://blog.csdn.net/u011057800/article/details/113246752)
* [vscode gdb](https://blog.csdn.net/u011057800/article/details/108094858)
* [如何调试Android Framework？](https://weishu.me/2016/05/30/how-to-debug-android-framework/)
* [简单实现Android手机“全局可调试”（ro.debuggable = 1）的方法](https://article.itxueyuan.com/5696E0) 建议使用 rootAVD debug 模式 root
* [让你的Android Studio能够对任意进程进行源码级native debug](https://bbs.pediy.com/thread-270154.htm)