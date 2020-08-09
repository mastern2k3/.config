function mvi --wraps mv
  if [ (count $argv) -ne 1 -o ! -f "$argv[1]" ]
    command mv $argv
    return
  end

  set newfilename (bash -c 'read -ei "$1" newfilename && echo "$newfilename"' '' "$argv[1]")
  command mv -v -- "$argv[1]" "$newfilename"
end

