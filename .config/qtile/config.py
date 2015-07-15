from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.dgroups import simple_key_binder


# Autostart
#
import subprocess, re

def is_running(process):
    s = subprocess.Popen(["ps", "axw"], stdout=subprocess.PIPE)
    for x in s.stdout:
        if re.search(process, x):
            return True
    return False

def execute_once(process):
    if not is_running(process):
        return subprocess.Popen(process.split())

@hook.subscribe.startup
def startup():
    execute_once("setxkbmap -model abnt2 -layout br -variant abnt2")
    execute_once("synclient TapButton1=1")
    execute_once("feh --bg-scale imgs/wallhaven-214692.png")
    execute_once("/usr/libexec/polkit-gnome-authentication-agent-1")
    execute_once("xcompmgr")
    execute_once("start-pulseaudio-x11")
    execute_once("/usr/bin/xscreensaver -no-splash")


# Key Bindings
#
mod = "mod4"

keys = [
    Key(
        [mod], "k",
        lazy.layout.down()
    ),
    Key(
        [mod], "j",
        lazy.layout.up()
    ),

    Key(
        [mod, "control"], "k",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "control"], "j",
        lazy.layout.shuffle_up()
    ),

    Key(
        [mod], "space",
        lazy.layout.next()
    ),

    Key(
        [mod, "shift"], "space",
        lazy.layout.rotate()
    ),

    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split()
    ),
    
    Key(
        [mod], "Return", lazy.spawn("urxvt")
    ),

    Key(
        [mod], "b", lazy.spawn("firefox-bin")
    ),

    Key(
        [mod], "Tab", lazy.nextlayout()
    ),
    
    Key(
        [mod], "w", lazy.window.kill()
    ),

    Key(
        [mod, "control"], "r", lazy.restart()
    ),
    
    Key(
        [mod, "control"], "q", lazy.shutdown()
    ),

    Key(
        [mod], "r", lazy.spawncmd()
    ),
    
    Key(
        [], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")
    ),
    
    Key(
        [], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 5%- unmute")
    ),
    
    Key(
        [], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 5%+ unmute")
     ),
    
    Key(
        [], "XF86MonBrightnessUp", lazy.spawn("light -A 5")
    ),
    
    Key(
        [], "XF86MonBrightnessDown", lazy.spawn("light -U 5")
    ),
    
    Key(
        [], "XF86Sleep", lazy.spawn("pm-suspend-hybrid")
    )
]


# Workspaces
#
groups = [Group(i) for i in "12345"]

for i in groups:
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen())
    )

    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )


# Layout
#
layouts = [
    layout.Max(),
    layout.MonadTall(
        follow_max=True,
        margin=4
    ),
]


# Panel
#
widget_defaults = dict(
    #font='Inconsolata for Powerline',
    font='Terminus',
    fontsize=12
    #padding=1,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(
                    padding=4
                ),
                widget.TextBox(
                    "Network:",
                    padding=4
                ),
                widget.Net(
                    interface='wlan0'
                ),
                widget.sep.Sep(
                    linewidth=2,
                    padding=4,
                    foreground='000000',
                    height_percent=50
                ),
                widget.TextBox(
                    "Backlight:",
                    padding=4
                ),
                widget.Backlight(
                    backlight_name='intel_backlight'
                ),
                widget.sep.Sep(
                    linewidth=2,
                    padding=4,
                    foreground='000000',
                    height_percent=50
                ),
                widget.TextBox(
                    "Volume:",
                    padding=4
                ),
                widget.Volume(
                    cardid=1
                ),
                widget.sep.Sep(
                    linewidth=2,
                    padding=4,
                    foreground='000000',
                    height_percent=50
                ),
                widget.TextBox(
                    "Battery:",
                    padding=4
                ),
                widget.Battery(
                    format='{char} {percent:2.0%}'
                ),
                widget.sep.Sep(
                    linewidth=2,
                    padding=4,
                    foreground='000000',
                    height_percent=50
                ),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.sep.Sep(
                    linewidth=2,
                    padding=4,
                    foreground='000000',
                    height_percent=50
                ),
                #widget.Systray(),
            ],
            size=24,
            opacity=0.8
        ),
    ),
]


# Mouse
#
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


# Utils
#
dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True
wmname = "LG3D"
