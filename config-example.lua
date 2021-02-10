----------------------------------------------------------------------------------------------------

-- author: zuorn
-- mail: zuorn@qq.com
-- github: https://github.com/zuorn/hammerspoon_config

----------------------------------------------------------------------------------------------------

----------------------------------------- 配 置 文 件 -----------------------------------------------

----------------------------------------------------------------------------------------------------

--指定要启用的模块
hspoon_list = {
    "AClock",
    "ClipShow",
    "CountDown",
    "KSheet",
    "WinWin",
    "VolumeScroll",
    "PopupTranslateSelection",
    "DeepLTranslate"
    -- "HSaria2"
    -- "HSearch"
    --"SpeedMenu",
    -- "MountedVolumes",
    -- "HeadphoneAutoPause",
}

----------------------------------------------------------------------------------------------------
----------------------------------------- 快速启动配置  ----------------------------------------------

-- 绑定 启动 app 快捷键

hsapp_list = {
    {key = 'a', name = 'Atom'},
    {key = 'c', id = 'com.google.Chrome'},
    {key = 'e', name = '印象笔记'},
    {key = 'f', name = 'Finder'},
    {key = 'i', name = 'iTerm'},
    {key = 'j', name = 'Typora'},
    {key = 'o', name = 'Obsidian'},
    {key = 'k', name = 'Keynote'},
    {key = 's', name = 'Sublime Text'},
    {key = 'p', name = 'Podcasts'},
    {key = 't', name = 'Terminal'},
    -- {key = 'v', id = 'com.apple.ActivityMonitor'},
    {key = 'v', id = 'vsCode.app'},
    {key = 'm', name = 'Mweb'},
    {key = 'w', name = 'WeChat'},
    {key = 'x', name = '迅雷 2'},
    {key = 'y', id = 'com.apple.systempreferences'},
}


----------------------------------------------------------------------------------------------------
---------------------------------------- 模式快捷键绑定  ----------------------------------------------

-- 窗口提示键绑定，快速切换到你想要的窗口上
hswhints_keys = {"alt", "tab"}

-- 快速启动面板快捷键绑定
hsappM_keys = {"alt", "A"}

-- 系统剪切板快捷键绑定
hsclipsM_keys = {"alt", "C"}


-- 在默认浏览器中打开 Hammerspoon 和 Spoons API 手册
--hsman_keys = {"alt", "H"}

-- 倒计时快捷键绑定
hscountdM_keys = {"alt", "I"}

-- 锁定电脑快捷键绑定
--hslock_keys = {"alt", "L"}

-- 窗口自定义大小及位置快捷键绑定
hsresizeM_keys = {"alt", "R"}

-- 定义应用程序快捷键面板快捷键
hscheats_keys = {"alt", "S"}

-- 显示时钟快捷键绑定
hsaclock_keys = {"alt", "T"}

-- 粘贴 chrome 或 safari 打开最前置的网址
hstype_keys = {"alt", "V"}

-- 显示 Hammerspoon 控制台
hsconsole_keys = {"alt", "Z"}

-- 显示 MountedVolumes
hstype_keys = {"alt", "M"}

-- 显示搜索
hsearch_keys = {"alt", "G"}

----------------------------------------------------------------------------------------------------
--------------------------------- hammerspoon 快捷键绑定配置  -----------------------------------------

-- 临时禁用所有快捷键(注意：只能手动接禁。)
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- 重新加载配置文件
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- 显示各种模式绑定快捷键
hshelp_keys = {{"alt", "shift"}, "/"}


----------------------------------------------------------------------------------------------------
---------------------------------------------- end  ------------------------------------------------
----------------------------------------------------------------------------------------------------
