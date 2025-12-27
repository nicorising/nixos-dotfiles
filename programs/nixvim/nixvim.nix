{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    enableMan = false; # Fix LSP package bug

    globals.mapleader = " ";
    diagnostic.settings.virtual_text = true;
    extraConfigLua = builtins.readFile ./config.lua;

    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      clipboard = "unnamedplus";
    };

    highlightOverride = {
      Todo = {
        fg = "#fabd2f";
        bg = "NONE";
        bold = true;
      };
    };

    plugins = {
      # Nerd font icons
      web-devicons.enable = true;

      # Language server protocol
      lsp = {
        enable = true;
        servers = {
          clojure_lsp.enable = true;
          texlab.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
        };
      };

      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "clojure"
          "latex"
          "lua"
          "nix"
          "python"
        ];
      };

      # Formatter
      conform-nvim = {
        enable = true;

        settings = {
          format_on_save.lsp_fallback = true;
          formatters_by_ft = {
            python = [ "ruff_format" ];
            nix = [ "nixfmt" ];
          };
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
        settings.pickers.find_files = {
          hidden = true;
          no_ignore = true;
        };
      };

      # File explorer panel
      neo-tree = {
        enable = true;

        settings = {
          log_level = "warn";
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
          numbers = "ordinal";
          diagnostics = "nvim_lsp";

          offsets = [
            {
              filetype = "neo-tree";
            }
          ];
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          start_in_insert = true;
          direction = "vertical";
          size = 60;
        };
      };

      # Easy commenting/uncommenting
      comment.enable = true;

      # Git modifications in the gutter
      gitsigns.enable = true;

      # LaTeX
      vimtex = {
        enable = true;
        texlivePackage = null;

        settings = {
          view_method = "zathura";
          compiler_method = "latexmk";
        };
      };

      # Lua for Neovim
      lazydev.enable = true;
    };

    colorschemes.gruvbox = {
      enable = true;

      settings = {
        contrast_dark = "dark";
        transparent_mode = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Move to left window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Move to right window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Move to lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Move to upper window";
      }

      # Neo-tree
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Toggle explorer";
      }

      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>lua FocusEditor()<CR><cmd>Telescope find_files<CR>";
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>lua FocusEditor()<CR><cmd>Telescope live_grep<CR>";
        options.desc = "Live grep";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>lua FocusEditor()<CR><cmd>Telescope oldfiles<CR>";
        options.desc = "Recent files";
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = "<cmd>lua FocusEditor()<CR><cmd>Telescope lsp_document_symbols<CR>";
        options.desc = "LSP symbols";
      }

      # Buffers
      {
        mode = "n";
        key = "<leader>1";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 1<CR>";
        options.desc = "Go to buffer 1";
      }
      {
        mode = "n";
        key = "<leader>2";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 2<CR>";
        options.desc = "Go to buffer 2";
      }
      {
        mode = "n";
        key = "<leader>3";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 3<CR>";
        options.desc = "Go to buffer 3";
      }
      {
        mode = "n";
        key = "<leader>4";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 4<CR>";
        options.desc = "Go to buffer 4";
      }
      {
        mode = "n";
        key = "<leader>5";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 5<CR>";
        options.desc = "Go to buffer 5";
      }
      {
        mode = "n";
        key = "<leader>6";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 6<CR>";
        options.desc = "Go to buffer 6";
      }
      {
        mode = "n";
        key = "<leader>7";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 7<CR>";
        options.desc = "Go to buffer 7";
      }
      {
        mode = "n";
        key = "<leader>8";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 8<CR>";
        options.desc = "Go to buffer 8";
      }
      {
        mode = "n";
        key = "<leader>9";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineGoToBuffer 9<CR>";
        options.desc = "Go to buffer 9";
      }
      {
        mode = "n";
        key = "<leader><";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineMovePrev<CR>";
        options.desc = "Move buffer left";
      }
      {
        mode = "n";
        key = "<leader>>";
        action = "<cmd>lua FocusEditor()<CR><cmd>BufferLineMoveNext<CR>";
        options.desc = "Move buffer right";
      }

      # Terminal
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>ToggleTerm direction=vertical size=60<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options.desc = "Exit terminal mode";
      }

      # Git
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options.desc = "Preview Git hunk";
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = "<cmd>Gitsigns reset_hunk<CR>";
        options.desc = "Reset Git hunk";
      }
    ];
  };
}
