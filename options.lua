-- set vim options here (vim.<first_key>.<second_key> = value)
return function(local_vim)
  local_vim.opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true,         -- sets vim.opt.number
    spell = false,         -- sets vim.opt.spell
    signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
    wrap = false,          -- sets vim.opt.wrap
    shiftwidth = 4,        -- sets vim.opt.shiftwidth
    softtabstop = 4,       -- sets vim.opt.softtabstop
    tabstop = 8,           -- sets vim.opt.tabstop
    wrapscan = false,      -- 搜索到文件两端不重新搜索
    list = true,           -- show tabs and trailing spaces
    foldlevel = 99,
  }

  local_vim.g = {
    mapleader = " ",                 -- sets vim.g.mapleader
    autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true,              -- enable completion at start
    autopairs_enabled = true,        -- enable autopairs at start
    diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    max_file = { size = 25600000, lines = 100000 },
  }

  if vim.fn.executable("pwsh") or vim.fn.executable("powershell") then
    local_vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
    local_vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    local_vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    local_vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    local_vim.opt.shellquote = ""
    local_vim.opt.shellxquote = ""
  elseif vim.fn.executable("cmd") then
    local_vim.opt.shell = "cmd"
  else
    local_vim.opt.shell = vim.fn.executable("zsh") and "zsh" or "bash"
  end

  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list

  local_vim.opt.listchars = vim.opt.listchars:append "space:⋅"

  return local_vim
end
