vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Mofiqul/vscode.nvim'

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

  use {
	  "windwp/nvim-autopairs",
	  config = function() require("nvim-autopairs").setup {} end
  }
end)
