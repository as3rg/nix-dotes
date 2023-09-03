return function(_, opts)
  local Rule = require('nvim-autopairs.rule')
  local npairs = require "nvim-autopairs"
  opts.ignored_next_char = [=[[%w%%%'%[%"%.%`]]=]
  npairs.setup(opts)
  npairs.add_rule(Rule("$","$","tex"))

  if not vim.g.autopairs_enabled then npairs.disable() end
  local cmp_status_ok, cmp = pcall(require, "cmp")
  if cmp_status_ok then
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = false })
  end
end
