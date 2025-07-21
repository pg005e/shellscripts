#! /bin/sh

user=$(whoami)
host=$(hostname)

if [ "$XDG_SESSION_TYPE" = "x11" ]; then

  win_ids=$(wmctrl -l | grep "$user@$host" | awk '{print $1}')
  for win_id in win_ids; do
    xprop -id $win_id -format _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS 2
  done;

fi
