-- Debug script to check current configuration
print("=== Yozakura Config Debug ===")

-- Check current config state
local config = require("yozakura.config").get()
print("Current config:")
print("  palette:", config.palette)
print("  transparent:", config.transparent)
print("  italic_comments:", config.italic_comments)

-- Check which palette is actually being used
local palette = require("yozakura.palette").setup({ palette = config.palette })
print("\nActual palette being used:")
print("  bg0:", palette.bg0)
print("  fg0:", palette.fg0)

-- Expected values for night_blue
print("\nExpected night_blue values:")
print("  bg0: #1a1a26")
print("  fg0: #e0c0d5")

-- Check if night_blue palette exists
local palette_module = require("yozakura.palette")
if palette_module.yozakura.night_blue then
  print("\nnight_blue palette exists:")
  print("  bg0:", palette_module.yozakura.night_blue.bg0)
  print("  fg0:", palette_module.yozakura.night_blue.fg0)
else
  print("\nnight_blue palette NOT FOUND!")
end

print("\n=== Debug completed ===")