vim.cmd[[source ~/.config/nvim/init_old.vim]]

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

  -- 如果 packer 自动安装，安装完后重新加载
  if packer_bootstrap then
    require('packer').sync()
  end
end)
