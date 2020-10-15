---=== ModalMgr ===
---
---模式绑定环境管理。只是“ hs.hotkey.modal”的包装。
---
---下载：[https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ModalMgr.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ModalMgr .spoon.zip）

local obj = {}
obj.__index = obj

-- 元数据
obj.name = "ModalMgr"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.modal_tray = nil
obj.which_key = nil
obj.modal_list = {}
obj.active_list = {}
obj.supervisor = nil

function obj:init()
    hsupervisor_keys = hsupervisor_keys or {{"cmd", "shift", "ctrl"}, "Q"}
    obj.supervisor = hs.hotkey.modal.new(hsupervisor_keys[1], hsupervisor_keys[2], 'Initialize Modal Environment')
    obj.supervisor:bind(hsupervisor_keys[1], hsupervisor_keys[2], "Reset Modal Environment", function() obj.supervisor:exit() end)
    hshelp_keys = hshelp_keys or {{"alt", "shift"}, "/"}
    obj.supervisor:bind(hshelp_keys[1], hshelp_keys[2], "Toggle Help Panel", function() obj:toggleCheatsheet({all=obj.supervisor}) end)
    obj.modal_tray = hs.canvas.new({x = 0, y = 0, w = 0, h = 0})
    obj.modal_tray:level(hs.canvas.windowLevels.tornOffMenu)
    obj.modal_tray[1] = {
        type = "circle",
        action = "fill",
        fillColor = {hex = "#FFFFFF", alpha = 0.7},
    }
    obj.which_key = hs.canvas.new({x = 0, y = 0, w = 0, h = 0})
    obj.which_key:level(hs.canvas.windowLevels.tornOffMenu)
    obj.which_key[1] = {
        type = "rectangle",
        action = "fill",
        fillColor = {hex = "#EEEEEE", alpha = 0.95},
        roundedRectRadii = {xRadius = 10, yRadius = 10},
    }
end

---ModalMgr：new（id）
 --方法
---创建一个新的模式键绑定环境
---
---参数：
---*id-一个字符串，指定新的模式键绑定的ID

function obj:new(id)
    obj.modal_list[id] = hs.hotkey.modal.new()
end

---ModalMgr：toggleCheatsheet（[idList]，[force]）
 --方法
---切换当前模态环境的按键绑定的备忘单显示。
---
---参数：
---*iterList-一个指定模态环境或active_list的ID的表。可选，默认为所有活动环境。
---*force-强制显示备忘单的可选布尔值，默认为`nil'（自动）。

function obj:toggleCheatsheet(iterList, force)
    if obj.which_key:isShowing() and not force then
        obj.which_key:hide()
    else
        local cscreen = hs.screen.mainScreen()
        local cres = cscreen:fullFrame()
        obj.which_key:frame({
            x = cres.x + cres.w / 5,
            y = cres.y + cres.h / 5,
            w = cres.w / 5 * 3,
            h = cres.h / 5 * 3
        })
        local keys_pool = {}
        local tmplist = iterList or obj.active_list
        for i, v in pairs(tmplist) do
            if type(v) == "string" then
                -- It appears to be idList
                for _, m in ipairs(obj.modal_list[v].keys) do
                    table.insert(keys_pool, m.msg)
                end
            elseif type(i) == "string" then
                -- It appears to be active_list
                for _, m in pairs(v.keys) do
                    table.insert(keys_pool, m.msg)
                end
            end
        end
        for idx, val in ipairs(keys_pool) do
            if idx % 2 == 1 then
                obj.which_key[idx + 1] = {
                    type = "text",
                    text = keys_pool[idx],
                    textFont = "Courier-Bold",
                    textSize = 16,
                    textColor = {hex = "#2390FF", alpha = 1},
                    textAlignment = "left",
                    frame = {
                        x = tostring(40 / (cres.w / 5 * 3)),
                        y = tostring((30 + (idx - math.ceil(idx / 2)) * math.ceil((cres.h / 5 * 3 - 60) / #keys_pool) * 2) / (cres.h / 5 * 3)),
                        w = tostring((1 - 80 / (cres.w / 5 * 3)) / 2),
                        h = tostring(math.ceil((cres.h / 5 * 3 - 60) / #keys_pool) * 2 / (cres.h / 5 * 3))
                    }
                }
            else
                obj.which_key[idx + 1] = {
                    type = "text",
                    text = keys_pool[idx],
                    textFont = "Courier-Bold",
                    textSize = 16,
                    textColor = {hex = "#2390FF"},
                    textAlignment = "right",
                    frame = {
                        x = "50%",
                        y = tostring((30 + (idx - math.ceil(idx / 2) - 1) * math.ceil((cres.h / 5 * 3 - 60) / #keys_pool) * 2) / (cres.h / 5 * 3)),
                        w = tostring((1 - 80 / (cres.w / 5 * 3)) / 2),
                        h = tostring(math.ceil((cres.h / 5 * 3 - 60) / #keys_pool) * 2 / (cres.h / 5 * 3))
                    }
                }
            end
        end
        obj.which_key:show()
    end
end

---ModalMgr：activate（idList，[trayColor]，[showKeys]）
 --方法
---在`idList`中激活所有模态环境。
---
---参数：
---*idList-指定模态环境的ID的表
---*trayColor-可选字符串（例如＃000000），用于指定modalTray的颜色，默认为`nil'。
---*showKeys-一个可选的布尔值，用于显示所有可用的键绑定，默认为`nil`。

function obj:activate(idList, trayColor, showKeys)
    for _, val in ipairs(idList) do
        obj.modal_list[val]:enter()
        obj.active_list[val] = obj.modal_list[val]
    end
    if trayColor then
        local cscreen = hs.screen.mainScreen()
        local cres = cscreen:fullFrame()
        local lcres = cscreen:absoluteToLocal(cres)
        obj.modal_tray:frame(cscreen:localToAbsolute{
            x = cres.w - 40,
            y = cres.h - 40,
            w = 20,
            h = 20
        })
        obj.modal_tray[1].fillColor = {hex = trayColor, alpha = 0.7}
        obj.modal_tray:show()
    end
    if showKeys then
        obj:toggleCheatsheet(idList, true)
    end
end

---ModalMgr：deactivate（idList）
 --方法
---停用`idList`中的模态环境。
---
---参数：
---*idList-指定模态环境的ID的表

function obj:deactivate(idList)
    for _, val in ipairs(idList) do
        obj.modal_list[val]:exit()
        obj.active_list[val] = nil
    end
    obj.modal_tray:hide()
    for i = 2, #obj.which_key do
        obj.which_key:removeElement(2)
    end
    obj.which_key:hide()
end

---ModalMgr：deactivateAll（）
 --方法
---停用所有活动的模态环境。
---

function obj:deactivateAll()
    obj:deactivate(obj.active_list)
end

return obj
