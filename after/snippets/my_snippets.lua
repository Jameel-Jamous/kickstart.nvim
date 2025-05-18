local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node

ls.add_snippets("lua", {
	s("beg", fmt(
	[[
	\begin{{{}}}
		{}
	\end{{{}}}
	]], 
	{i(1), i(0), rep(1)}
	))
})
