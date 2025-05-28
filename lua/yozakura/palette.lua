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

M.dark = {
  -- Base colors (桜色を基調)
  sakura = "#ffb7c5",      -- メインの桜色
  sakura_light = "#ffd0dc", -- 明るい桜色
  sakura_dark = "#e899a5",  -- 暗い桜色
  sakura_muted = "#d4a5b3", -- 落ち着いた桜色
  
  -- Background colors
  bg0 = "#1e1e2e",         -- 最も暗い背景
  bg1 = "#2a2a3e",         -- 暗い背景
  bg2 = "#35354a",         -- 中間の背景
  bg3 = "#414155",         -- 明るめの背景
  
  -- Foreground colors  
  fg0 = "#f5e6e8",         -- 最も明るい前景
  fg1 = "#e8d5d7",         -- 明るい前景
  fg2 = "#cbb6b8",         -- 中間の前景
  fg3 = "#a08a8c",         -- 暗い前景
  
  -- Accent colors
  red = "#ff7b9d",         -- エラー、削除
  green = "#98d8c8",       -- 成功、追加
  yellow = "#f6c177",      -- 警告
  blue = "#b5a7e6",        -- 情報、リンク
  purple = "#dbb8e9",      -- 特殊
  cyan = "#a8dadc",        -- 文字列
  orange = "#ffab91",      -- 定数
  
  -- Special
  none = "NONE",
}

M.light = {
  -- Base colors (桜色を基調)
  sakura = "#e67b97",      -- メインの桜色
  sakura_light = "#ffb7c5", -- 明るい桜色  
  sakura_dark = "#c55a74",  -- 暗い桜色
  sakura_muted = "#b08592", -- 落ち着いた桜色
  
  -- Background colors
  bg0 = "#fff5f5",         -- 最も明るい背景
  bg1 = "#ffe8e8",         -- 明るい背景
  bg2 = "#ffd6d6",         -- 中間の背景
  bg3 = "#ffc4c4",         -- 暗めの背景
  
  -- Foreground colors
  fg0 = "#2e2028",         -- 最も暗い前景
  fg1 = "#4a3842",         -- 暗い前景
  fg2 = "#685860",         -- 中間の前景
  fg3 = "#8a7a82",         -- 明るい前景
  
  -- Accent colors  
  red = "#d7005f",         -- エラー、削除
  green = "#00796b",       -- 成功、追加
  yellow = "#ef6c00",      -- 警告
  blue = "#5e35b1",        -- 情報、リンク
  purple = "#8e24aa",      -- 特殊
  cyan = "#0097a7",        -- 文字列
  orange = "#e65100",      -- 定数
  
  -- Special
  none = "NONE",
}

function M.setup(opts)
  local config = require("yozakura.config").get()
  
  -- Yozakuraパレットが指定されている場合
  if config.palette and M.yozakura[config.palette] then
    return M.yozakura[config.palette]
  end
  
  -- デフォルトのsakuraパレット
  return vim.o.background == "light" and M.light or M.dark
end

return M