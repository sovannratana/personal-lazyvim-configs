return {
  {
    "3rd/image.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },

      -- Add these lines to handle Lua requirements
      rocks = {
        enabled = true,
        hererocks = true, -- This will auto-install the correct Lua version
        auto_install = true,
      },
    },
    build = function()
      -- Ensure the build process completes
      vim.fn.system("luarocks --local --lua-version=5.1 install magick")
    end,
  },
}
