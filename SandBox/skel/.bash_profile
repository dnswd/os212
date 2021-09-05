# Thu 15 Jul 2021 15:16:28 WIB
umask 022

# If running bash
[ -n "$BASH_VERSION" ] && {
    # include .bashrc if it exists
    [ -f $HOME/.bashrc ] && . $HOME/.bashrc
}

# Local PATH
[ -d "$HOME/bin" ]        && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

