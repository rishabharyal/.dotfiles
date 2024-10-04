--[[ function ColorIt(color)
	color = color or  "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end ]]


-- Check system theme and set Neovim theme accordingly

local function set_theme_based_on_system()
    -- This command checks for dark mode on macOS
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    -- Trim newline character from the result
    result = result:gsub("%s+", "")

    -- local mode = "light"
    -- local scheme = "tokyonight-day"

    -- if result == "Dark" then
        -- mode = "dark"
        scheme = "tokyonight-night"
    -- end

    -- vim.cmd("set background=" .. mode)
    vim.cmd("colorscheme " .. scheme)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

set_theme_based_on_system()
