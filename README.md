# Hammerspoon_config

## 介绍

> 基于 vim 风格配置，实现了窗口管理，剪切板，倒计时，快速启动等功能。


## 使用

1. 安装 [Hammerspoon](http://www.hammerspoon.org/) 。

2. `git clone https://github.com/zuorn/hammerspoon-config.git ~/.hammerspoon`

3. 重新加载配置.

## 更新

```
cd ~/.hammerspoon && git pull
```

## 功能说明

### 打开帮助面板 `shift + cmd + /`

### 窗口管理
按下前缀键 `Option` + `R` 进入窗口管理模式：

* 使用 `h、j、k、l` 移动为上下左右的半屏
* 使用 ` y、u、i、o`（即 hjkl 上方按键）移动为左上/左下/右上/右下的四分之一窗口
* 使用 `c` 居中，按下 `=、-` 进行窗口大小缩放
* 使用 `w、s、a、d` 向上下左右移动窗口
* 使用 `H、J、K、L` 向左/下增减窗口大小
* 使用方向键 `上、下、左、右` 移动到相应方向上的显示器（多块显示器的话）
* 使用 `[,]` 左三分之二屏和右三分之二屏
* 使用 `空格` 将窗口投送到另外一块屏幕（假如有两块以上显示器的话）
* 使用 `/` 光标移动到所在窗口的中间位置
* 使用 `tab` 显示帮助面板，查看键位图
* 使用 q 或 Esc 退出管理


### 浮动显示时钟 `Option + t`

### 