local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 你的插件列表...
    use 'ayu-theme/ayu-vim'

   -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"
    })
    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}
    })
    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons"}
    })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    })
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })

    --------------------- LSP --------------------
    -- lspconfig
    use({"neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer"})
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use ("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- ui
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim" )

    -- surround
    -- use("blackCauldron7/surround.nvim")

    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({
      "ellisonleao/gruvbox.nvim",
      requires = {"rktjmp/lush.nvim"}
    })
    -- zephyr
    -- use("glepnir/zephyr-nvim")
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
    },
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
