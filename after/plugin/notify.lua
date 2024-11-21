local notify = require("notify")

notify.setup({
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "simple",
    stages = "fade_in_slide_out",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
    },
    timeout = 500,
    top_down = true
})

vim.notify = notify
