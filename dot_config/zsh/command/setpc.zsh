function setpc
{
  PS3="set number that Setting: "

  select opt in discord quit; do

    case $opt in
      discord)
        ~/.config/zsh/command/discord/discord.sh
        break
        ;;
      subtract)
        read -p "Enter the first number: " n1
        read -p "Enter the second number: " n2
        echo "$n1 - $n2 = $(($n1-$n2))"
        ;;
      multiply)
        read -p "Enter the first number: " n1
        read -p "Enter the second number: " n2
        echo "$n1 * $n2 = $(($n1*$n2))"
        ;;
      divide)
        read -p "Enter the first number: " n1
        read -p "Enter the second number: " n2
        echo "$n1 / $n2 = $(($n1/$n2))"
        ;;
      quit)
        break
        ;;
      *) 
        echo "Invalid option $REPLY"
        ;;
    esac
  done
}
