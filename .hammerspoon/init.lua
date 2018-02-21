hs.window.animationDuration = 0

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h

    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = max.w * 0.1
    f.y = max.h * 0.1
    f.w = max.w * 0.8
    f.h = max.h * 0.8

    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = max.x
    f.w = max.w / 2
    f.y = max.y
    f.h = max.h

    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = max.w / 2
    f.w = max.w / 2
    f.y = max.y
    f.h = max.h

    win:setFrame(f)
end)

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
