#!/bin/sh
PROGRAM=$1
ARTIST="EBS"
RECORD_MINS=$(($2 * 60))

alias date='date -d "-2 hours"'

RECORD_PATH="/outputs/$PROGRAM/`date "+%Y년 %-m월"`"
mkdir -p "$RECORD_PATH"

ffmpeg -loglevel panic -y -re -i "$STREAM_URL" -vn -acodec copy \
    -metadata title="$PROGRAM - `date "+%Y년 %-m월 %-d일"`" \
    -metadata artist="$ARTIST" \
    -metadata album_artist="$ARTIST" \
    -metadata album="$PROGRAM - `date "+%Y년 %-m월"`" \
    -metadata track="`date "+%-d"`" \
    -t $RECORD_MINS "$RECORD_PATH/$PROGRAM-`date "+%y%m%d"`.m4a"
