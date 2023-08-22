local wezterm = require 'wezterm'
local config = {}

config.default_prog = { '/usr/bin/tmux', '-l' }

config.font = wezterm.font 'ComicCodeLigatures Nerd Font'
config.default_domain = 'WSL:ubuntu2004'
config.color_scheme = 'nord'
config.keys = {
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
    {key="Backspace", mods="OPT", action=wezterm.action{SendString="\x1b\x7f"}},
}
config.window_close_confirmation = "NeverPrompt"
config.font_size = 9
config.hide_tab_bar_if_only_one_tab = true
config.freetype_load_target = "HorizontalLcd"
config.window_padding = {
  left = '0px',
  right = '0px',
  top = '0px',
  bottom = '0px',
}

config.scrollback_lines = 100000

return config
