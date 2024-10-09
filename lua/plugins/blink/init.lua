return {
	'saghen/blink.cmp',
	enabled = false,
	lazy = false, -- lazy loading handled internally
	-- use a release tag to download pre-built binaries
	version = 'v0.*',
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',

	opts = {
		keymap = {
			show = '<C-space>',
			hide = '<C-l>',
			accept = '<cr>',
			select_prev = { '<Up>', '<C-e>' },
			select_next = { '<Down>', '<C-n>' },

			show_documentation = {},
			hide_documentation = {},
			scroll_documentation_up = '<C-b>',
			scroll_documentation_down = '<C-f>',

			snippet_forward = '<Tab>',
			snippet_backward = '<S-Tab>',
		},
		highlight = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = true,
		},
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = 'normal',

		-- experimental auto-brackets support
		-- accept = { auto_brackets = { enabled = true } },

		-- experimental signature help support
		trigger = { signature_help = { enabled = true } },
	},
}
