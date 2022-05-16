#!/bin/bash

adb forward tcp:3000 tcp:3000

pid=`adb shell pidof libweexjsb.so`

adb root
# 隐藏 shell 窗口
adb shell "gdbserver :3000 --attach $pid &" &

# or 隐藏 shell 窗口
# https://unix.stackexchange.com/questions/166116/how-to-launch-gdbserver-in-background
# adb shell gdbserver :3000 --attach $pid > /dev/null 2>&1 &
