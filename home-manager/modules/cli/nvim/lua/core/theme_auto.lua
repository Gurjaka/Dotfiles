local M = {}

-- Import the generated theme table (optional - remove if you don't want to use it)
local ok, theme_table = pcall(require, "core.theme_table")
if not ok or type(theme_table) ~= "table" then
	theme_table = nil
end

-- Path to your theme file
local theme_file = os.getenv("HOME") .. "/.cache/current_theme_nvim"

-- Current theme stored globally
vim.g.current_theme = vim.g.current_theme or ""

-- Safe function to set colorscheme
local function set_colorscheme(theme)
	-- If we have a theme table, look up the nvim colorscheme name
	local nvim_theme_name = theme
	if theme_table and theme_table[theme] then
		nvim_theme_name = theme_table[theme].nvim_name
		print("Using theme mapping: " .. theme .. " -> " .. nvim_theme_name)
	end

	local ok, err = pcall(vim.cmd, "colorscheme " .. nvim_theme_name)
	if ok then
		vim.g.current_theme = theme -- Store the original theme key
		print("Current theme: " .. theme .. (nvim_theme_name ~= theme and " (" .. nvim_theme_name .. ")" or ""))
	else
		print("Failed to set theme " .. nvim_theme_name .. ": " .. tostring(err))
	end
end

-- Reload theme from file
function M.reload()
	local f = io.open(theme_file, "r")
	if not f then return end
	local new_theme = f:read("*a"):gsub("^%s*(.-)%s*$", "%1")
	f:close()
	if new_theme ~= "" and new_theme ~= vim.g.current_theme then
		set_colorscheme(new_theme)
	end
end

-- Poll the theme file every second
vim.defer_fn(function()
	vim.loop.new_timer():start(1000, 1000, vim.schedule_wrap(function()
		M.reload()
	end))
end, 0)

-- Manual reload command
vim.api.nvim_create_user_command("ReloadTheme", function()
	M.reload()
end, {})

-- List available themes (if theme table is available)
vim.api.nvim_create_user_command("ListThemes", function()
	if theme_table then
		local theme_keys = vim.tbl_keys(theme_table)
		print("Available theme keys: " .. table.concat(theme_keys, ", "))
	end
	print("Available nvim colorschemes: " .. table.concat(vim.fn.getcompletion("", "color"), ", "))
end, {})

return M
