vim.cmd[[source ~/.vimrc]]

-- 只有在第一次启动时才自动安装 packer.nvim（可选）
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- packer 配置
require('packer').startup(function(use)
  -- 必须：这是 packer 的核心
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    config = function()
      -- vim.lsp.enable('tsserver')  -- 启用 tsserver
    end,
  }

    -- Required plugins
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  -- Optional dependencies
  use 'hrsh7th/nvim-cmp'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  use 'zbirenbaum/copilot.lua'
  use 'stevearc/dressing.nvim' -- for enhanced input UI
  use 'folke/snacks.nvim' -- for modern input UI

  -- Avante.nvim with build process
  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante').setup({
        behaviour = {
          auto_suggestions = false,  -- 启用自动建议功能
          auto_suggestions_respect_ignore = true,  -- 尊重.gitignore文件
        },
        mappings = {
          suggestion = {
            accept = "<c-l>",     -- 接受建议
            next = "<c-a>",       -- 下一个建议
            prev = "<c-b>",       -- 上一个建议
          }
        },
        -- model = 'openai',
        -- provider = "qianwen",
        provider = "copilot",
        providers = {
          qianwen = {
            __inherited_from = "openai",
            endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
            model = "qwen3-coder-plus",
            -- model = "gpt-4o-2024-11-20",
          },
          copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "gpt-4o-2024-11-20",
            proxy = nil, -- [protocol://]host[:port] Use this proxy
            allow_insecure = false, -- Allow insecure server connections
            timeout = 30000, -- Timeout in milliseconds
            context_window = 64000, -- Number of tokens to send to the model for context
            extra_request_body = {
              temperature = 0.75,
              max_tokens = 20480,
            },
          },
        },
      })
    end
  }

  -- 如果 packer 自动安装，安装完后重新加载
  if packer_bootstrap then
    require('packer').sync()
  end
end)
