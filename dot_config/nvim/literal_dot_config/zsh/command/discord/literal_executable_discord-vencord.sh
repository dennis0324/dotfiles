pw=$(cat $HOME/.secret/pw/wheel)
home=$HOME
arg=$1

expect -f - <<-EOF
	    set timeout 10

	    spawn sudo -k
	    spawn sudo $home/.config/zsh/command/discord/VencordInstallerCli-linux --${arg} --branch stable
	    expect "*?assword*"
	    send -- "$pw\r"
	    expect eof
EOF
