local template = require("leetcode.config.template")

---@type lc.Question[]
_Lc_questions = {}

---@type lc-menu
_Lc_Menu = {} ---@diagnostic disable-line

---@class lc.Settings
local config = {
    default = template,
    user = template,

    name = "leetcode.nvim",
    domain = "https://leetcode.com",
    debug = false,
    lang = "cpp",
    sql = "mysql",
    home = {}, ---@type Path

    langs = require("leetcode.config.langs"),
    icons = require("leetcode.config.icons"),

    ---@diagnostic disable-next-line
    auth = {}, ---@type lc.UserStatus
}

---Merge configurations into default configurations and set it as user configurations.
---
---@param cfg lc.UserConfig Configurations to be merged.
function config.apply(cfg)
    config.user = vim.tbl_deep_extend("force", config.default, cfg)

    config.debug = config.user.debug or false ---@diagnostic disable-line
    config.domain = "https://leetcode." .. config.user.domain

    config.is_cn = config.user.domain == "cn"

    config.lang = config.user.lang
    config.sql = config.user.sql
end

return config
