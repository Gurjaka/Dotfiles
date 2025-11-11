local opts = { noremap = true, silent = true }

-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gf", vim.diagnostic.open_float, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "List TODOs (Telescope)" })
vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>", { desc = "List TODOs (Quickfix)" })
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeFocus<cr>", { desc = "Focus NvimTree" })

-- Run file
vim.keymap.set("n", "<leader>r", function()
	local file = vim.fn.expand("%:p")
	if file == "" then
		vim.notify("No file to run", vim.log.levels.ERROR)
		return
	end

	local filetype = vim.bo.filetype
	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local dir = vim.fn.expand("%:p:h")

	-- Define commands for different file types
	local commands = {
		-- By filetype
		python = "python3 " .. vim.fn.shellescape(filename),
		javascript = "node " .. vim.fn.shellescape(filename),
		typescript = "npx tsx " .. vim.fn.shellescape(filename),
		lua = "lua " .. vim.fn.shellescape(filename),
		zig = "zig run " .. vim.fn.shellescape(filename),
		rust = "cargo run",
		go = "go run " .. vim.fn.shellescape(filename),
		c = "gcc " .. vim.fn.shellescape(filename) .. " -o /tmp/output && /tmp/output",
		cpp = "g++ " .. vim.fn.shellescape(filename) .. " -o /tmp/output && /tmp/output",
		java = "javac " .. vim.fn.shellescape(filename) .. " && java " .. vim.fn.fnamemodify(filename, ":r"),
		sh = "bash " .. vim.fn.shellescape(filename),
		zsh = "zsh " .. vim.fn.shellescape(filename),
		ruby = "ruby " .. vim.fn.shellescape(filename),
		perl = "perl " .. vim.fn.shellescape(filename),
		php = "php " .. vim.fn.shellescape(filename),
		r = "Rscript " .. vim.fn.shellescape(filename),
		julia = "julia " .. vim.fn.shellescape(filename),
		dart = "dart " .. vim.fn.shellescape(filename),
		swift = "swift " .. vim.fn.shellescape(filename),
	}

	-- Fallback extension mapping
	local extension_commands = {
		py = "python3 " .. vim.fn.shellescape(filename),
		js = "node " .. vim.fn.shellescape(filename),
		ts = "npx tsx " .. vim.fn.shellescape(filename),
		lua = "lua " .. vim.fn.shellescape(filename),
		zig = "zig run " .. vim.fn.shellescape(filename),
		go = "go run " .. vim.fn.shellescape(filename),
		c = "gcc " .. vim.fn.shellescape(filename) .. " -o /tmp/output && /tmp/output",
		cpp = "g++ " .. vim.fn.shellescape(filename) .. " -o /tmp/output && /tmp/output",
		cc = "g++ " .. vim.fn.shellescape(filename) .. " -o /tmp/output && /tmp/output",
		java = "javac " .. vim.fn.shellescape(filename) .. " && java " .. vim.fn.fnamemodify(filename, ":r"),
		sh = "bash " .. vim.fn.shellescape(filename),
		rb = "ruby " .. vim.fn.shellescape(filename),
		pl = "perl " .. vim.fn.shellescape(filename),
		php = "php " .. vim.fn.shellescape(filename),
		r = "Rscript " .. vim.fn.shellescape(filename),
		jl = "julia " .. vim.fn.shellescape(filename),
		dart = "dart " .. vim.fn.shellescape(filename),
		swift = "swift " .. vim.fn.shellescape(filename),
	}

	-- Try filetype first, then extension
	local cmd = commands[filetype] or extension_commands[extension]

	if not cmd then
		vim.notify("No run command configured for filetype: " .. filetype .. " (." .. extension .. ")", vim.log.levels.WARN)
		return
	end

	vim.notify("Running " .. filename .. " (" .. filetype .. ")")

	-- Create floating window for terminal
	local width = math.ceil(vim.o.columns * 0.8)
	local height = math.ceil(vim.o.lines * 0.8)
	local row = math.ceil((vim.o.lines - height) / 2)
	local col = math.ceil((vim.o.columns - width) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		border = "rounded",
		title = " Running: " .. filename .. " ",
		title_pos = "center"
	})

	-- Change to file directory and run command
	vim.fn.termopen("cd " .. vim.fn.shellescape(dir) .. " && " .. cmd, {
		on_exit = function(_, exit_code)
			if exit_code == 0 then
				print("Process completed successfully")
			else
				print("Process exited with code: " .. exit_code)
			end
		end
	})
	vim.cmd("startinsert")

	-- Close with 'q' in normal mode
	vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
end, { desc = "Run current file in floating terminal" })
