set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "ruby", "rust", "typescript", "javascript", "go", "svelte", "html" },
  sync_install = true,
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

-- local hl = function(group, opts)
--     opts.default = true
--     vim.api.nvim_set_hl(0, group, opts)
-- end
-- 
-- -- Misc {{{
-- hl('@comment', {link = 'Comment'})
-- -- hl('@error', {link = 'Error'})
-- hl('@none', {bg = 'NONE', fg = 'NONE'})
-- hl('@preproc', {link = 'PreProc'})
-- hl('@define', {link = 'Define'})
-- hl('@operator', {link = 'Operator'})
-- -- }}}
-- 
-- -- Punctuation {{{
-- hl('@punctuation.delimiter', {link = 'Delimiter'})
-- hl('@punctuation.bracket', {link = 'Delimiter'})
-- hl('@punctuation.special', {link = 'Delimiter'})
-- -- }}}
-- 
-- -- Literals {{{
-- hl('@string', {link = 'String'})
-- hl('@string.regex', {link = 'String'})
-- hl('@string.escape', {link = 'SpecialChar'})
-- hl('@string.special', {link = 'SpecialChar'})
-- 
-- hl('@character', {link = 'Character'})
-- hl('@character.special', {link = 'SpecialChar'})
-- 
-- hl('@boolean', {link = 'Boolean'})
-- hl('@number', {link = 'Number'})
-- hl('@float', {link = 'Float'})
-- -- }}}
-- 
-- -- Functions {{{
-- hl('@function', {link = 'Function'})
-- hl('@function.call', {link = 'Function'})
-- hl('@function.builtin', {link = 'Special'})
-- hl('@function.macro', {link = 'Macro'})
-- 
-- hl('@method', {link = 'Function'})
-- hl('@method.call', {link = 'Function'})
-- 
-- hl('@constructor', {link = 'Special'})
-- hl('@parameter', {link = 'Identifier'})
-- -- }}}
-- 
-- -- Keywords {{{
-- hl('@keyword', {link = 'Keyword'})
-- hl('@keyword.function', {link = 'Keyword'})
-- hl('@keyword.operator', {link = 'Keyword'})
-- hl('@keyword.return', {link = 'Keyword'})
-- 
-- hl('@conditional', {link = 'Conditional'})
-- hl('@repeat', {link = 'Repeat'})
-- hl('@debug', {link = 'Debug'})
-- hl('@label', {link = 'Label'})
-- hl('@include', {link = 'Include'})
-- hl('@exception', {link = 'Exception'})
-- -- }}}
-- 
-- -- Types {{{
-- hl('@type', {link = 'Type'})
-- hl('@type.builtin', {link = 'Type'})
-- hl('@type.qualifier', {link = 'Type'})
-- hl('@type.definition', {link = 'Typedef'})
-- 
-- hl('@storageclass', {link = 'StorageClass'})
-- hl('@attribute', {link = 'PreProc'})
-- hl('@field', {link = 'Identifier'})
-- hl('@property', {link = 'Identifier'})
-- -- }}}
-- 
-- -- Identifiers {{{
-- hl('@variable', {link = 'Normal'})
-- hl('@variable.builtin', {link = 'Special'})
-- 
-- hl('@constant', {link = 'Constant'})
-- hl('@constant.builtin', {link = 'Special'})
-- hl('@constant.macro', {link = 'Define'})
-- 
-- hl('@namespace', {link = 'Include'})
-- hl('@symbol', {link = 'Identifier'})
-- -- }}}
-- 
-- -- Text {{{
-- hl('@text', {link = 'Normal'})
-- hl('@text.strong', {bold = true})
-- hl('@text.emphasis', {italic = true})
-- hl('@text.underline', {underline = true})
-- hl('@text.strike', {strikethrough = true})
-- hl('@text.title', {link = 'Title'})
-- hl('@text.literal', {link = 'String'})
-- hl('@text.uri', {link = 'Underlined'})
-- hl('@text.math', {link = 'Special'})
-- hl('@text.environment', {link = 'Macro'})
-- hl('@text.environment.name', {link = 'Type'})
-- hl('@text.reference', {link = 'Constant'})
-- 
-- hl('@text.todo', {link = 'Todo'})
-- hl('@text.note', {link = 'SpecialComment'})
-- hl('@text.warning', {link = 'WarningMsg'})
-- hl('@text.danger', {link = 'ErrorMsg'})
-- -- }}}
-- 
-- -- Tags {{{
-- hl('@tag', {link = 'Tag'})
-- hl('@tag.attribute', {link = 'Identifier'})
-- hl('@tag.delimiter', {link = 'Delimiter'})
-- -- }}}
-- 
EOF

