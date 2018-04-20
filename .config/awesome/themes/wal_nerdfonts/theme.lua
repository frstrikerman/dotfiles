local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os = { getenv = os.getenv }
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local pywal = require ("themes.wal_nerdfonts.pywal")
local nerdfonts = require ("themes.wal_nerdfonts.nerd-fonts")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local theme                                     = {}
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/wal_nerdfonts"
theme.wallpaper                                 = pywal.wallpaper
theme.font                                      = "Arimo Nerd Font 11"
theme.fg_normal                                 = pywal.special.foreground
theme.fg_focus                                  = pywal.special.foreground
theme.fg_urgent                                 = pywal.special.foreground
theme.bg_normal                                 = pywal.special.background
theme.bg_focus                                  = pywal.colors.color2
theme.bg_urgent                                 = pywal.colors.color1
theme.border_width                              = dpi(1)
theme.border_normal                             = pywal.colors.color4
theme.border_focus                              = pywal.colors.color5
theme.border_marked                             = pywal.colors.color6
theme.tasklist_bg_focus                         = pywal.colors.color0
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.titlebar_close_button = "true"
theme.menu_height                               = dpi(15)
theme.menu_width                                = dpi(100)
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 0
-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"
-- You can use your own layout icons like this:
-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
calendaricon = wibox.widget.textbox(nerdfonts.font_awesome.calendar)
calendaricon.font = theme.font
theme.cal = lain.widget.calendar({
    attach_to = { clock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
local mailicon = wibox.widget.textbox(nerdfonts.font_awesome.envelope)
mailicon.font = theme.font
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
local mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "$(pass show passwd/Windows/",
    settings = function()
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon.text = nerdfonts.font_awesome.envelope
        else
            widget:set_text("") 
            mailicon.markup = markup.font(theme.font, markup(pywal.colors.color1, nerdfonts.font_awesome.envelopg) .. title)
        end
    end
})
--]]

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
mpdicon = wibox.widget.textbox(nerdfonts.font_awesome.music .. " ")
mpdicon.font = theme.font
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        awful.spawn.with_shell("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        awful.spawn.with_shell("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        awful.spawn.with_shell("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
	    mpdicon.text = nerdfonts.font_awesome.play
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
	    mpdicon.text = nerdfonts.font_awesome.pause
        else
            artist = ""
            title  = ""
	    mpdicon.text = nerdfonts.font_awesome.music
        end
	mpdicon.text = mpdicon.text .. " "	mpdicon.text = mpdicon.text .. " "
        widget:set_markup(markup.font(theme.font, markup(pywal.colors.color5, artist) .. title))
    end
})

-- MEM
local memicon = wibox.widget.textbox(nerdfonts.font_awesome.microchip)
memicon.font = theme.font
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.textbox(nerdfonts.font_awesome.microchip)
cpuicon.font = theme.font
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.textbox(nerdfonts.font_awesome.thermometer_half)
tempicon.font = theme.font
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
local fsicon = wibox.widget.textbox(nerdfonts.font_awesome.hdd_o)
fsicon.font = theme.font
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.font },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/home"].percentage .. "% "))
    end
})

-- Battery
local baticon = wibox.widget.textbox(nerdfonts.font_awesome.battery)
baticon.font = theme.font
local bat = lain.widget.bat({
    batteries = "BAT*",
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC "))
                baticon.text = nerdfonts.font_awesome.plug
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon.text = nerdfonts.font_awesome.battery_empty 
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon.text = nerdfonts.font_awesome.battery_quarter
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 50 then
                baticon.text = nerdfonts.font_awesome.battery_half
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 75 then
                baticon.text = nerdfonts.font_awesome.battery_threequarter
          else
              baticon.text = nerdfonts.font_awesome.battery_full
          end
          widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
      else
          widget:set_markup(markup.font(theme.font, " AC "))
    baticon.text = nerdfonts.font_awesome.plug
      end
  end
})
local volicon = wibox.widget.textbox(nerdfonts.octicons.mute)
volicon.font = theme.font
theme.volume = lain.widget.alsa({
  channel = "Master",
  settings = function()
      if volume_now.status == "off" then
    volicon.text = nerdfonts.octicons.mute
      elseif tonumber(volume_now.level) == 0 then
    volicon.text = nerdfonts.font_awesome.volume_off
      elseif tonumber(volume_now.level) <= 50 then
    volicon.text = nerdfonts.font_awesome.volume_down
      else
    volicon.text = nerdfonts.font_awesome.volume_up
      end

      widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
  end
})

-- Net
local neticon = wibox.widget.textbox(nerdfonts.font_awesome.sitemap)
neticon.font = theme.font
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup(pywal.colors.color5, " " .. net_now.received)
                          .. " " ..
                          markup(pywal.colors.color14, " " .. net_now.sent .. " ")))
    end
})

local mykeyboardlayout = awful.widget.keyboardlayout()
local keyboardIcon = wibox.widget.textbox(nerdfonts.octicons.keyboard)
keyboardIcon.font = theme.font
-- Separators
local spr     = wibox.widget.textbox(' ')

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 18, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
	    spr,
	    keyboardIcon,
	    mykeyboardlayout,
            spr,
            mpdicon,
            theme.mpd.widget,
            volicon,
            theme.volume.widget,
            mailicon,
            --mail.widget,
            memicon,
            mem.widget,
            cpuicon,
            cpu.widget,
            tempicon,
            temp.widget,
            fsicon,
            theme.fs.widget,
            baticon,
            bat.widget,
            neticon,
            net.widget,
	    calendaricon,
            clock,
            spr,
            s.mylayoutbox,
        },
    }
end

return theme
