-- https://github.com/HakonHarnes/img-clip.nvim

return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {

      -- file and directory options
      dir_path = function()
        return vim.fn.expand("%:t:r") .. "-img"
      end,
      -- extension = "avif", ---@type string
      extension = "webp", ---@type string
      -- extension = "png", ---@type string
      file_name = "%Y-%m-%d-at-%H-%M-%S", ---@type string
      -- expands dir_path to an absolute path
      use_absolute_path = false, ---@type boolean
      -- make dir_path relative to current file rather than the cwd
      relative_to_current_file = true, ---@type boolean

      -- prompt options
      prompt_for_file_name = false, ---@type boolean

      -- image options
      -- Notice that I HAVE to convert the images to the desired format
      -- If you don't specify the output format, you won't see the size decrease
      --
      -- process_cmd = "convert - -quality 75 avif:-", ---@type string
      process_cmd = "convert - -quality 75 webp:-", ---@type string
      -- process_cmd = "convert - -quality 75 png:-", ---@type string
      -- process_cmd = "convert - -resize 75 jpg:-", ---@type string
      --
      -- process_cmd = "convert - -quality 85 -resize 50% png:-", ---@type string
      --
      -- Want to understand why I used the parameters below?
      -- https://stackoverflow.com/a/27269260
      --
      -- -depth value
      -- Color depth is the number of bits per channel for each pixel. For
      -- example, for a depth of 16 using RGB, each channel of Red, Green, and
      -- Blue can range from 0 to 2^16-1 (65535). Use this option to specify
      -- the depth of raw images formats whose depth is unknown such as GRAY,
      -- RGB, or CMYK, or to change the depth of any image after it has been read.
      --
      -- compression-filter (filter-type)
      -- compression level, which is 0 (worst but fastest compression) to 9 (best but slowest)
      -- process_cmd = "convert - -depth 24 -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 png:-",
      --
      -- This is for jpegs
      -- process_cmd = "convert - -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace RGB -quality 70 jpg:-",
      -- process_cmd = "convert - -strip -interlace Plane -gaussian-blur 0.05 -quality 70 jpg:-",
      --
    },

    -- filetype specific options
    filetypes = {
      markdown = {
        -- encode spaces and special characters in file path
        url_encode_path = true, ---@type boolean
        -- template = "![$CURSOR]($FILE_PATH)", ---@type string
        -- template = "![Image]($FILE_PATH)", ---@type string
        template = "![$FILE_NAME]($FILE_PATH)", ---@type string
        download_images = false, ---@type boolean
      },
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>v", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}