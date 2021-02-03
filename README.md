# [hammerspoon-config](hammerspoon-config) 


> 本配置基于 vim 风格，实现了窗口管理，剪切板，倒计时，快速启动等功能。所有模式按照指定快捷键进入，所有模式都可以用 `esc` 或 `q`退出。在进入对应模式之前只有模式快捷键生效，进入对应模式之后此模式的操作快捷键生效。

## 安装配置与升级:

安装 hammerspoon 
```
brew cask install hammerspoon
```

将配置文件克隆到本地根目录。
```
git clone https://github.com/zuorn/hammerspoon_config ~/.hammerspoon
```
**重新加载配置文件即可生效**。

如果提示：already exists and is not an empty directory.
先删除目录

```
rm -rf ~/.hammerspoon
```

升级：

```
cd ~/.hammerspoon && git pull
```

## 功能实现：

**注：所有模式按 `esc` 和 `q` 退出。**

### 帮助面板
按下快捷键 `shift` + `option` + `/` 显示帮助面板查看各个模式快捷键。再按下对应快捷键切换模式。

![](http://ww1.sinaimg.cn/large/006tNc79ly1g4pzrve6gsj31c00u0k0p.jpg)


### 窗口管理模式
按下前缀键 `Option` + `R` 进入窗口管理模式：

* 使用 `h、j、k、l` 移动为上下左右的半屏
* 使用 ` y、u、i、o`（即 hjkl 上方按键）移动为左上/左下/右上/右下的四分之一窗口
* 使用 `c` 居中，按下 `=、-` 进行窗口大小缩放
* 使用 `w、s、a、d` 向上下左右移动窗口
* 使用 `H、J、K、L` 向左/下增减窗口大小
* 使用方向键 `上、下、左、右` 移动到相应方向上的显示器（多块显示器的话）
* 使用 `[,]` 左三分之二屏和右三分之二屏
* 使用 `space` 将窗口投送到另外一块屏幕（假如有两块以上显示器的话）
* 使用 `t` 光标移动到所在窗口的中间位置
* 使用 `tab` 显示帮助面板，查看键位图
* 使用 `G` 左三分之二居中分屏 
* 使用 `Z` 展示显示 
* 使用 `V` 编程显示 
* 使用 `t` 将光标移至所在窗口的中心位置 
* 使用 `X` 三分之一居中分屏 


![](http://ww4.sinaimg.cn/large/006tNc79ly1g4pz9dhogwj31c00u04aw.jpg) 

注：如设置程序坞自动隐藏请修改  `/Users/zuorn/.hammerspoon/Spoons/WinWin.spoon/init.lua.bak` 为`init.lua`

### 应用快速切换

按下前缀键 `Option` + `tab` 显示窗口提示，按下对应应用显示的字母快速切换。
![快速切换](https://i.loli.net/2019/07/06/5d20193818dd473100.png)




### KSheet - 展示应用快捷键

按下快捷键 `Option` + `s` 展示当前应用快捷键，按 `q` 或者 `esc` 退出。

![应用快捷键](https://i.loli.net/2019/07/06/5d2019381760e52911.png)


### 快速启动

按下快捷键 `Option` + `a` 打开快速启动，按下对应字母快速打开应用。

![启动器](https://i.loli.net/2019/07/06/5d2019368b6dc67355.png)


### AClock - 显示当前时间

按下 `Option` + `t` 显示当前时间。

![时钟](https://i.loli.net/2019/07/06/5d201936dbfdf69558.png)


### 倒计时（番茄钟）

按下 `Option` + `i` 打开倒计时面板，按下对应数字开始计时。

* 使用 `空格` 可暂停/恢复倒计时。 

![倒计时](https://i.loli.net/2019/07/06/5d2019372da4545679.png)


### clipshowM 剪切板

按下 `Option` + `c` 打开剪切板面板。

![剪切板](https://i.loli.net/2019/07/06/5d201937266fe84053.png)

功能：

* 保存会话
* 恢复上一个会话
* 在浏览器中打开
* 使用百度搜索
* 使用谷歌搜索
* 保存到桌面
* 使用 github 搜索
* 在 Sublime Text 打开

### 顶部实时显示网速

没有模式快捷键，默认开启。

![网速显示](https://i.loli.net/2019/07/06/5d2019336a0b441738.jpg)

## 自定义配置

拷贝私有配置文件

```
cp ~/.hammerspoon/config-example.lua ~/.hammerspoon/private/config.lua
```

按照注释编辑私有配置文件 `~/.hammerspoon/private/config.lua` 即可。

####  可自定义范围：

* 指定要启用模块
*  找到配置文件启用模块，注释对应模块可禁止用对应功能。
* 绑定快速启动 app 及快捷键
* 自定义模式快捷键
* 自定义 hammerspoon 快捷键绑定


## 参考：

* [Hammerspoon Spoons](https://www.hammerspoon.org/Spoons/)
* [awesome-hammerspoon](https://github.com/ashfinal/awesome-hammerspoon)
