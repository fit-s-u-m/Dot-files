return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {}, -- Keep this empty or remove it since config is used
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css",
        "javascript",
        "html", -- Make sure "html" is treated as a string
        "javascriptreact", "typescript", "typescriptreact", 
      },
      user_default_options = { 
        mode = "background", -- Highlights background instead of text color
        css = true, -- Enable CSS color highlighting
        tailwind = true, -- Enable Tailwind color highlighting
        sass = { enable = true, parsers = { "css" } }, -- Enable for SASS
      },
    })
  end,
}

