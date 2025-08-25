local wezterm = require('wezterm')
local platform = require('utils.platform')
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'CTRL' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|CTRL'
end

return {
   disable_default_key_bindings = false,

   -- Main leader key: CTRL + Space (like tmux prefix)
   leader = { key = '.', mods = mod.SUPER },

   keys = {
      -- Tabs (tmux windows)
      { key = 'c', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
      { key = '&', mods = 'LEADER|SHIFT', action = act.CloseCurrentTab({ confirm = true }) },
      { key = '0', mods = 'LEADER', action = act.ActivateTab(-1) },
      { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
      { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
      { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
      { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
      { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
      { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
      { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
      { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
      { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },

      -- Panes (tmux splits)
      {
         key = '|',
         mods = 'LEADER',
         action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
      },
      { key = '-', mods = 'LEADER', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
      { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = true }) },

      -- Pane navigation (vim-style, like tmux + vim-tmux-navigator)
      { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
      { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
      { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
      { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },

      -- Pane resize mode (like tmux :resize-pane)
      {
         key = 'r',
         mods = 'LEADER',
         action = act.ActivateKeyTable({
            name = 'resize_pane',
            one_shot = false,
            timeout_milliseconds = 1000,
         }),
      },

      -- Copy mode (tmux [ )
      { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },

      -- Reload config (tmux prefix + R)
      { key = 'R', mods = 'LEADER|SHIFT', action = act.ReloadConfiguration },

      -- Kill current tab (like tmux prefix + q)
      { key = 'q', mods = 'LEADER', action = act.CloseCurrentTab({ confirm = false }) },

      -- Kill current pane (like tmux prefix + x)
      { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = true }) },

      -- Session manager bindings
      {
         key = 's',
         mods = 'LEADER|SHIFT',
         action = act({ EmitEvent = 'save_session' }),
      },
      {
         key = 'L',
         mods = 'LEADER|SHIFT',
         action = act({ EmitEvent = 'load_session' }),
      },
      {
         key = 'R',
         mods = 'LEADER|SHIFT',
         action = act({ EmitEvent = 'restore_session' }),
      },
   },

   -- Resize pane mode (hjkl + arrows)
   key_tables = {
      resize_pane = {
         { key = 'h', action = act.AdjustPaneSize({ 'Left', 3 }) },
         { key = 'j', action = act.AdjustPaneSize({ 'Down', 3 }) },
         { key = 'k', action = act.AdjustPaneSize({ 'Up', 3 }) },
         { key = 'l', action = act.AdjustPaneSize({ 'Right', 3 }) },
         { key = 'Escape', action = 'PopKeyTable' },
         { key = 'q', action = 'PopKeyTable' },
      },
   },
}
