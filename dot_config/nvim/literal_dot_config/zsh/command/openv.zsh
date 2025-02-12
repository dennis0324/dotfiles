# -*- shell-script -*-\
# openv: touch a file and open file with vim
#
#

function openv
{
  dir="$*";
  if [[ -f "$dir" ]]
  then
    v "$dir"; 
  else
    touch "$dir" && v "$dir"; 
  fi
}
