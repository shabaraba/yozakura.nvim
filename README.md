# 🌸 sakura.nvim

A beautiful sakura (cherry blossom) themed colorscheme for Neovim, inspired by the minimalist design philosophy of iceberg.vim.

## Features

- **Sakura-themed palette**: Built around soft pink and cherry blossom colors
- **Minimal and focused**: Single color-based theme with carefully chosen accent colors
- **Dark and light variants**: Supports both dark and light backgrounds
- **TreeSitter support**: Full support for TreeSitter highlighting
- **Terminal colors**: Integrated terminal color configuration

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "sakura.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("sakura").setup({
      transparent = false,
      italic_comments = true,
      dim_inactive = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    })
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'sakura.nvim',
  config = function()
    require('sakura').setup()
  end
}
```

## Usage

After installation, you can apply the colorscheme:

```vim
colorscheme sakura
```

Or in Lua:

```lua
vim.cmd("colorscheme sakura")
```

## Configuration

You can configure sakura.nvim by calling the setup function:

```lua
require("sakura").setup({
  transparent = false,         -- Enable transparent background
  italic_comments = true,      -- Make comments italic
  dim_inactive = false,        -- Dim inactive windows
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
})
```

## Color Palette

The colorscheme is built around these sakura-inspired colors:

- **Sakura Pink**: `#ffb7c5` - The main theme color
- **Light Sakura**: `#ffd0dc` - Lighter variant for highlights
- **Dark Sakura**: `#e899a5` - Darker variant for keywords
- **Muted Sakura**: `#d4a5b3` - Subtle variant for UI elements

## License

MIT