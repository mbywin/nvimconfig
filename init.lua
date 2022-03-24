-- 基础配置
require("basic")
-- Packer插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置 （新增）
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
-- 增加 顶部标签页
require("plugin-config.bufferline")
-- 增加 底部信息栏
require("plugin-config.lualine")
-- 模糊查询工具
require("plugin-config.telescope")
-- dashboard配置
require("plugin-config.dashboard")
require("plugin-config.project")
-- 代码高亮
require("plugin-config.nvim-treesitter")

-- 内置LSP
require("lsp.setup")
require("lsp/cmp")
require("lsp/ui")

-- 复制到windows剪贴板
require("utils.fix-yank")

require("plugin-config.surround")

-- require("plugin-config.null-ls")
-- require("plugin-config.formatter")



































-- require("utils.change-colorscheme")
-- 输入法自动切换
-- require("utils.im-select")
-- 复制到windows剪贴板
require("utils.fix-yank")

--require("utils.global")
-- require("plugin-config.nvim-treesitter")
-- require("plugin-config.nvim-autopairs")
-- require("plugin-config.comment")
require("plugin-config.surround")
-- require("plugin-config.nvim-colorizer")
-- require("plugin-config.diffview")
-- require("plugin-config.indent-blankline")
-- require('plugin-config/feline')
-- require("plugin-config.toggleterm")
-- lua require('plugin-config/which-key')
-- gitsigns
-- require("plugin-config.gitsigns")
-- 

-- dap
-- require("plugin-config.dap")
-- require("plugin-config/rust-tools")
-- require("plugin-config.dap-install")
-- require("plugin-config.vimspector")
