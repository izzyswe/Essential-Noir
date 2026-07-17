-- Name:       Essential-Noir
-- Version:    0.0.1
-- Maintainer: github.com/izzyswe
-- License:    The MIT License (MIT)

-- ALL credits belong to
-- https://github.com/owickstrom/vim-colors-paramount/

-- Heavily inspired by the Zed theme Noir
-- Zed Theme:

local M = {}

function M.setup()
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax on') == 1 then
    vim.cmd('syntax reset')
  end

  vim.g.colors_name = 'EssentialNoir'

  local colors = {
    black         = { gui = "#000000", cterm = 232 },
    medium_gray   = { gui = "#767676", cterm = 243 },
    white         = { gui = "#F1F1F1", cterm = 15  },
    actual_white  = { gui = "#FFFFFF", cterm = 231 },
    subtle_black  = { gui = "#303030", cterm = 236 },
    light_black   = { gui = "#262626", cterm = 235 },
    lighter_black = { gui = "#4E4E4E", cterm = 239 },
    light_gray    = { gui = "#A8A8A8", cterm = 248 },
    lighter_gray  = { gui = "#C6C6C6", cterm = 251 },
    lightest_gray = { gui = "#EEEEEE", cterm = 255 },
    pink          = { gui = "#fb007a", cterm = 9   },
    dark_red      = { gui = "#C30771", cterm = 1   },
    light_red     = { gui = "#E32791", cterm = 1   },
    orange        = { gui = "#D75F5F", cterm = 167 },
    darker_blue   = { gui = "#005F87", cterm = 18  },
    dark_blue     = { gui = "#008EC4", cterm = 32  },
    blue          = { gui = "#20BBFC", cterm = 12  },
    light_blue    = { gui = "#b6d6fd", cterm = 153 },
    dark_cyan     = { gui = "#20A5BA", cterm = 6   },
    light_cyan    = { gui = "#4FB8CC", cterm = 14  },
    dark_green    = { gui = "#10A778", cterm = 2   },
    light_green   = { gui = "#5FD7A7", cterm = 10  },
    dark_purple   = { gui = "#af5fd7", cterm = 134 },
    light_purple  = { gui = "#a790d5", cterm = 140 },
    yellow        = { gui = "#F3E430", cterm = 11  },
    light_yellow  = { gui = "#ffff87", cterm = 228 },
    dark_yellow   = { gui = "#A89C14", cterm = 3   },
  }

  local background = vim.o.background

  local bg, bg_subtle, bg_very_subtle, norm, norm_subtle
  local purple, cyan, green, red, visual, yellow

  if vim.o.background == "dark" then
    bg             = colors.black
    bg_subtle      = colors.lighter_black
    bg_very_subtle = colors.subtle_black
    norm           = colors.lighter_gray
    norm_subtle    = colors.medium_gray
    purple         = colors.light_purple
    cyan           = colors.light_cyan
    green          = colors.light_green
    red            = colors.light_red
    visual         = colors.light_purple
    yellow         = colors.light_yellow
  else
    bg             = colors.actual_white
    bg_subtle      = colors.light_gray
    bg_very_subtle = colors.lightest_gray
    norm           = colors.light_black
    norm_subtle    = colors.medium_gray
    purple         = colors.dark_purple
    cyan           = colors.dark_cyan
    green          = colors.dark_green
    red            = colors.dark_red
    visual         = colors.dark_purple
    yellow         = colors.dark_yellow
  end

  -- https://github.com/noahfrederick/vim-hemisu/
  -- style = { fg = <color>, bg = <color>, sp = <color>,
  --           gui = "italic,bold", cterm = "bold,underline" }
  local function h(group, style)
    local opts = {}

    if style.fg then
      opts.fg = style.fg.gui
      opts.ctermfg = style.fg.cterm
    end
    if style.bg then
      opts.bg = style.bg.gui
      opts.ctermbg = style.bg.cterm
    end
    if style.sp then
      opts.sp = style.sp.gui
    end
    if style.gui then
      for attr in style.gui:gmatch('%a+') do
        opts[attr] = true
      end
    end
    if style.cterm then
      opts.cterm = {}
      for attr in style.cterm:gmatch('%a+') do
        opts.cterm[attr] = true
      end
    end

    vim.api.nvim_set_hl(0, group, opts)
  end

  local function link(group, target)
    vim.api.nvim_set_hl(0, group, { link = target })
  end

  h("Normal", { bg = bg, fg = norm })

  -- restore &background's value in case changing Normal changed &background
  -- (:help :hi-normal-cterm)
  if vim.o.background ~= background then
    vim.o.background = background
  end

  h("Cursor",  { bg = purple, fg = norm })
  h("Comment", { fg = bg_subtle, gui = "italic" })

  h("Constant", { fg = purple })
  link("Character", "Constant")
  link("Number",    "Constant")
  link("Boolean",   "Constant")
  link("Float",     "Constant")
  link("String",    "Constant")

  -- h("Identifier", { fg = colors.dark_blue })
  link("Identifier", "Normal")
  link("Function",   "Identifier")

  h("Statement", { fg = norm_subtle })
  link("Conditonal", "Statement")
  link("Repeat",     "Statement")
  link("Label",      "Statement")
  link("Keyword",    "Statement")
  link("Exception",  "Statement")

  h("Operator", { fg = norm, cterm = "bold", gui = "bold" })

  h("PreProc", { fg = norm_subtle })
  link("Include",   "PreProc")
  link("Define",    "PreProc")
  link("Macro",     "PreProc")
  link("PreCondit", "PreProc")

  h("Type", { fg = norm })
  link("StorageClass", "Type")
  link("Structure",    "Type")
  link("Typedef",      "Type")

  h("Special", { fg = norm_subtle, gui = "italic" })
  link("SpecialChar",    "Special")
  link("Tag",            "Special")
  link("Delimiter",      "Special")
  link("SpecialComment", "Special")
  link("Debug",          "Special")

  h("Underlined", { fg = norm, gui = "underline", cterm = "underline" })
  h("Ignore",     { fg = bg })
  h("Error",      { fg = colors.actual_white, bg = red, cterm = "bold" })
  h("Todo",       { fg = purple, gui = "underline", cterm = "underline" })
  h("SpecialKey", { fg = colors.light_green })
  h("NonText",    { fg = colors.medium_gray })
  h("Directory",  { fg = colors.dark_blue })
  h("ErrorMsg",   { fg = red })
  h("IncSearch",  { bg = yellow, fg = colors.light_black })
  h("Search",     { bg = colors.light_green, fg = colors.light_black })
  h("MoreMsg",    { fg = colors.medium_gray, cterm = "bold", gui = "bold" })
  link("ModeMsg", "MoreMsg")
  h("LineNr",       { fg = bg_subtle })
  h("CursorLineNr", { fg = purple, bg = bg_very_subtle })
  h("Question",     { fg = red })
  h("StatusLine",   { bg = bg_very_subtle })
  h("StatusLineNC", { bg = bg_very_subtle, fg = colors.medium_gray })
  h("VertSplit",    { bg = bg_very_subtle, fg = bg_very_subtle })
  h("Title",        { fg = colors.dark_blue })
  h("Visual",       { fg = norm, bg = visual })
  h("VisualNOS",    { bg = bg_subtle })
  h("WarningMsg",   { fg = yellow })
  h("WildMenu",     { fg = bg, bg = norm })
  h("Folded",       { fg = colors.medium_gray })
  h("FoldColumn",   { fg = bg_subtle })
  h("DiffAdd",      { fg = green })
  h("DiffDelete",   { fg = red })
  h("DiffChange",   { fg = colors.dark_yellow })
  h("DiffText",     { fg = colors.dark_blue })
  h("SignColumn",   { fg = colors.light_green })

  if vim.fn.has("gui_running") == 1 then
    h("SpellBad",   { gui = "underline", sp = red })
    h("SpellCap",   { gui = "underline", sp = colors.light_green })
    h("SpellRare",  { gui = "underline", sp = colors.pink })
    h("SpellLocal", { gui = "underline", sp = colors.dark_green })
  else
    h("SpellBad",   { cterm = "underline", fg = red })
    h("SpellCap",   { cterm = "underline", fg = colors.light_green })
    h("SpellRare",  { cterm = "underline", fg = colors.pink })
    h("SpellLocal", { cterm = "underline", fg = colors.dark_green })
  end

  h("Pmenu",      { fg = norm, bg = bg_subtle })
  h("PmenuSel",   { fg = norm, bg = purple })
  h("PmenuSbar",  { fg = norm, bg = bg_subtle })
  h("PmenuThumb", { fg = norm, bg = bg_subtle })
  h("TabLine",      { fg = norm, bg = bg_very_subtle })
  h("TabLineSel",   { fg = purple, bg = bg_subtle, gui = "bold", cterm = "bold" })
  h("TabLineFill",  { fg = norm, bg = bg_very_subtle })
  h("CursorColumn", { bg = bg_very_subtle })
  h("CursorLine",   { bg = bg_very_subtle })
  h("ColorColumn",  { bg = bg_subtle })

  h("MatchParen", { bg = bg_subtle, fg = norm })
  h("qfLineNr",   { fg = colors.medium_gray })

  h("htmlH1", { bg = bg, fg = norm })
  h("htmlH2", { bg = bg, fg = norm })
  h("htmlH3", { bg = bg, fg = norm })
  h("htmlH4", { bg = bg, fg = norm })
  h("htmlH5", { bg = bg, fg = norm })
  h("htmlH6", { bg = bg, fg = norm })

  -- Syntastic
  h("SyntasticWarningSign", { fg = yellow })
  h("SyntasticWarning",     { bg = yellow, fg = colors.black, gui = "bold", cterm = "bold" })
  h("SyntasticErrorSign",   { fg = red })
  h("SyntasticError",       { bg = red, fg = colors.white, gui = "bold", cterm = "bold" })

  -- Neomake
  link("NeomakeWarningSign", "SyntasticWarningSign")
  link("NeomakeErrorSign",   "SyntasticErrorSign")

  -- ALE
  link("ALEWarningSign", "SyntasticWarningSign")
  link("ALEErrorSign",   "SyntasticErrorSign")

  -- Signify, git-gutter
  link("SignifySignAdd",        "LineNr")
  link("SignifySignDelete",     "LineNr")
  link("SignifySignChange",     "LineNr")
  link("GitGutterAdd",          "LineNr")
  link("GitGutterDelete",       "LineNr")
  link("GitGutterChange",       "LineNr")
  link("GitGutterChangeDelete", "LineNr")

  local main_color

  if vim.o.background == "light" then
    main_color = "#212020"
  else
    main_color = "#dedede"
  end

  vim.api.nvim_set_hl(0, "CursorInsert", {
    bg = "#999999",
  })
  vim.opt.guicursor = {
    "n-v-c:block-Cursor",
    "i-ci-ve:ver50-CursorInsert",
  }
  vim.api.nvim_set_hl(0, "@keyword.return",             { bold = true })
  vim.api.nvim_set_hl(0, "@constant",                   { bold = true })
  vim.api.nvim_set_hl(0, "@function.builtin",           { bold = true })
  vim.api.nvim_set_hl(0, "@tag",                        { bold = true })
  vim.api.nvim_set_hl(0, "@variable",                   { fg=main_color, bold = true })
  vim.api.nvim_set_hl(0, "@function.call",              { fg=main_color, bold = true })
  vim.api.nvim_set_hl(0, "@function.method.javascript", { fg=main_color, bold = true })
  vim.api.nvim_set_hl(0, "@tag.builtin.tsx",            { fg=main_color, bold = true })
  vim.api.nvim_set_hl(0, "@variable.parameter",         { fg='#AF5FD7', bold = true })
  vim.api.nvim_set_hl(0, "@number",                     { fg='#AF5FD7', bold = true })
  vim.api.nvim_set_hl(0, "@variable.member",            { fg='#AF5FD7', bold = false })
  vim.api.nvim_set_hl(0, "@lsp.type.property.lua",      { fg='#AF5FD7', bold = false })
  vim.api.nvim_set_hl(0, "@type.javascript",            { fg='#AF5FD7', bold = false })
  vim.api.nvim_set_hl(0, "@string",                     { fg='#AF5FD7', bold = false, italic = true })
  vim.api.nvim_set_hl(0, "@Boolean",                    { fg='#AF5FD7', bold = false, italic=true })
  vim.api.nvim_set_hl(0, "@tag.attribute",              { bold = false })
  vim.api.nvim_set_hl(0, "@property.go",                { bold = false })
  vim.api.nvim_set_hl(0, "@operator",                   { bold = false , italic = true })
  vim.api.nvim_set_hl(0, "@type",                       { italic = true })
end

return M
