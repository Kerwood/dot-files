local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node

ls.add_snippets("go", {
  s(
    { trig = "ife", desc = "If err not nil, return variable." },
    {
      t("if err != nil {"),
      t({ "", "\treturn " }),
      i(1),     -- cursor here
      t("err"), -- "err" stays after cursor
      t({ "", "}" }),
    }
  ),
})
