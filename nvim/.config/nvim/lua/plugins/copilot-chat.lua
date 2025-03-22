return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    opts = {
        system_prompt = 'You are very good at explaining codding',
    },
    keys = {
      {"<leader>cc", ":CopilotChat<CR>",mode="n",desc="Open Copilot Chat"},
      {"<leader>ce", ":CopilotChatExplain<CR>",mode="v",desc="Explain code"},
      {"<leader>cr", ":CopilotChatReview<CR>",mode="v",desc="Review code"},
      {"<leader>cf", ":CopilotChatFix<CR>",mode="v",desc="Fix code Issue"},
      {"<leader>co", ":CopilotChatOptimize<CR>",mode="v",desc="Optimize code"},
      {"<leader>cgd", ":CopilotChatDocs<CR>",mode="n",desc="Generate Docs"},
      {"<leader>cgt", ":CopilotChatTests<CR>",mode="n",desc="Generate Tests"},
      {"<leader>cgc", ":CopilotChatCommits<CR>",mode="n",desc="Generate Commit message"},
      {"<leader>cgc", ":CopilotChatCommits<CR>",mode="v",desc="Generate Commit message for selection"},
    },
  },
}
