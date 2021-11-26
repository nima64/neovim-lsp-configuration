require 'packer'.startup(function() 
	use 'morhetz/gruvbox'
	use 'jiangmiao/auto-pairs' 
	use 'wbthomason/packer.nvim'

	use 'ray-x/lsp_signature.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip-integ'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'folke/trouble.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'folke/lsp-colors.nvim'
end)

vim.cmd [[
	set tabstop=4	" The width of a TAB is set to 4.
	set shiftwidth=4    " Indents will have a width of 4.

	set number 
	set softtabstop=4   " Sets the number of columns for a TAB. 
	set nowrap

	if has('linux')
		set termguicolors 
		let &t_ut='' "For kitty background color
	endif

	colorscheme gruvbox
	" set background=dark
	"colorscheme delek
	"set background=light
	set completeopt=menu,menuone,noselect
]]

require ('nvim-lspconfig')

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

require("lsp_signature").setup()

require'nvim-web-devicons'.setup {}

require ('trouble').setup{}

-- Change diagnostic symbols in the sing column(gutter)
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
