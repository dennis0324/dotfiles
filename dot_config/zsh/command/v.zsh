# -*- shell-script -*-
# script open vim or nvim or vi
#
#
function v
{
  dir="$*"
  nvim=$( whereis 'nvim' | cut -d: -f2);
  vim=$( whereis 'vim' | cut -d: -f2 );
  vi=$( whereis 'vi'  | cut -d: -f2 );

  if [[ -n nvim ]]
  then
    if [[ -e "/home/$USER/.cache/nvim/resize_neo_vim" ]]
    then
      if [ -z "$dir" ]; then
        nvim 
      else
        nvim "$dir"
      fi
    else
      if [ -z "$dir" ]; then
        nvim 
      else
        nvim "$dir"
      fi
    fi
  elif [[ -n vim ]]
  then
    vim "$dir"
  else
    vi "$dir"
  fi
}
