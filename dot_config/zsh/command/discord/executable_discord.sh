PS3="set number that Setting: "

select opt in install uninstall update exit quit; do

	case $opt in
	install)
		~/.config/zsh/command/discord/discord-vencord.sh install
		break
		;;
	uninstall)
		~/.config/zsh/command/discord/discord-vencord.sh uninstall
		break
		;;
	update)
		~/.config/zsh/command/discord/discord-vencord.sh uninstall
		~/.config/zsh/command/discord/discord-update.sh
		~/.config/zsh/command/discord/discord-vencord.sh install
		break
		;;
	exit)
		~/.config/zsh/command/discord/discord-exit.sh
		break
		;;
	quit)
		break
		;;
	*)
		echo "Invalid option $REPLY"
		;;
	esac
done
