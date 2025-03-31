local function math()
  return vim.api.nvim_eval 'vimtex#syntax#in_mathzone()' == 1
end
local fmt = require('luasnip.extras.fmt').fmt

return {

  s({
    trig = '([a-zA-Z])(%w+)',
    name = 'auto subscript',
    regTrig = true,
    wordTrig = false,
    condition = math,
  }, {
    f(function(_, snip)
      return snip.captures[1]
    end),
    t '_{',
    f(function(_, snip)
      return snip.captures[2]
    end),
    t '}',
  }),

  s({
    trig = '(\\\\?[a-zA-Z]+|%w)sr',
    name = 'squared',
    priorirty = 1000,
    regTrig = true,
    snippetType = 'autosnippet',
    condition = math,
  }, {
    f(function(_, snip)
      return snip.captures[1]
    end),
    t '^2',
  }),

  s({
    trig = '(\\\\?[a-zA-Z]+)cb',
    name = 'cubed',
    priorirty = 1000,
    regTrig = true,
    snippetType = 'autosnippet',
    condition = math,
  }, {
    f(function(_, snip)
      return snip.captures[1]
    end),
    t '^3',
  }),

  s({
    trig = '(.+)_',
    name = 'auto subscript',
    priority = 1000,
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
    condition = math,
  }, {
    f(function(_, snip)
      return snip.captures[1]
    end),
    t '_{',
    i(1),
    t '}',
    i(0),
  }),

  s({
    trig = '(.+)^',
    name = 'auto superscript',
    priorirty = 1000,
    regTrig = true,
    snippetType = 'autosnippet',
    condition = math,
  }, {
    f(function(_, snip)
      return snip.captures[1]
    end),
    t '^{',
    i(1),
    t '}',
    i(0),
  }),

  s(
    'tkp',
    fmt(
      [[
   \begin{{center}}
     \begin{{tikzpicture}}
       \begin{{axis}}[
         axis lines = center,
         xlabel = {},
         ylabel = {},
         xmin = {},
         xmax = {},
         ymin = {},
         ymax = {},
         ]
        {}
        \end{{axis}}
      \end{{tikzpicture}}
    \end{{center}}
  ]],
      { i(1), i(2), i(3), i(4), i(5), i(6), i(7) }
    )
  ),

  s(
    'enumlab',
    fmt(
      [[
  \begin{{enumerate}}[label=(\alph*)]
    \item {}
  \end{{enumerate}}
  ]],
      { i(1) }
    )
  ),
}
