return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dim = {

      scope = {
    min_size = 5,
    max_size = 20,
    siblings = true,
  },
  -- animate scopes. Enabled by default for Neovim >= 0.10
  -- Works on older versions but has to trigger redraws during animation.
  ---@type snacks.animate.Config|{enabled?: boolean}
  animate = {
    enabled = vim.fn.has("nvim-0.10") == 1,
    easing = "outQuad",
    duration = {
      step = 20, -- ms per step
      total = 300, -- maximum duration
    },
  },
  -- what buffers to dim
  filter = function(buf)
    return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
  end,
    },
    dashboard = { 
      enabled = true,
      sections= {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },

      },
      preset = {
              header = [[
 .S_sSSs      sSSs   .S    S.     sSSs   .S_SsS_S.    .S   .S_SSSs     .S    S.  
.SS~YS%%b    d%%SP  .SS    SS.   d%%SP  .SS~S*S~SS.  .SS  .SS~SSSSS   .SS    SS. 
S%S   `S%b  d%S'    S%S    S%S  d%S'    S%S `Y' S%S  S%S  S%S   SSSS  S%S    S%S 
S%S    S%S  S%S     S%S    S%S  S%S     S%S     S%S  S%S  S%S    S%S  S%S    S%S 
S%S    S&S  S&S     S%S SSSS%S  S&S     S%S     S%S  S&S  S%S SSSS%S  S%S SSSS%S 
S&S    S&S  S&S_Ss  S&S  SSS&S  S&S_Ss  S&S     S&S  S&S  S&S  SSS%S  S&S  SSS&S 
S&S    S&S  S&S~SP  S&S    S&S  S&S~SP  S&S     S&S  S&S  S&S    S&S  S&S    S&S 
S&S    S&S  S&S     S&S    S&S  S&S     S&S     S&S  S&S  S&S    S&S  S&S    S&S 
S*S    S*S  S*b     S*S    S*S  S*b     S*S     S*S  S*S  S*S    S&S  S*S    S*S 
S*S    S*S  S*S.    S*S    S*S  S*S.    S*S     S*S  S*S  S*S    S*S  S*S    S*S 
S*S    S*S   SSSbs  S*S    S*S   SSSbs  S*S     S*S  S*S  S*S    S*S  S*S    S*S 
S*S    SSS    YSSP  SSS    S*S    YSSP  SSS     S*S  S*S  SSS    S*S  SSS    S*S 
SP                         SP                   SP   SP          SP          SP  
Y                          Y                    Y    Y           Y           Y   ]],
      },
    },
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
