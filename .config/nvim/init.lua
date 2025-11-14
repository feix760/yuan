vim.cmd[[source ~/.vimrc]]
-- 插件位置 ~/.local/share/nvim/site/pack/packer/start/
-- 将这个文件的fs模块去除

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

  -- Required plugins
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  -- Optional dependencies
  use 'hrsh7th/nvim-cmp'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  -- use 'zbirenbaum/copilot.lua'
  use 'stevearc/dressing.nvim' -- for enhanced input UI
  use 'folke/snacks.nvim' -- for modern input UI

  -- Avante.nvim with build process
  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante').setup({
        override_prompt_dir = function()
          -- Your logic to determine the prompt directory
          return vim.fn.expand("~/.config/nvim/templates")
        end,
        behaviour = {
          -- auto_suggestions = true,  -- 启用自动建议功能
          auto_suggestions_respect_ignore = true,  -- 尊重.gitignore文件
        },
        mappings = {
          toggle = {
            default = "<leader>at",
          },
        },
        provider = "qwen",
        -- provider = "copilot",
        providers = {
          qwen = {
            __inherited_from = "openai",
            endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
            model = "qwen3-coder-plus",
            api_key_name = "DASHSCOPE_API_KEY",
            -- proxy = 'http://127.0.0.1:8080',
          },
          copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "gpt-4o-2024-11-20",
            -- proxy = 'http://127.0.0.1:8080',
            allow_insecure = false, -- Allow insecure server connections
            timeout = 30000, -- Timeout in milliseconds
            context_window = 64000, -- Number of tokens to send to the model for context
            extra_request_body = {
              temperature = 0.75,
              max_tokens = 20480,
            },
          },
        },
        windows = {
          width = 40,
          input = {
            height = 12, -- Height of the input window in vertical layout
          },
          selected_files = {
            height = 12, -- Maximum height of the selected files window
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
