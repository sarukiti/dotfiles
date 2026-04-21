-- Ghostty などターミナル側の透過が見えるように、エディタの「下地」を透明にする
local function transparent_background()
  local none = { bg = "NONE", ctermbg = "NONE" }
  local set = vim.api.nvim_set_hl
  set(0, "Normal", none)
  set(0, "NormalNC", none)
  set(0, "SignColumn", none)
  set(0, "FoldColumn", none)
  set(0, "LineNr", none)
  set(0, "CursorLineNr", none)
  set(0, "EndOfBuffer", none)
  set(0, "NonText", none)
  set(0, "WinSeparator", { bg = "NONE", ctermbg = "NONE" })
  set(0, "VertSplit", { bg = "NONE", ctermbg = "NONE" })
  set(0, "Terminal", none)
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",
  callback = transparent_background,
})

-- 補完・プレビューなどの浮遊 UI を軽く透かす（0〜100、大きいほど背後が見える）
vim.o.pumblend = 12
vim.o.winblend = 8
