local Config = require('config')

require('utils.backdrops')
   :set_files()
   -- :set_focus('#000000')
   :random()

local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-startup', function()
   local _, _, window = mux.spawn_window({})
   window:gui_window():maximize()
end)

require('events.right-status').setup()
require('events.left-status').setup()
require('events.tab-title').setup()
require('events.new-tab-button').setup()

return Config:init()
   :append(require('config.appearance'))
   :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch')).options