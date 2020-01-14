#MY CONFIGS

#Colors: https://jonasjacek.github.io/colors/
#220
#42
#
#

# ZSH basics
export ZSH="/home/bitdavel/.oh-my-zsh"
plugins=(
git
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh


# Enable colors and change prompt:
autoload -U colors && colors
PS1="%T %F{43}%n%{$reset_color%}:[%F{221}%(4~|.../%3~|%~)%{$reset_color%}]~$ "


# Options
setopt autocd
#setopt correctall 


# Use vim keys in tab complete menu:
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Change cursor shape for vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'


# Autocomplete
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
bindkey -M menuselect '^M' .accept-line #Press enter only once to accept an option.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6aeb00"
bindkey '^F' autosuggest-execute


# Special sauce
function yeezy () {

echo "
          _____                    _____                    _____                _____                    _____          
         /\    \                  /\    \                  /\    \              |\    \                  /\    \         
        /::\____\                /::\    \                /::\____\             |:\____\                /::\    \        
       /:::/    /               /::::\    \              /::::|   |             |::|   |               /::::\    \       
      /:::/    /               /::::::\    \            /:::::|   |             |::|   |              /::::::\    \      
     /:::/    /               /:::/\:::\    \          /::::::|   |             |::|   |             /:::/\:::\    \     
    /:::/____/               /:::/__\:::\    \        /:::/|::|   |             |::|   |            /:::/__\:::\    \    
   /::::\    \              /::::\   \:::\    \      /:::/ |::|   |             |::|   |           /::::\   \:::\    \   
  /::::::\____\________    /::::::\   \:::\    \    /:::/  |::|   | _____       |::|___|______    /::::::\   \:::\    \  
 /:::/\:::::::::::\    \  /:::/\:::\   \:::\    \  /:::/   |::|   |/\    \      /::::::::\    \  /:::/\:::\   \:::\    \ 
/:::/  |:::::::::::\____\/:::/  \:::\   \:::\____\/:: /    |::|   /::\____\    /::::::::::\____\/:::/__\:::\   \:::\____\

\::/   |::|~~~|~~~~~     \::/    \:::\  /:::/    /\::/    /|::|  /:::/    /   /:::/~~~~/~~      \:::\   \:::\   \::/    /
 \/____|::|   |           \/____/ \:::\/:::/    /  \/____/ |::| /:::/    /   /:::/    /          \:::\   \:::\   \/____/ 
       |::|   |                    \::::::/    /           |::|/:::/    /   /:::/    /            \:::\   \:::\    \     
       |::|   |                     \::::/    /            |::::::/    /   /:::/    /              \:::\   \:::\____\    
       |::|   |                     /:::/    /             |:::::/    /    \::/    /                \:::\   \::/    /    
       |::|   |                    /:::/    /              |::::/    /      \/____/                  \:::\   \/____/     
       |::|   |                   /:::/    /               /:::/    /                                 \:::\    \         
       \::|   |                  /:::/    /               /:::/    /                                   \:::\____\        
        \:|   |                  \::/    /                \::/    /                                     \::/    /        
         \|___|                   \/____/                  \/____/                                       \/____/         

          _____                    _____                _____                    _____          
         /\    \                  /\    \              |\    \                  /\    \         
        /::\    \                /::\    \             |:\____\                /::\    \        
       /::::\    \              /::::\    \            |::|   |               /::::\    \       
      /::::::\    \            /::::::\    \           |::|   |              /::::::\    \      
     /:::/\:::\    \          /:::/\:::\    \          |::|   |             /:::/\:::\    \     
    /:::/__\:::\    \        /:::/__\:::\    \         |::|   |            /:::/__\:::\    \    
    \:::\   \:::\    \      /::::\   \:::\    \        |::|   |            \:::\   \:::\    \   
  ___\:::\   \:::\    \    /::::::\   \:::\    \       |::|___|______    ___\:::\   \:::\    \  
 /\   \:::\   \:::\    \  /:::/\:::\   \:::\    \      /::::::::\    \  /\   \:::\   \:::\    \ 
/::\   \:::\   \:::\____\/:::/  \:::\   \:::\____\    /::::::::::\____\/::\   \:::\   \:::\____\

\:::\   \:::\   \::/    /\::/    \:::\  /:::/    /   /:::/~~~~/~~      \:::\   \:::\   \::/    /
 \:::\   \:::\   \/____/  \/____/ \:::\/:::/    /   /:::/    /          \:::\   \:::\   \/____/ 
  \:::\   \:::\    \               \::::::/    /   /:::/    /            \:::\   \:::\    \     
   \:::\   \:::\____\               \::::/    /   /:::/    /              \:::\   \:::\____\    
    \:::\  /:::/    /               /:::/    /    \::/    /                \:::\  /:::/    /    
     \:::\/:::/    /               /:::/    /      \/____/                  \:::\/:::/    /     
      \::::::/    /               /:::/    /                                 \::::::/    /      
       \::::/    /               /:::/    /                                   \::::/    /       
        \::/    /                \::/    /                                     \::/    /        
         \/____/                  \/____/                                       \/____/         

<<<<<<<<<<<<<<<<<<<<<<<<
"                                                                                                                         
curl -s https://api.kanye.rest | python3 -c "import sys, json; print(json.load(sys.stdin)['quote'])"

echo "
<<<<<<<<<<<<<<<<<<<<<<<<

"
}


# Syntax highlighting.
source ~/.utils/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh #must be last item in zshrc
