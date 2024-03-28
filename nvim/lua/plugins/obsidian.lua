return {
    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*",
    --     ft = "markdown",
    --     opts = {
    --         workspaces = {
    --             {
    --                 name = "personal",
    --                 path = "/home/eeay/vaults/personal",
    --             },
    --             {
    --                 name = "coding",
    --                 path = "~/vaults/coding",
    --             },
    --             {
    --                 name = "school",
    --                 path = "~/vaults/school",
    --             },
    --             {
    --                 name = "education",
    --                 path = "~/vaults/education",
    --             },
    --         },
    --         notes_subdir = "notes",
    --         log_level = vim.log.levels.INFO,
    --         daily_notes = {
    --             folder = "notes/dailies",
    --             date_format = "%d-%m-%y",
    --             alias_format = "%B %-d, %Y",
    --             template = nil,
    --         },
    --         completion = {
    --             nvim_cmp = true,
    --             min_chars = 2,
    --         },
    --         mappings = {
    --             -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    --             ["gf"] = {
    --                 action = function() return require("obsidian").util.gf_passthrough() end,
    --                 opts = { noremap = false, expr = true, buffer = true },
    --             },
    --             -- Toggle check-boxes.
    --             ["<leader>ch"] = {
    --                 action = function() return require("obsidian").util.toggle_checkbox() end,
    --                 opts = { buffer = true },
    --             },
    --         },
    --         new_notes_location = "current_dir",
    --         -- note_id_func = function(title)
    --         --     local suffix = ""
    --         --     if title ~= nil then
    --         --         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    --         --     else
    --         --         for _ = 1, 4 do
    --         --             suffix = suffix .. string.char(math.random(65, 90))
    --         --         end
    --         --     end
    --         --     return tostring(os.time()) .. "-" .. suffix
    --         -- end,
    --         -- note_path_func = function(spec)
    --         --     local path = spec.dir / tostring(spec.id)
    --         --     return path:with_suffix(".md")
    --         -- end,
    --         wiki_link_func = function(opts) return require("obsidian.util").wiki_link_id_prefix(opts) end,
    --         markdown_link_func = function(opts) return require("obsidian.util").markdown_link(opts) end,
    --         preferred_link_style = "markdown",
    --         image_name_func = function() return string.format("%s-", os.time()) end,
    --         disable_frontmatter = false,
    --         note_frontmatter_func = function(note)
    --             if note.title then note:add_alias(note.title) end
    --             local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    --             if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
    --                 for k, v in pairs(note.metadata) do
    --                     out[k] = v
    --                 end
    --             end
    --             return out
    --         end,
    --         templates = {
    --             -- subdir = "templates",
    --             -- date_format = "%D, %M %d %Y",
    --             -- time_format = "%H:%M",
    --             -- substitutions = {},
    --         },
    --         follow_url_func = function(url)
    --             vim.fn.jobstart({ "xdg-open", url }) -- linux
    --         end,
    --         use_advanced_uri = false,
    --         open_app_foreground = false,
    --         picker = {
    --             name = "telescope.nvim",
    --             mappings = {
    --                 new = "<C-n>",
    --                 insert_link = "<C-l>",
    --             },
    --         },
    --         sort_by = "modified",
    --         sort_reversed = true,
    --         open_notes_in = "current",
    --         -- callbacks = {
    --         --     post_setup = function(client) end,
    --         --     enter_note = function(client, note) end,
    --         --     leave_note = function(client, note) end,
    --         --     pre_write_note = function(client, note) end,
    --         --     post_set_workspace = function(client, workspace) end,
    --         -- },
    --
    --         ui = {
    --             enable = true,
    --             update_debounce = 100,
    --             checkboxes = {
    --                 -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
    --                 [" "] = { char = "", hl_group = "ObsidianTodo" },
    --                 ["x"] = { char = "", hl_group = "ObsidianDone" },
    --                 ["~"] = { char = "󰅗", hl_group = "ObsidianTilde" },
    --                 [">"] = { char = "", hl_group = "ObsidianRightArrow" },
    --             },
    --             bullets = { char = "•", hl_group = "ObsidianBullet" },
    --             external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    --             reference_text = { hl_group = "ObsidianRefText" },
    --             highlight_text = { hl_group = "ObsidianHighlightText" },
    --             tags = { hl_group = "ObsidianTag" },
    --             block_ids = { hl_group = "ObsidianBlockID" },
    --             hl_groups = {
    --                 ObsidianTodo = { bold = true, fg = "#f78c6c" },
    --                 ObsidianDone = { bold = true, fg = "#81C684" },
    --                 ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
    --                 ObsidianTilde = { bold = true, fg = "#ff5370" },
    --                 ObsidianBullet = { bold = true, fg = "#89ddff" },
    --                 ObsidianRefText = { underline = true, fg = "#c792ea" },
    --                 ObsidianExtLinkIcon = { fg = "#c792ea" },
    --                 ObsidianTag = { italic = true, fg = "#89ddff" },
    --                 ObsidianBlockID = { italic = true, fg = "#89ddff" },
    --                 ObsidianHighlightText = { bg = "#75662e" },
    --             },
    --         },
    --         attachments = {
    --             img_folder = "assets/imgs",
    --             img_text_func = function(client, path)
    --                 local link_path
    --                 local vault_relative_path = client:vault_relative_path(path)
    --                 if vault_relative_path ~= nil then
    --                     link_path = vault_relative_path
    --                 else
    --                     link_path = tostring(path)
    --                 end
    --                 local display_name = vim.fs.basename(link_path)
    --                 return string.format("![%s](%s)", display_name, link_path)
    --             end,
    --         },
    --     },
    -- },
    {
        "epwalsh/pomo.nvim",
        version = "*",
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat" },
        dependencies = {
            -- "rcarriga/nvim-notify",
        },
        config = function()
            require("pomo").setup({
                update_interval = 1000,
                notifiers = {
                    {
                        name = "Default",
                        opts = {
                            sticky = false,
                            title_icon = "󱎫",
                            text_icon = "󰄉",
                        },
                    },
                },
                timers = {},
            })
        end,
    },
}
