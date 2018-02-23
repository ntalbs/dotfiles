hs.window.animationDuration = 0
function isLeft(f, s)
  return f.x == s.x
    and f.y == s.y
    and f.h == s.h
    and f.w ~= s.w
end

function isRight(f, s)
  return math.abs(f.x + f.w - s.w - s.x) <= 5
    and f.y == s.y
    and f.h == s.h
    and f.w ~= s.w
end

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

    f.x = max.x + max.w / 4
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h

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

    f.x = max.x + max.w / 2
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
hs.alert.show("Config loaded...")
