local luasnip = require("luasnip")
local types = require "luasnip.util.types"

local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local sn = luasnip.snippet_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

luasnip.config.set_config({
	-- You can jump back into snippets of you leave them
	history = true,
	enable_autosnippets = true,
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " <---- CHOICE", "GruvboxPurpleBold" } },
				-- virt_text = { { " <---- CHOICE", "GruvboxAquaSign" } },
			},
		},
	}
})

luasnip.add_snippets("c", {
	-- Example of a main function snippet in C. Choice node for cmdline arguments
	s({
		trig = "main",
		name = "main",
		dscr = "A main function in C",
	}, fmt([[
	int main({}) {{
		{}
	}}]], {
		c(1, { t "int argc, char *argv[]", t "" }),
		i(2, "// main program")
	})),


})

luasnip.add_snippets("lua", {
	-- Example of a main function snippet in C. Choice node for cmdline arguments
	s("require", fmt([[local {} = require("{}")]], { f(function(import_name)
		-- Gives each part. Like `str.split()` in python
		local parts = vim.split(import_name[1][1], ".", true)
		return parts[#parts] or ""
	end, { 1 }), i(1, "modname") })),


})

luasnip.add_snippets("all", {
	s("rc", fmt([[
		const {} = ({}) => {{
			{}
		}}

		export default {};]],
		{
			d(1, function() return sn(nil, i(1, vim.fn.expand('%:t:r'))) end),
			i(2),
			i(3),
			f(function(argnodes) return argnodes[1][1] end, { 1 }),
		})),
})

require("luasnip.loaders.from_snipmate").load()
