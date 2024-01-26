#!/bin/bash


while true; do
title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)
artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artist/{n;n;p}' | cut -d '"' -f 2)

if [[ ${#title} -ge 20 ]]; then
  title=${title:0:20}"..."
fi 

if [[ ${#artist} -ge 15 ]]; then
  artist=${artist:0:15}"..."
fi

echo "${title} | ${artist}" > /tmp/current_song
sleep 5
done
