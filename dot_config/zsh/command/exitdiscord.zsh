# -*- shell-script -*-
# exitdiscord
# kill discord
#
#
#
function exitdiscord {
  discord=$(pgrep -o Discord)

  if [[ -n $discord ]]
  then
    kill -9 $(pgrep -o Discord)
  else
    echo "Discord is not running"
  fi

}
