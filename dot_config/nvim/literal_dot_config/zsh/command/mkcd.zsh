# -*- shell-script -*-
# mkcd
#
#
#
#
function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}
