pw=$(cat $HOME/.secret/pw/wheel)
home=$HOME

expect -f - <<-EOF
	    set timeout 10

	    spawn sudo -k
	    spawn sudo pacman -Sy
	      expect {
	        "*?assword*" {
	          send -- "$pw\r"
	            exp_continue
	        }
	      }
	      spawn sudo pacman -S --noconfirm discord
	        expect {
	          "*?assword*" {
	            send -- "$pw\r"
	          }
	        }
	    expect eof
EOF
