# 🌸 Yozakura.nvim

A Neovim colorscheme inspired by cherry blossoms at night, designed with eye comfort and readability in mind.

## Requirements

- Neovim >= 0.8.0
- Terminal with true color support
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (highly recommended for proper syntax highlighting)

## Features

- 🎨 **Four carefully crafted palettes**:
  - `soft_contrast`: Gentle contrast (7:1-10:1) for extended coding sessions
  - `warm_gray`: Warm gray base that reduces blue light exposure
  - `muted_rose`: Muted rose tones with perfect balance of visibility and comfort
  - `night_blue`: Night-themed with blue accents for late-night coding
- 👁️ **Eye-friendly design**: Scientifically designed contrast ratios to minimize eye strain
- 🔍 **High readability**: WCAG AAA compliant color combinations
- 🌙 **Dark theme optimized**: Perfect for low-light environments
- 🎯 **Full Treesitter support**: Complete highlighting for Neovim 0.9+ Treesitter groups
- 🌍 **Language-specific optimizations**: Tailored highlights for popular languages (Lua, TypeScript, Python, Rust, Go, C++, Java, and more)
- 🔧 **LSP semantic tokens**: Enhanced highlighting with LSP semantic tokens support

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "shabaraba/yozakura.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("yozakura").setup({
      palette = "night_blue", -- Use night_blue palette
    })
    vim.cmd.colorscheme("yozakura")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "shabaraba/yozakura.nvim",
  config = function()
    require("yozakura").setup({
      -- Your configuration here
    })
    vim.cmd.colorscheme("yozakura")
  end
}
```

## Configuration

```lua
require("yozakura").setup({
  transparent = false,
  italic_comments = true,
  dim_inactive = false,
  palette = "soft_contrast", -- "soft_contrast" | "warm_gray" | "muted_rose" | "night_blue"
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
})
```

## Commands

Yozakura provides commands to switch palettes on the fly:

```vim
:YozakuraSoftContrast   " Switch to soft contrast palette
:YozakuraWarmGray       " Switch to warm gray palette
:YozakuraMutedRose      " Switch to muted rose palette
:YozakuraNightBlue      " Switch to night blue palette

" Or use the generic command with tab completion
:YozakuraPalette <palette_name>
:YozakuraPalette soft_contrast
:YozakuraPalette warm_gray
:YozakuraPalette muted_rose
:YozakuraPalette night_blue
```

You can also switch palettes programmatically:

```lua
-- Switch to a specific palette
require('yozakura').set_palette('soft_contrast')
require('yozakura').set_palette('warm_gray')
require('yozakura').set_palette('muted_rose')
require('yozakura').set_palette('night_blue')

-- Switch back to default (soft_contrast)
require('yozakura').set_palette(nil)
```

## Palette Options

### Default (Soft Contrast)
When no palette is specified, the soft contrast palette is used by default.

### Soft Contrast
```lua
palette = "soft_contrast"
```
Moderate contrast ratios (7:1-10:1) optimized for long coding sessions.

### Warm Gray
```lua
palette = "warm_gray"
```
Warm gray base colors that reduce blue light exposure for minimal eye strain.

### Muted Rose
```lua
palette = "muted_rose"
```
Subtle rose tones with excellent color distinction and focus enhancement.

### Night Blue
```lua
palette = "night_blue"
```
Night-themed palette with blue accents, perfect for late-night coding sessions.

## Color Design Principles

1. **Appropriate Contrast**: 7:1-10:1 contrast ratios to prevent eye fatigue
2. **Warm Color Base**: Reduced blue light for comfortable extended use
3. **Adjusted Saturation**: Non-glaring colors that maintain distinctiveness
4. **Gradual Brightness**: Natural depth perception from background to foreground
5. **Consistent Hue**: Unified pink-to-rose color scheme to reduce cognitive load

## License

MIT License - see [LICENSE](LICENSE) for details.

## Credits

Inspired by the beauty of cherry blossoms (桜) at night.