local M = {}

-- Yozakura palettes - 目に優しく視認性の高い配色
M.yozakura = {
  soft_contrast = {
    -- Background colors
    bg0 = "#1e1e2e",         -- 最も暗い背景
    bg1 = "#2a2a3e",         -- 暗い背景  
    bg2 = "#383850",         -- 選択範囲
    bg3 = "#414155",         -- 明るめの背景
    
    -- Foreground colors
    fg0 = "#d9b8cf",         -- 文字列 (10:1)
    fg1 = "#cba6c3",         -- 関数 (8.5:1)
    fg2 = "#c386b8",         -- キーワード (7:1)
    fg3 = "#6e6e8b",         -- コメント (3.5:1)
    
    -- Base colors
    sakura = "#cba6c3",      -- メインの桜色
    sakura_light = "#d9b8cf", -- 明るい桜色
    sakura_dark = "#c386b8",  -- 暗い桜色
    sakura_muted = "#a888a1", -- 落ち着いた桜色
    
    -- Accent colors
    red = "#ff7b9d",
    green = "#98d8c8",
    yellow = "#f6c177",
    blue = "#b5a7e6",
    purple = "#dbb8e9",
    cyan = "#a8dadc",
    orange = "#ffab91",
    
    none = "NONE",
  },
  
  warm_gray = {
    -- Background colors  
    bg0 = "#242220",         -- 暖色系グレー背景
    bg1 = "#302d2b",         -- 暗い背景
    bg2 = "#3e3a37",         -- 選択範囲
    bg3 = "#4a4642",         -- 明るめの背景
    
    -- Foreground colors
    fg0 = "#e0b5c5",         -- 文字列 (10.5:1)
    fg1 = "#d5a0b5",         -- 関数 (8.8:1)
    fg2 = "#cc8fa5",         -- キーワード (7.5:1)
    fg3 = "#706b65",         -- コメント (3:1)
    
    -- Base colors
    sakura = "#d5a0b5",      -- メインの桜色
    sakura_light = "#e0b5c5", -- 明るい桜色
    sakura_dark = "#cc8fa5",  -- 暗い桜色
    sakura_muted = "#b08a95", -- 落ち着いた桜色
    
    -- Accent colors
    red = "#d08a9a",
    green = "#a0c8a8",
    yellow = "#d6b177",
    blue = "#b0a0d6",
    purple = "#d0a8d9",
    cyan = "#a8c8cc",
    orange = "#d6a891",
    
    none = "NONE",
  },
  
  muted_rose = {
    -- Background colors
    bg0 = "#212029",         -- ミューテッドローズ背景
    bg1 = "#2b2a35",         -- 暗い背景
    bg2 = "#393844",         -- 選択範囲
    bg3 = "#45444f",         -- 明るめの背景
    
    -- Foreground colors
    fg0 = "#d6b5c0",         -- 文字列 (10.2:1)
    fg1 = "#c79fad",         -- 関数 (8.2:1)
    fg2 = "#b88a9a",         -- キーワード (6.8:1)
    fg3 = "#6a6875",         -- コメント (3.3:1)
    
    -- Base colors
    sakura = "#c79fad",      -- メインの桜色
    sakura_light = "#d6b5c0", -- 明るい桜色
    sakura_dark = "#b88a9a",  -- 暗い桜色
    sakura_muted = "#a08590", -- 落ち着いた桜色
    
    -- Accent colors
    red = "#d090a0",
    green = "#90c8a8",
    yellow = "#c8b090",
    blue = "#a090c8",
    purple = "#c8a0d0",
    cyan = "#90b8c8",
    orange = "#d0a890",
    
    none = "NONE",
  }
}

function M.setup(opts)
  local config = require("yozakura.config").get()
  
  -- Yozakuraパレットが指定されている場合
  if config.palette and M.yozakura[config.palette] then
    return M.yozakura[config.palette]
  end
  
  -- デフォルトはsoft_contrastパレット
  return M.yozakura.soft_contrast
end

return M