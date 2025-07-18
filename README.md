# Neovim Configuration

This is a modern Neovim configuration using lazy.nvim for plugin management.

## 🚀 Quick Start

1. Launch Neovim: `nvim`
2. Install language servers: `:Mason`
3. Check plugin status: `:Lazy`

## ⌨️ Key Mappings

### Leader Key
- **Leader**: `;` (semicolon)

### File Management
- **`<Ctrl-a>`** - Open file directory in floating window
- **`;e`** - Open file directory in floating window
- **`-`** - Open parent directory in current buffer

### Oil.nvim File Browser
When in oil.nvim buffer:
- **`<CR>`** - Open file or enter directory
- **`-`** - Go to parent directory
- **`<C-s>`** - Open file in vertical split
- **`<C-h>`** - Open file in horizontal split  
- **`<C-t>`** - Open file in new tab
- **`<C-p>`** - Preview file
- **`<C-c>`** - Close oil buffer
- **`<C-l>`** - Refresh directory
- **`g.`** - Toggle hidden files
- **`g?`** - Show help
- **`:w`** - Save changes (apply file operations like rename/delete)

### Search & Navigation
- **`;F`** - Find files (fzf-lua)
- **`;ff`** - Find files (fzf-lua)
- **`;fg`** - Live grep
- **`;fb`** - Find buffers
- **`;fh`** - Help tags
- **`;gg`** - Grep
- **`;gp`** - Grep project
- **`;h`** - Buffers
- **`;gb`** - Git branches

### Buffer Navigation
- **`<Tab>`** - Next buffer
- **`<Shift-Tab>`** - Previous buffer
- **`;l`** - Close other windows
- **`;q`** - Save and quit
- **`;w`** - Save

### Window Management
- **`<C-h>`** - Move to left window
- **`<C-j>`** - Move to bottom window
- **`<C-k>`** - Move to top window
- **`<C-l>`** - Move to right window

#### Window Resizing (Mac)
- **`∆`** (Alt-j) - Resize window down
- **`˚`** (Alt-k) - Resize window up
- **`¬`** (Alt-l) - Resize window left
- **`˙`** (Alt-h) - Resize window right

### Git Integration
- **`;gs`** - Git status
- **`;gb`** - Git blame

### Code Actions
- **`;f`** - Format file (Neoformat)
- **`gcc`** - Toggle comment line
- **`gc`** - Toggle comment (visual mode)

### Completion (blink.cmp)
- **`<Tab>`** - Select next completion item
- **`<Shift-Tab>`** - Select previous completion item
- **`<Up>`** / **`<Down>`** - Select next/previous completion item
- **`<Enter>`** - Accept selected completion item
- **`<C-y>`** - Accept selected completion item
- **`<C-Space>`** - Open completion menu or show docs if already open
- **`<C-e>`** - Hide completion menu
- **`<C-k>`** - Show/hide signature help

### Code Folding
- **`zR`** - Open all folds
- **`zM`** - Close all folds
- **`za`** - Toggle fold under cursor
- **`zA`** - Toggle fold recursively
- **`zo`** - Open fold under cursor
- **`zc`** - Close fold under cursor
- **`zj`** - Move to next fold
- **`zk`** - Move to previous fold

### Other Utilities
- **`;tn`** - Open terminal
- **`<Esc>`** - Exit terminal mode
- **`;<space>`** - Clear search highlights
- **`;cl`** - Copy file:line to clipboard
- **`;cg`** - Copy GitHub link to clipboard

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua        # Lazy.nvim bootstrap
│   │   ├── settings.lua    # Vim settings
│   │   ├── mappings.lua    # Key mappings
│   │   └── overrides.lua   # Language-specific settings
│   └── plugins/
│       ├── core.lua        # Core dependencies
│       ├── ui.lua          # UI and themes
│       ├── editor.lua      # Editor enhancements
│       ├── search.lua      # Search and fuzzy finding
│       ├── lsp.lua         # Language server support
│       ├── completion.lua  # Completion system (blink.cmp)
│       ├── copilot.lua     # AI assistance
│       └── treesitter.lua  # Syntax highlighting and folding
└── README.md               # This file
```

## 🔧 Plugin Management

### Installing Plugins
Plugins are automatically installed when you start Neovim.

### Managing Plugins
- **`:Lazy`** - Open lazy.nvim dashboard
- **`:Lazy update`** - Update all plugins
- **`:Lazy sync`** - Sync plugins (install missing, update existing)
- **`:Lazy clean`** - Remove unused plugins

### Language Server Management
- **`:Mason`** - Open Mason dashboard
- **`:MasonInstall <server>`** - Install language server
- **`:MasonUpdate`** - Update all language servers

## 🎨 Themes

Currently using **ayu** colorscheme. The theme loads automatically on startup.

## 📝 Notes

- Configuration is fully migrated to lazy.nvim for better performance
- All vim settings have been converted to lua for consistency
- Oil.nvim replaces NERDTree for file management
- FZF-lua is used for fuzzy finding
- Mason handles language server installation

## 🐛 Troubleshooting

If you encounter issues:
1. Check `:checkhealth` for diagnostics
2. Run `:Lazy sync` to sync plugins
3. Restart Neovim after configuration changes