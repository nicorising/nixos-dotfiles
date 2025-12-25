{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    enableMan = false; # Fix LSP package bug
    extraConfigLuaFile = ./nvim/config.lua;

    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      termguicolors = true;
      background = "dark";
    };

    diagnostic.settings.virtual_text = true;

    globals.mapleader = " ";

    plugins = {
      # Nerd font icons
      web-devicons.enable = true;

      # Language server protocol
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          clojure_lsp.enable = true;
        };
      };

      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "python"
          "clojure"
        ];
      };

      # Formatter
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save.lsp_fallback = true;
          formatters_by_ft.python = [ "ruff_format" ];
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        settings.pickers.find_files.hidden = true;

        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fr" = "oldfiles";
          "<leader>fs" = "lsp_document_symbols";
        };
      };

      # File explorer panel
      neo-tree = {
        enable = true;

        settings = {
          close_if_last_window = true;

          filesystem = {
            filtered_items = {
              visible = true;
              hide_dotfiles = false;
              hide_gitignored = false;
            };

            follow_current_file.enabled = true;
          };
        };
      };

      # Buffers as tabs
      bufferline = {
        enable = true;

        settings.options = {
          diagnostics = "nvim_lsp";

          offsets = [
            {
              filetype = "neo-tree";
              text = "Explorer";
              highlight = "Directory";
            }
          ];
        };
      };
    };

    colorschemes.gruvbox = {
      enable = true;

      settings = {
        contrast_dark = "dark";
      };
    };
  };
}
