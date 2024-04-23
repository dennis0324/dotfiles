#!/bin/sh

args="$*"

[[ $args =~ server=([^ ]*) ]] && server=${BASH_REMATCH[0]}
server=$(echo $server | cut -d= -f2)
echo $server

