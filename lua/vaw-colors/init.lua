local colors = {
  black = 16,
  blue = 33,
  blue_light = 39,
  blue_dark = 26,
  brown = 172,
  cyan = 51,
  cyan_dark = 37,
  green = 47,
  green_dark = 34,
  gray = 244,
  gray_dark = 235,
  gray_red = 203,
  magenta = 201,
  red = 196,
  violet = 165,
  white = 231,
  yellow = 226,
  yellow_dark = 220,
}
local common = {
  file = {
    add = 34,
    delete = colors.red,
    change = colors.blue_light,
    ignored = colors.gray,
    modified = colors.magenta,
  },
  errors = {
    light = colors.gray_red,
  },
  illuminate = colors.gray_dark,
  bufferline = {
    default = { ctermfg = colors.gray, ctermbg = colors.black, cterm = {} },
    selected = { ctermfg = colors.white, ctermbg = colors.black, cterm = { bold = true, } },
    visible = { ctermfg = colors.gray, ctermbg = colors.black, cterm = { bold = true, } },
  },
}

local theme = {}

local function set_groups()
  local groups = {
    LineNr                      = { ctermfg = colors.gray },
    SignColumn                  = { ctermfg = 14, ctermbg = colors.black },
    DapBreakpoint               = { ctermfg = colors.red },
    NonText                     = { ctermfg = colors.blue },
    Conceal                     = { ctermfg = colors.gray },
    Visual                      = { ctermbg = colors.gray },
    MatchParen                  = { ctermbg = colors.cyan_dark },
    Directory                   = { ctermfg = 159 },
    CursorLine                  = { cterm = { underline = true, } },

    DiagnosticOk                = { ctermfg = colors.green },
    DiagnosticHint              = { ctermfg = colors.gray },
    DiagnosticInfo              = { ctermfg = colors.blue },
    DiagnosticWarn              = { ctermfg = colors.yellow },
    DiagnosticError             = { ctermfg = colors.red },

    -- pmenu
    Pmenu                       = { ctermfg = colors.white, ctermbg = colors.gray_dark },
    PmenuSel                    = { ctermfg = colors.white, ctermbg = colors.blue },

    -- keywords
    PreProc                     = { ctermfg = colors.blue },
    Title                       = { ctermfg = colors.magenta },
    Identifier                  = { ctermfg = colors.cyan_dark, cterm = {} },
    Special                     = { ctermfg = colors.violet },
    StorageClass                = { ctermfg = colors.brown },
    Include                     = { link = "Statement" },
    Operator                    = { link = "Normal" },

    Statement                   = { ctermfg = colors.brown },
    Function                    = { ctermfg = colors.yellow_dark },
    Comment                     = { ctermfg = colors.cyan },
    Type                        = { ctermfg = colors.blue },
    LspInlayHints               = { ctermfg = colors.gray },

    -- data types
    Constant                    = { ctermfg = colors.magenta },
    String                      = { ctermfg = colors.green_dark },
    Character                   = { link = "String" },

    -- vimdiff
    DiffAdd                     = { ctermfg = colors.black, ctermbg = 65 },
    DiffChange                  = { ctermfg = colors.black, ctermbg = 67 },
    DiffDelete                  = { ctermfg = colors.black, ctermbg = 133 },
    DiffText                    = { ctermfg = colors.black, ctermbg = 251 },

    -- plugins:

    RainbowDelimiterBlue        = { ctermfg = colors.blue_dark },

    -- gitsigns
    GitSignsAdd                 = { ctermfg = common.file.add },
    GitSignsDelete              = { ctermfg = common.file.delete },
    GitSignsAddPreview          = { ctermfg = common.file.add },
    GitSignsDeletePreview       = { ctermfg = common.file.delete },
    GitSignsChange              = { ctermfg = common.file.change },

    -- illuminate
    IlluminatedWordText         = { ctermbg = common.illuminate },
    IlluminatedWordRead         = { ctermbg = common.illuminate },
    IlluminatedWordWrite        = { ctermbg = common.illuminate },

    -- nvim-tree
    NvimTreeFolderIcon          = { ctermfg = colors.blue_dark },
    NvimTreeRootFolder          = { ctermfg = colors.brown },
    NvimTreeSpecialFile         = { ctermfg = colors.brown },
    NvimTreeImageFile           = { ctermfg = colors.brown },
    NvimTreeWindowPicker        = { ctermfg = colors.black, ctermbg = colors.cyan },
    NvimTreeIndentMarker        = { ctermfg = colors.gray },

    NvimTreeGitNew              = { ctermfg = common.errors.light },
    NvimTreeGitDirty            = { ctermfg = common.errors.light },
    NvimTreeGitIgnored          = { ctermfg = common.file.ignored },

    NvimTreeGitRenamed          = { ctermfg = common.file.add },
    NvimTreeGitDeleted          = { ctermfg = common.file.delete },
    NvimTreeGitStaged           = { ctermfg = common.file.change },
    NvimTreeGitMerge            = { ctermfg = common.file.change },

    NvimTreeFileDirty           = { ctermfg = common.file.change },
    NvimTreeFileNew             = { ctermfg = common.file.add },
    NvimTreeModifiedFile        = { ctermfg = common.file.modified },

    -- bufferline
    BufferLineFill              = common.bufferline.default,
    BufferLineBackground        = common.bufferline.default,
    BufferLineIndicatorSelected = common.bufferline.selected,
    BufferLineIndicatorVisible  = common.bufferline.visible,

    BufferLineBufferSelected    = common.bufferline.selected,
    BufferLineBufferVisible     = common.bufferline.visible,

    BufferLineSeparator         = common.bufferline.default,
    BufferLineSeparatorSelected = common.bufferline.selected,
    BufferLineSeparatorVisible  = common.bufferline.visible,

    BufferLineModified          = { ctermfg = common.file.modified },
    BufferLineModifiedVisible   = { ctermfg = common.file.modified },
    BufferLineModifiedSelected  = { ctermfg = common.file.modified },

    BufferLineTab               = common.bufferline.default,
    BufferLineTabSelected       = common.bufferline.selected,
    BufferLineTabClose          = common.bufferline.selected,

    -- language specific
    ["@property.toml"]          = { link = "@type.toml" },
    ["@markup.heading"]         = { link = "Title" },
    ["@markup.list"]            = { link = "Statement" },
    ["@variable"]               = { ctermfg = colors.green },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function theme.colorscheme()
  vim.api.nvim_command("hi clear")

  vim.o.termguicolors = false
  vim.g.colors_name = "vaw-colors"

  set_groups()
end

return theme
