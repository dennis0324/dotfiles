discord=$(pgrep -o discord)
Discord=$(pgrep -o Discord)

if [[ -n $discord ]]; then
	kill -9 $discord
elif [[ -n $Discord ]]; then
	kill -9 $Discord
else
	echo "discord is not running"
fi
