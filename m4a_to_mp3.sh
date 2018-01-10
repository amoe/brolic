#! /bin/sh


ffmpeg -y -i "$1" "$1.wav"
lame --preset 64 "$1.wav" "$1.mp3"
rm "$1.wav"
