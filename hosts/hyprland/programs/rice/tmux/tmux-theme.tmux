#!/bin/bash
black="#282c34"
blue="#769ff0"
yellow="#d19a66"
red="#f38ba8"
white="#abb2bf"
green="#97c277"
visual_grey="#3e4452"
comment_grey="#5c6370"
purple="#c678dd"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$white"
set "message-bg" "$black"

set "message-command-fg" "$white"
set "message-command-bg" "$black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$black"
setw "window-status-bg" "$black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$black"
setw "window-status-activity-fg" "$black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$comment_grey"
set "window-active-style" "fg=$white"

set "pane-border-fg" "$white"
set "pane-border-bg" "$black"
set "pane-active-border-fg" "$green"
set "pane-active-border-bg" "$black"

set "display-panes-active-colour" "$grey"
set "display-panes-colour" "$blue"

set "status-bg" "$black"
set "status-fg" "$white"

set "@prefix_highlight_fg" "$black"
set "@prefix_highlight_bg" "$green"
set "@prefix_highlight_copy_mode_attr" "fg=$black,bg=$green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@widgets")
time_format=$(get "@time_format" "%R")
date_format=$(get "@date_format" "%d/%m/%Y")

# the below line is perfect.
# set "status-right" "#{prefix_highlight}#[fg=$purple,bg=$black]#{prefix_highlight}#[fg=$purple,bg=$black,nounderscore,noitalics]#{prefix_highlight}#[fg=$black,bg=$purple,nounderscore,noitalics] ${time_format} #{prefix_highlight}#[fg=$black,bg=$purple,nounderscore,noitalics]#{prefix_highlight} ${date_format} #[fg=$blue,bg=$purple]#[fg=$blue,bg=$blue]#[fg=$black, bg=$blue,bold]$(whoami) #[fg=$green,bg=$blue,nobold,nounderscore,noitalics]#[fg=$black,bg=$green,bold] #h #[fg=$yellow, bg=$green]#[fg=$red,bg=$yellow]"
set "status-right" "#[fg=$yellow,bg=$black]#[fg=$black,bg=$yellow]${time_format}#[fg=$yellow,bg=$black]

#[fg=$black,bg=$black] 

#[fg=$purple,bg=$black]#[fg=$purple,bg=$purple]#[fg=$black,bg=$purple,bold]${date_format}#[fg=$purple,bg=$black]

#[fg=$black,bg=$black] 

#[fg=$blue,bg=$black]#[fg=$blue,bg=$blue]#[fg=$black,bg=$blue,bold]$USER#[fg=$blue,bg=$black]

#[fg=$black,bg=$black] 

#[fg=$green,bg=$black,nobold,nounderscore,noitalics]#[fg=$black,bg=$green,bold] #h #[fg=$red,bg=$green]#[fg=$green,bg=$black]

#[fg=$black,bg=$black]
#[fg=$red,bg=$black] #[fg=$visual_grey,bg=$red] 󰣇 #[fg=$red,bg=$black]"


set "status-left" "#[fg=$black,bg=$white,bold] #S #{prefix_highlight}#[fg=$blue,bg=$black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$red,bg=$blue,nobold,nounderscore,noitalics]#[fg=$white,bg=$green] #I  #W #[fg=$black,bg=$black,nobold,nounderscore,noitalics]
"
set "window-status-current-format" "#[fg=$white,bg=$visual_grey,nobold,nounderscore,noitalics]

#[fg=$visual_grey,bg=$black] 

#[fg=$white,bg=$visual_grey,nobold] #I   #W
#[fg=$visual_grey,bg=$black,nobold,nounderscore,noitalics]"
