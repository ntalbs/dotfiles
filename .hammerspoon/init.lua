hs.window.animationDuration = 0
hs.logger.defaultLogLevel = 'debug'

local log = hs.logger.new('ntalbs','info')

function setKeyLayoutToUs()
  hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

hs.window.filter.new{'Emacs', 'iTerm2'}:subscribe(
  hs.window.filter.windowFocused,
  function()
    setKeyLayoutToUs()
  end
)

hs.keycodes.inputSourceChanged(function ()
    local app = hs.application.frontmostApplication():name()
    if app == 'Emacs' then
      setKeyLayoutToUs()
    end
end)

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
    local s   = win:screen():frame()

    f.x = s.x
    f.y = s.y
    f.w = s.w
    f.h = s.h

    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local s   = win:screen():frame()

    f.x = s.x + s.w / 4
    f.y = s.y
    f.w = s.w / 2
    f.h = s.h

    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local s   = win:screen():frame()

    local fw = isLeft(f, s) and f.w * 0.8 or s.w / 2

    f.x = s.x
    f.w = fw
    f.y = s.y
    f.h = s.h

    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local s   = win:screen():frame()

    local fw = isRight(f, s) and f.w * 0.8 or s.w / 2

    f.x = s.x + s.w - fw
    f.w = fw
    f.y = s.y
    f.h = s.h

    win:setFrameInScreenBounds(f, s)
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
