local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Setup
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- Colorscheme
	use("navarasu/onedark.nvim")

	-- Editing
	use("tpope/vim-surround") -- surround text objects
	use("terrortylor/nvim-comment") -- comment text objects
	use("Djancyp/better-comments.nvim") -- better comments

	-- File explorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- Status line
	use("nvim-lualine/lualine.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Copilot & ChatGPT
	use("github/copilot.vim")
	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- Managing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind-nvim") -- beautiful autocompletion

	-- Omnisharp
	use("OmniSharp/omnisharp-vim")

	-- Formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Indent blank lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Harpoon
	use("ThePrimeagen/harpoon")

	-- Game
	use("ThePrimeagen/vim-be-good")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
