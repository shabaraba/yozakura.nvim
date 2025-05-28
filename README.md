# 🌸 Yozakura.nvim

A Neovim colorscheme inspired by cherry blossoms at night, designed with eye comfort and readability in mind.

## Features

- 🎨 **Three carefully crafted palettes**:
  - `soft_contrast`: Gentle contrast (7:1-10:1) for extended coding sessions
  - `warm_gray`: Warm gray base that reduces blue light exposure
  - `muted_rose`: Muted rose tones with perfect balance of visibility and comfort
- 👁️ **Eye-friendly design**: Scientifically designed contrast ratios to minimize eye strain
- 🔍 **High readability**: WCAG AAA compliant color combinations
- 🌙 **Dark theme optimized**: Perfect for low-light environments
- 🎯 **Semantic highlighting**: Support for Treesitter and LSP

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "shabaraba/yozakura.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("yozakura").setup({
      -- Your configuration here
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
  palette = nil, -- nil | "soft_contrast" | "warm_gray" | "muted_rose"
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
})
```

## Palette Options

### Default
The default palette uses traditional cherry blossom colors.

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