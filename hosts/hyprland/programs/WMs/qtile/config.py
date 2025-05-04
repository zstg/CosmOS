#!/usr/bin/env python
# coding=utf-8

#############################################################################################
#  NOTE: needs AUR packages called "light" (to adjust screen brightness) and "qtile-extras" #
#############################################################################################
# I use   btw

# Super-ctrl-q edits qtile config
# Super-ctrl-s edits shortcuts

from libqtile import qtile
import os
# import re # Unnecessary imports
# import socket
import subprocess
# from typing import List  # noqa: F401
from libqtile import layout, bar, widget, hook
from libqtile.config import Drag, Group, Key, Match, Screen # Click,Rule
from libqtile.command import lazy
from libqtile import extension
from psutil import Process
# from libqtile.widget import Spacer
# from qtile_extras.widget import CurrentLayoutIcon

#mod4 or mod = super key
mod = "mod4"
mod1 = "alt"
mod2 = "control"
home = os.path.expanduser('~')
myTerm = "wezterm"
myBrowser = "qutebrowser"
myEditor = "emacsclient -nc" #"lvim-qt"

# WINDOW SWALLOWING
@hook.subscribe.client_new
def _swallow(window):
    pid = window.window.get_net_wm_pid()
    ppid = Process(pid).ppid()
    cpids = {c.window.get_net_wm_pid(): wid for wid, c in window.qtile.windows_map.items()}
    for i in range(5):
        if not ppid:
            return
        if ppid in cpids:
            parent = window.qtile.windows_map.get(cpids[ppid])
            parent.minimized = True
            window.parent = parent
            return
        ppid = Process(ppid).ppid()

@hook.subscribe.client_killed
def _unswallow(window):
    if hasattr(window, 'parent'):
        window.parent.minimized = False

@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

keys = [
# Most of the keybindings are in the  sxhkdrc file - except these

Key([mod], "r", lazy.run_extension(extension.DmenuRun(
        dmenu_command = 'dmenu_run -i -l 12',
        dmenu_prompt = 'Run:',
        dmenu_font = 'JetBrainsMono Nerd Font-16',
        # fontsize = 100,
        background = '282c34',
        foreground = '61afef',
        selected_background = '3e4452',
        selected_foreground = '97c277',
        ignore_case = True,
        ))),
# SUPER + FUNCTION KEYS

    Key([mod], "f", lazy.window.toggle_fullscreen(),desc='Toggle Fullscreen'),
    Key([mod], "q", lazy.window.kill(),desc='Close focussed window'),
# SUPER + SHIFT KEYS
    Key([mod, "shift"], "q", lazy.window.kill(),desc='Close focussed window'),
    Key([mod, "shift"], "r", lazy.restart(),desc='Restart QTile'),
#    Key([mod1], "r", lazy.restart(),desc='Restart QTile'),


# QTILE LAYOUT KEYS
    Key([mod], "n", lazy.layout.normalize(),desc='Reset window sizes to default'),
    Key([mod], "space", lazy.next_layout(),desc='Switch to next layout'),

# CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

# RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod], "j",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "k",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up(),
        desc='Move windows up in current stack'
        ),
    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod], "f",
         lazy.window.toggle_fullscreen(),
         desc='toggle fullscreen'
         ),

# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

# FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),

# MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
    ]

def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i - 1)

def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i + 1)
keys.extend([
    # MOVE WINDOW TO NEXT SCREEN
    Key([mod,"shift"], "Right", lazy.function(window_to_next_screen, switch_screen=True)),
    Key([mod,"shift"], "Left", lazy.function(window_to_previous_screen, switch_screen=True)),

])

groups = []

# FOR QWERTY KEYBOARDS
# group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",]

#group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0",]
# group_labels = ["", "", "", "", "", "", "", "", "", "",]
#group_labels = ["Web", "Edit/chat", "Image", "Gimp", "Meld", "Video", "Vb", "Files", "Mail", "Music",]

# groups = [Group("DEV", layout='monadtall', matches = [Match]),
          # Group("WWW", layout='monadtall'),
          # Group("SYS", layout='monadtall'),
          # Group("DOC", layout='monadtall'),
          # Group("VBOX", layout='monadtall'),
          # Group("CHAT", layout='monadtall'),
          # Group("MUS", layout='monadtall'),
          # Group("WEB", layout='monadtall'),
          # Group("MISC",layout='floating')]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

group_names = ["1","2","3","4","5"]
# group_labels = ["DEV","WEB","MISC"]
group_labels = ["\u03B1","\u03B2","\u03B3","\u03B4","\u03B5"]
# group_labels = ["A","B","C","D","E"]
group_layouts = ["max","monadtall","monadtall","floating","ratiotile"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([

# CHANGE WORKSPACES
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "shift" ], "Tab", lazy.screen.prev_group()),
        Key(["mod1"], "Tab", lazy.screen.next_group()),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),

# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
        Key([mod, "control"], i.name, lazy.window.togroup(i.name)),
# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])

def init_layout_theme():
    return {"margin":12,
            "border_width":2,
            "border_focus": "#61afef",#5e81ac
            "border_normal": "#4c566a"
            }

layout_theme = init_layout_theme()

layouts = [
    layout.MonadTall(**layout_theme), #(margin=12, border_width=2, border_focus="#61afef", border_normal="#4c566a"),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a"),
    # layout.MonadWide(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme)
]

# COLORS FOR THE BAR
#Theme name : ArcoLinux Default
# def init_colors():


def init_colors():
    return [["#282c34", "#282c34"], # colour 0
            ["#1c1f24", "#1c1f24"], # colour 1
            ["#dfdfdf", "#dfdfdf"], # colour 2
            ["#ff6c6b", "#ff6c6b"], # colour 3
            ["#98be65", "#98be65"], # colour 4
            ["#da8548", "#da8548"], # colour 5
            ["#51afef", "#51afef"], # colour 6
            ["#c678dd", "#c678dd"], # colour 7
            ["#46d9ff", "#46d9ff"], # colour 8
            ["#a9a1e1", "#a9a1e1"]] # colour 9

''' OneDark Colours
red = ff7a85
blue = 61afef
green = 97c277
black = 282c34
yellow = e4bf7a
purple = c678dd
grey = 3e4452
'''
colors = init_colors()

# WIDGETS FOR THE BAR
# Stuff below till line _ are ArcoLinux defaults
def init_widgets_defaults():
    return dict(font="FontAwesome",
                fontsize = 24,
                padding = -1,
                background=colors[2])

widget_defaults = init_widgets_defaults()

def init_widgets_list():
    widgets_list = [
             widget.Sep(
                       linewidth = 0,
                       padding = 4,
                       foreground = colors[0],
                       background = colors[0]
                       ),
              # widget.Wallpaper(
              #     random_selection = False,
              #     max_chars = 0,
              #     label='', # who wants an ugly <wallpaper_name>.jpg ?
              #     option='fill',
              #     # wallpaper='/usr/share/backgrounds/arcolinux/time-abstract.jpg'
              #     wallpaper = '/home/stig/.config/qtile/wallpapers/0239.jpg', #0239  #3155434 # 2899099  # the avif thing # cool.jpg # 347250 975999.png # 1006253.jpg
              #     # wallpaper = '/home/stig/Pictures/3155434.jpg'
              #     # wallpaper = '/home/stig/Pictures/2899099.jpg'
              #     ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[0]
                       ),
              widget.Image(
                       filename = "~/.config/qtile/icons/python.png",
                       scale = "False",
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(f"{myEditor} '/home/stig/.config/qtile/config.py'")}
                       ),
              widget.Sep(
                       linewidth = 8,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[0],
                       ),
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                  ),
              widget.GroupBox(
                       font = "Ubuntu Bold",
                       fontsize = 24,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 4, # space the workspace names a little more (default 3)
                       borderwidth = 3,
                       active = '97c277', # Workspaces with windows running are coloured green
                       inactive = colors[7],
                       rounded = False,
                       highlight_color = '#3e4452',
                       highlight_method = "line",
                       this_current_screen_border = colors[6],
                       this_screen_border = '#61afef',
                       other_current_screen_border = colors[6],
                       other_screen_border = colors[4],
                       foreground = '#ff7a85',
                       background = '#3e4452'
                       ),
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                  ),
            widget.Sep(
                       linewidth = 8,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[0],
                       ),
             widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[2],
                       background = '#3e4452',
                       padding = 0,
                       scale = 0.7 # zoom in/out of the layout icon
                       ),
              widget.CurrentLayout(
                       fontsize = 24,
                       foreground = '97c277',
                       background = '#3e4452',
                       padding = 5
                       ),
            widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                  ),
              widget.WindowName(
                       fontsize=24,
                       max_chars = 75,
                       foreground = colors[0], # invisible window titles
                       background = colors[0],
                       padding = 10,
                       # padding = 30 or  450 # SET THIS TO ADJUST THE "CENTERING" OF THE APP TITLE
                       ),

# Right prompt begins
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
              # widget.Sep(
              #           linewidth = 0,
              #           background = '474747',
              #           foreground = '474747'
              #           ),
              widget.Battery(
                       font='JetBrainsMono Nerd Font',
                       update_interval=10,
                       full_char = ' ',
                       notify_below = 20,
                       low_foreground = '880808',
                       fontsize=26,
                       show_short_text = False,
                       format='{char} {percent:2.0%}',
                       foreground='ff7a85', # colors[4]
                       background='474747',
                       charge_char ='',
                       # charge_char = '',
                       discharge_char = '',
                       # discharge_char = '',
                       ),
         widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1,
                        ),
            widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = '474747',
                        background = colors[0]
                        ),
            widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
              widget.Backlight(
                       background = '#3e4452',
                       foreground = '97c277',
                       font='FontAwesome',
                       # fmt='{}',
                       fmt = ' {}',
                       fontsize = 24,
                       backlight_name = 'intel_backlight',
                       # change_command = 'light -S {0}',
                       ),
             widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1,
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = '474747',
                        background = colors[0]
                        ),
               # pacman widget
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
               widget.CheckUpdates(
                        fontsize = 26,
                        distro = 'Arch_checkupdates',
                        colour_have_updates = '61afef',
                        colour_no_updates = '61afef',
                        display_format = '{updates} ', #   
                        # no_update_string = ' Up-to-date ',
                        #no_update_string = '',
                        no_update_string = 'Up to date',
                        execute = f'{myTerm} start sudo pacman -Syu --noconfirm',
                        foreground = '61afef',
                        background = '#3e4452',
                        max_chars = 26,
                       ),
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1,
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = '474747',
                        background = colors[0]
                        ),
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
               widget.Volume(
                       emoji=False,
                       fmt = '墳 {}', # 墳
                       fontsize=24,
                       step=1,
                       font='FontAwesome',
                       # font='JetBrainsMono Nerd Font Mono',
                       background='3e4452',
                       foreground='e4bf7a',
                       ),
          widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1,
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = '474747',
                        background = colors[0]
                        ),

               # widget.Memory(
               #          icon = """,
               #          font="Noto Sans",
               #          format = 'Mem: {MemUsed}M/{MemTotal}M',
               #          update_interval = 1,
               #          fontsize = 22,
               #          foreground = '61afef',
               #          background = colors[1],
               #         ),
               # widget.Sep(
               #          linewidth = 0,
               #          padding = 10,
               #          foreground = '474747',
               #          background = colors[0]
               #          ),
               widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
               widget.Systray(
                       background = '#3e4452',
                       icon_size = 24,
                       padding=6,
                        ),

              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1,
                        ),

                  widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = '474747',
                        background = colors[0]
                        ),
              widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
                       widget.Clock(
                        foreground = '#bababa',# Doom One colour isn't bad   #bbbbbb
                        background = '#3e4452',
                        fontsize = 26,
                        format = '%H:%M:%S', #  
                        ),

               # widget.Sep(
               #          linewidth = 0,
               #          padding = 2,
               #          foreground = '474747',
               #          background = colors[0]
               #          ),
             widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
            widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = '474747',
                        background = colors[0]
                        ),
             widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
            widget.Clock( # It's a calendar
                        foreground = 'c678dd',
                        background = '#3e4452',
                        fontsize = 24,
                        padding=2,
                        format = '%d/%m/%y', # 
                        ),

               widget.TextBox(
                       text = '',
                       foreground = '#3e4452',
                       background = '#282c34',
                       fontsize = 26,
                       padding = -1
                        ),
              widget.Sep(
                       linewidth = 0,
                       padding =4,
                       foreground = colors[0],
                       background = colors[0]
                       ),
        
            # widget.Notify(
            #            default_timeout = 5,
            #            font='JetBrainsMono Nerd Font',
            #            fontsize = 26,
            #            padding = -1
            #             ),

             ]
    return widgets_list

widgets_list = init_widgets_list()

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

widgets_screen1 = init_widgets_screen1()

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=30, opacity=0.80))]
screens = init_screens()


# MOUSE CONFIGURATION
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []

main = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])

@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='Arcolinux-welcome-app.py'),
    Match(wm_class='Arcolinux-calamares-tool.py'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='file_progress'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='archlinux-logout'),
    Match(wm_class='xfce4-terminal'),
],  fullscreen_border_width = 0, border_width = 0)

auto_fullscreen = True
focus_on_window_activation = "focus" # or smart
wmname = "QTile"
