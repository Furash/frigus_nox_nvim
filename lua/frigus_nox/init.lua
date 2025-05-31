local M = {}

-- Import required modules
local config = require('frigus_nox.config')
local p = require('frigus_nox.palette')
local utilities = require('frigus_nox.utilities')

-- Plugin setup functions
local function setup_lualine()
  local ok, lualine = pcall(require, 'lualine')
  if not ok then return end

  local highlights = require('frigus_nox.plugins.lualine')
  lualine.setup({
    highlights = highlights
  })
end

local function setup_bufferline()
  local ok, bufferline = pcall(require, 'bufferline')
  if not ok then return end

  local highlights = require('frigus_nox.plugins.bufferline')
  bufferline.setup({
    highlights = highlights
  })
end

local function set_highlights()
  local groups = {}
  for group, color in pairs(config.options.groups) do
    groups[group] = utilities.parse_color(color)
  end

  local highlights = {}
  local legacy_highlights = {
    ["@attribute.diff"] = { fg = p.yellow },
    ["@boolean"] = { link = "Boolean" },
    ["@class"] = { fg = p.green },
    ["@conditional"] = { link = "Conditional" },
    ["@field"] = { fg = p.green },
    ["@include"] = { link = "Include" },
    ["@interface"] = { fg = p.green },
    ["@macro"] = { link = "Macro" },
    ["@method"] = { fg = p.blue },
    ["@namespace"] = { fg = p.green },
    ["@number"] = { fg = p.white },
    ["@parameter"] = { fg = p.white, italic = true },
    ["@preproc"] = { link = "PreProc" },
    ["@punctuation"] = { fg = p.subtle },
    ["@punctuation.bracket"] = { fg = p.blue },
    ["@punctuation.delimiter"] = { fg = p.blue },
    ["@punctuation.special"] = { fg = p.blue },
    ["@regexp"] = { link = "String" },
    ["@repeat"] = { link = "Repeat" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@symbol"] = { fg = p.white },
    ["@text"] = { fg = p.white },
    ["@text.danger"] = { fg = groups.error },
    ["@text.diff.add"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
    ["@text.diff.delete"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
    ["@text.emphasis"] = { italic = true },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.math"] = { link = "Special" },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.strike"] = { strikethrough = true },
    ["@text.strong"] = { bold = true },
    ["@text.title"] = { link = "Title" },
    ["@text.title.1.markdown"] = { link = "markdownH1" },
    ["@text.title.1.marker.markdown"] = { link = "markdownH1Delimiter" },
    ["@text.title.2.markdown"] = { link = "markdownH2" },
    ["@text.title.2.marker.markdown"] = { link = "markdownH2Delimiter" },
    ["@text.title.3.markdown"] = { link = "markdownH3" },
    ["@text.title.3.marker.markdown"] = { link = "markdownH3Delimiter" },
    ["@text.title.4.markdown"] = { link = "markdownH4" },
    ["@text.title.4.marker.markdown"] = { link = "markdownH4Delimiter" },
    ["@text.title.5.markdown"] = { link = "markdownH5" },
    ["@text.title.5.marker.markdown"] = { link = "markdownH5Delimiter" },
    ["@text.title.6.markdown"] = { link = "markdownH6" },
    ["@text.title.6.marker.markdown"] = { link = "markdownH6Delimiter" },
    ["@text.underline"] = { underline = true },
    ["@text.uri"] = { fg = p.green, underline = true },
    ["@text.warning"] = { fg = groups.warn },
    ["@todo"] = { link = "Todo" },
  }

  local default_highlights = {
    ColorColumn = { bg = p.surface },
    Conceal = { bg = "NONE" },
    CurSearch = { fg = p.bg, bg = p.yellow },
    Cursor = { fg = p.white, bg = p.highlight_high },
    CursorColumn = { bg = p.surface },
    CursorLine = { bg = p.surface },
    CursorLineNr = { fg = p.subtle, bold = true },
    DiffAdd = { bg = p.green, blend = 20 },
    DiffChange = { bg = p.yellow, blend = 20 },
    DiffDelete = { bg = p.red, blend = 20 },
    DiffText = { bg = p.blue, blend = 40 },
    diffAdded = { link = "DiffAdd" },
    diffChanged = { link = "DiffChange" },
    diffRemoved = { link = "DiffDelete" },
    Directory = { fg = p.green, bold = true },
    ErrorMsg = { fg = p.red, bold = true },
    FloatBorder = { fg = p.white, bg = p.bg },
    FloatTitle = { fg = p.green, bg = groups.panel, bold = true },
    FoldColumn = { fg = p.grey },
    Folded = { fg = p.white, bg = groups.panel },
    IncSearch = { bg = p.green, fg = p.bg, bold = true },
    LineNr = { fg = p.muted },
    MatchParen = { fg = p.white, bg = p.green, bold = true },
    ModeMsg = { fg = p.grey },
    MoreMsg = { fg = p.blue },
    NonText = { fg = p.subtle },
    Normal = { fg = p.white, bg = p.bg },
    NormalFloat = { fg = p.white, bg = p.bg },
    NormalNC = { fg = p.white, bg = config.options.dim_inactive_windows and p._nc or p.bg },
    NvimInternalError = { link = "ErrorMsg" },
    Pmenu = { fg = p.white, bg = p.surface },
    PmenuExtra = { fg = p.grey, bg = groups.panel },
    PmenuExtraSel = { fg = p.grey, bg = p.grey },
    PmenuKind = { fg = p.green, bg = groups.panel },
    PmenuKindSel = { fg = p.grey, bg = p.grey },
    PmenuSbar = { bg = p.grey },
    PmenuSel = { fg = p.white, bg = p.overlay },
    PmenuThumb = { bg = p.muted },
    Question = { fg = p.yellow },
    QuickFixLine = { fg = p.green },
    RedrawDebugClear = { fg = p.bg, bg = p.yellow },
    RedrawDebugComposed = { fg = p.bg, bg = p.purple },
    RedrawDebugRecompose = { fg = p.bg, bg = p.blue },
    Search = { bg = p.blue, fg = p.bg, bold = true },
    SignColumn = { fg = p.white, bg = "NONE" },
    SpecialKey = { fg = p.green },
    SpellBad = { sp = p.grey, undercurl = true },
    SpellCap = { sp = p.grey, undercurl = true },
    SpellLocal = { sp = p.grey, undercurl = true },
    SpellRare = { sp = p.grey, undercurl = true },
    StatusLine = { fg = p.white, bg = p.bg },
    StatusLineNC = { fg = p.muted, bg = p.bg },
    StatusLineTerm = { fg = p.bg, bg = p.purple },
    StatusLineTermNC = { fg = p.bg, bg = p.purple, blend = 60 },
    Substitute = { link = "IncSearch" },
    TabLine = { fg = p.white, bg = p.bg },
    TabLineFill = { bg = p.bg },
    TabLineSel = { fg = p.white, bg = p.bg, bold = true },
    Title = { fg = p.white, bg = p.bg },
    VertSplit = { fg = p.grey },
    Visual = { bg = p.overlay },
    WarningMsg = { fg = p.yellow, bg=p.bg, bold = true },
    WildMenu = { link = "IncSearch" },
    WinBar = { fg = p.grey, bg = groups.panel },
    WinBarNC = { fg = p.grey, bg = groups.panel, blend = 60 },
    WinSeparator = { fg = p.grey },

    DiagnosticError = { fg = p.red },
    DiagnosticHint = { fg = p.blue },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticOk = { fg = groups.ok },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticDefaultError = { link = "DiagnosticError" },
    DiagnosticDefaultHint = { link = "DiagnosticHint" },
    DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
    DiagnosticDefaultOk = { link = "DiagnosticOk" },
    DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignOk = { link = "DiagnosticOk" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticUnderlineError = { sp = p.red, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.blue, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.blue, undercurl = true },
    DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true },
    DiagnosticVirtualTextError = { fg = p.red  },
    DiagnosticVirtualTextHint = { fg = p.blue  },
    DiagnosticVirtualTextInfo = { fg = p.blue  },
    DiagnosticVirtualTextOk = { fg = p.green, bg = groups.ok, blend = 50 },
    DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.yellow, blend = 50 },

    Boolean = { fg = p.white },
    Character = { fg = p.white },
    Comment = { fg = p.muted, italic = true },
    Conditional = { fg = p.blue, italic = true },
    Constant = { fg = p.white },
    Debug = { fg = p.blue },
    Define = { fg = p.blue },
    Delimiter = { fg = p.subtle },
    Error = { fg = p.blue },
    Exception = { fg = p.red },
    Float = { fg = p.white },
    Function = { fg = p.white },
    Identifier = { fg = p.white },
    Include = { fg = p.blue, italic = true },
    Keyword = { fg = p.blue, italic = true },
    Label = { fg = p.green },
    LspCodeLens = { fg = p.grey },
    LspCodeLensSeparator = { fg = p.grey },
    LspInlayHint = { fg = p.grey, bg = p.grey, blend = 10 },
    LspReferenceRead = { bg = p.grey },
    LspReferenceText = { bg = p.grey },
    LspReferenceWrite = { bg = p.grey },
    Macro = { fg = p.blue },
    Number = { fg = p.white },
    Operator = { fg = p.white },
    PreCondit = { fg = p.blue },
    PreProc = { link = "PreCondit" },
    Repeat = { fg = p.blue, italic = true },
    Special = { fg = p.blue },
    SpecialChar = { link = "Special" },
    SpecialComment = { fg = p.blue },
    Statement = { fg = p.blue, italic = true, bold = true },
    StorageClass = { fg = p.green },
    String = { fg = p.green },
    Structure = { fg = p.subtle },
    Tag = { fg = p.blue },
    Todo = { fg = p.blue, bg = p.blue, blend = 20 },
    Type = { fg = p.white },
    TypeDef = { link = "Type" },
    Underlined = { fg = p.blue, underline = true },

    healthError = { fg = p.red },
    healthSuccess = { fg = p.blue },
    healthWarning = { fg = p.yellow },

    htmlArg = { fg = p.blue },
    htmlBold = { bold = true },
    htmlEndTag = { fg = p.subtle },
    htmlH1 = { link = "markdownH1" },
    htmlH2 = { link = "markdownH2" },
    htmlH3 = { link = "markdownH3" },
    htmlH4 = { link = "markdownH4" },
    htmlH5 = { link = "markdownH5" },
    htmlItalic = { italic = true },
    htmlLink = { fg = p.green, underline = true },
    htmlTag = { fg = p.subtle },
    htmlTagN = { fg = p.white },
    htmlTagName = { fg = p.blue },

    markdownDelimiter = { fg = p.subtle },
    markdownH1 = { fg = p.blue, bold = true },
    markdownH1Delimiter = { link = "markdownH1" },
    markdownH2 = { fg = p.blue, bold = true },
    markdownH2Delimiter = { link = "markdownH2" },
    markdownH3 = { fg = p.blue, bold = true },
    markdownH3Delimiter = { link = "markdownH3" },
    markdownH4 = { fg = p.blue, bold = true },
    markdownH4Delimiter = { link = "markdownH4" },
    markdownH5 = { fg = p.blue, bold = true },
    markdownH5Delimiter = { link = "markdownH5" },
    markdownH6 = { fg = p.blue, bold = true },
    markdownH6Delimiter = { link = "markdownH6" },
    markdownUrl = { fg = p.green, underline = true },

    -- IBL highlights
    SnacksIndent1 = { fg = p.muted },
    SnacksIndent2 = { fg = p.muted },
    SnacksIndent3 = { fg = p.muted },
    SnacksIndent4 = { fg = p.muted },
    SnacksIndent5 = { fg = p.muted },
    SnacksIndent6 = { fg = p.muted },
    SnacksIndent7 = { fg = p.muted },

    -- Bufferline highlights
    BufferLineDevIconLua = { bg = p.bg },
    BufferLineDevIconLuaActive = { fg = p.green, bg = p.bg },
    BufferLineDevIconJSON = { bg = p.bg },
    BufferLineDevIconJSONActive = { fg = p.green, bg = p.bg },
    BufferLineDevIconPy = { bg = p.bg },
    BufferLineDevIconPyActive = { fg = p.green, bg = p.bg },
    BufferLineDevIconTxt = { bg = p.bg },
    BufferLineDevIconTxtActive = { fg = p.green, bg = p.bg },
    BufferLineDevIconDefault = { bg = p.bg },
    BufferLineDevIconDefaultActive = { fg = p.green, bg = p.bg },
    BufferLineDevIconLuaInactive = { fg = p.grey, bg = p.bg },
    BufferLineDevIconLuaVisible = { fg = p.grey, bg = p.bg },

    --Snacks dashboard
    SnacksDashboardDesc = { fg = p.white },
  }

  highlights = vim.tbl_extend("force", highlights, legacy_highlights)
  highlights = vim.tbl_extend("force", highlights, default_highlights)

  for group, highlight in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, highlight)
  end
end

function M.setup(opts)
  config.setup(opts)
  set_highlights()
  
  -- Setup plugins if they exist
  setup_lualine()
  setup_bufferline()
end

return M 