
# use nord color pallet
set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord3
set fish_color_user $nord4
set fish_color_host $nord9
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1

# set PATH so it includes user's private bin if it exists
if test -d $HOME"/bin"
    set PATH $PATH $HOME"/bin"
end

if test -d $HOME"/.local/bin"
    set PATH $PATH $HOME"/.local/bin"
end

if test -d $HOME"/.yarn/bin"
    set PATH $PATH $HOME"/.yarn/bin"
end

if test -d $HOME"/.sdkman/bin"
    set PATH $PATH $HOME"/.sdkman/bin"
end

if test -d "/usr/local/go/bin"
    set PATH $PATH "/usr/local/go/bin"
end

if test -d (go env GOPATH)"/bin"
    set PATH $PATH (go env GOPATH)"/bin"
end

if test -d "/usr/local/maven/bin"
    set PATH $PATH "/usr/local/maven/bin"
end

if test -d "/snap/bin"
    set PATH $PATH "/snap/bin"
end


if command -v codium >/dev/null
    alias code=codium
end

# git aliases
alias glon='glola --author-date-order'
alias gg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all --author-date-order"
alias gpump='git push --set-upstream git@gitlab.com:nitzan.zada/(git rev-parse --show-toplevel | xargs basename).git (git rev-parse --abbrev-ref HEAD) && git remote add origin git@gitlab.com:nitzan.zada/(git rev-parse --show-toplevel | xargs basename).git && git fetch --all'

alias ggpull='git pull origin (git rev-parse --abbrev-ref HEAD)'
alias ggpush='git push origin (git rev-parse --abbrev-ref HEAD)'

# bookmarks
alias ttom='open_command https://trello.com/b/SbyBrJxQ'
alias tid='open_command https://trello.com/b/tZaiZ8ln/ideas'

# misc aliases
alias untargz='tar xzvf'
alias whoport='sudo lsof -i -P -n | grep LISTEN'
alias xo=open_command
alias btt=bat
alias bt='bat --paging=never'
alias pls=sudo
alias wch='watch -n 1'
alias hig='history | grep'
alias gitnitz='git config user.email "nitzan.zada@gmail.com" && git config user.name "Nitzan Zada"'
alias gitnitzhalo='git config user.email "nitzan@halo-digital.com" && git config user.name "Nitzan Zada"'
alias gomtm='git fetch . origin/master:master'
alias ynk='yank-cli -- xsel -b'
alias ynkk=yank-cli
alias l='exa --time-style iso -la --git --group-directories-first --icons'
alias ls='exa --time-style iso -a --git --group-directories-first --icons'
alias tk=taskell
# alias life='taskell ~/Dropbox/life.md'
alias life='taskell /keybase/private/mastern2k3/notes/life.md'
alias tmux='tmux -u'
alias vi='nvim'
alias rmr='rm -r'

abbr --add --global datei 'date -Isecond'
abbr --add --global lzg lazygit
abbr --add --global lzd lazydocker

function atmx
  alacritty -e tmux -u new-session -A -s $argv > /dev/null & disown
end

function take
  mkdir -p $argv && cd $argv
end

# disable python venv "(venv)" prompt since agnoster
set VIRTUAL_ENV_DISABLE_PROMPT 1

# adaptation so tmux will display current dir as title
function fish_title
    printf '\ek%s\e\\' (status current-command) (prompt_pwd)
end

# display neofetch output instead of normal fish greeting
function fish_greeting
  neofetch
end
