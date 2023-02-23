-- load themes config
require ("user.themes.github-nvim-theme")
-- require ("user.themes.onedark")
require ("user.themes.catppuccin")
require ("user.themes.tokyonight")

-- cursor color: #61AFEF
local colorscheme = "tokyonight"
-- local colorscheme = "darkplus"
-- local colorscheme = "github_light"
-- require "user.conf.github-nvim-theme"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

if colorscheme == "onedark" then
  require "user.themes.onedark"
elseif colorscheme == "tokyonight" then
  require "user.themes.tokyonight"
elseif colorscheme == "catppuccin" then
  require "user.themes.catppuccin"
end
