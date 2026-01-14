local M = {}

-- Yozakura palettes - 目に優しく視認性の高い配色
M.yozakura = {
  teal_night = {
    -- Background colors (深青緑の夜)
    bg0 = "#1f3844", -- 最も暗い背景
    bg1 = "#234350", -- 暗い背景
    bg2 = "#2a4d5c", -- メイン背景
    bg3 = "#325866", -- 選択範囲

    -- Foreground colors (サーモンピンク系)
    fg0 = "#f5e6e0", -- 主要テキスト (12:1)
    fg1 = "#e8c5b8", -- 関数 (9:1)
    fg2 = "#ddb0a0", -- キーワード (7.5:1)
    fg3 = "#6e7f88", -- コメント (3.5:1)

    -- Base colors (Teal Night Sakura)
    sakura = "#e8c5b8",       -- メインの桜色（サーモンピンク）
    sakura_light = "#f0dcd4", -- 明るい桜色
    sakura_dark = "#ddb0a0",  -- 暗い桜色
    sakura_muted = "#c89988", -- 落ち着いた桜色

    -- Accent colors
    red = "#cd7f7f",    -- エラー
    green = "#a8c4a2",  -- 文字列（優しい緑）
    yellow = "#d4a373", -- 警告（暖色）
    blue = "#8fa5a0",   -- 変数（青緑系）
    purple = "#b38270", -- 特殊（茶系）
    cyan = "#7a928c",   -- 組み込み
    orange = "#d4a373", -- 数値

    none = "NONE",
  },

  warm_gray = {
    -- Background colors
    bg0 = "#242220", -- 暖色系グレー背景
    bg1 = "#302d2b", -- 暗い背景
    bg2 = "#3e3a37", -- 選択範囲
    bg3 = "#4a4642", -- 明るめの背景

    -- Foreground colors
    fg0 = "#e0b5c5", -- 文字列 (10.5:1)
    fg1 = "#d5a0b5", -- 関数 (8.8:1)
    fg2 = "#cc8fa5", -- キーワード (7.5:1)
    fg3 = "#8a7f75", -- コメント (4.5:1) - より明るく

    -- Base colors
    sakura = "#d5a0b5",       -- メインの桜色
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
    bg0 = "#212029", -- ミューテッドローズ背景
    bg1 = "#2b2a35", -- 暗い背景
    bg2 = "#393844", -- 選択範囲
    bg3 = "#45444f", -- 明るめの背景

    -- Foreground colors
    fg0 = "#d6b5c0", -- 文字列 (10.2:1)
    fg1 = "#c79fad", -- 関数 (8.2:1)
    fg2 = "#b88a9a", -- キーワード (6.8:1)
    fg3 = "#7d7b85", -- コメント (5:1) - より明るく

    -- Base colors
    sakura = "#c79fad",       -- メインの桜色
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
  },

  night_blue = {
    -- Background colors (夜の青をベースにした背景)
    bg0 = "#1a1a26", -- 最も暗い背景（夜空）
    bg1 = "#232334", -- 暗い背景
    bg2 = "#2e3145", -- 選択範囲
    bg3 = "#3a3d55", -- 明るめの背景

    -- Foreground colors
    fg0 = "#e0c0d5", -- 文字列 (明るい桜色)
    fg1 = "#d0a5c8", -- 関数 (メイン桜色)
    fg2 = "#c090b8", -- キーワード (暗い桜色)
    fg3 = "#6d7195", -- コメント (青みがかったグレー) - より明るく

    -- Base colors (Night Sakura with Blue accent)
    sakura = "#d0a5c8",       -- メインの桜色
    sakura_light = "#e0c0d5", -- 明るい桜色
    sakura_dark = "#c090b8",  -- 暗い桜色
    sakura_muted = "#9d88a5", -- 落ち着いた桜色（青の影響）

    -- Accent colors (Night theme with blue tint)
    red = "#f7768e",    -- 夜の赤
    green = "#9ece6a",  -- 夜の緑
    yellow = "#ff9e64", -- 夜のオレンジ
    blue = "#7aa2f7",   -- 夜の青（アクセント）
    purple = "#bb9af7", -- 夜の紫
    cyan = "#73daca",   -- 夜のシアン
    orange = "#ff9e64", -- 夜のオレンジ

    none = "NONE",
  }
}

--- Get all available palette names
--- @return string[] List of palette names
function M.get_palette_names()
  local names = {}
  for name, _ in pairs(M.yozakura) do
    table.insert(names, name)
  end
  table.sort(names)  -- Sort alphabetically for consistency
  return names
end

--- Setup and return the specified palette
--- @param opts table|nil Options table with palette name
--- @return table The selected palette configuration
function M.setup(opts)
  local config = require("yozakura.config").get()

  -- optsでpaletteが指定されている場合は優先
  local palette_name = (opts and opts.palette) or config.palette or "warm_gray"

  -- Yozakuraパレットが指定されている場合
  if M.yozakura[palette_name] then
    return M.yozakura[palette_name]
  end

  -- デフォルトはwarm_grayパレット
  return M.yozakura.warm_gray
end

return M

