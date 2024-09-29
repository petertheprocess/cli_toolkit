if [ "$(id -u)" = "0" ]; then
    Sudo=''
elif which sudo; then
    Sudo='sudo'
else
    echo "ERR: 'sudo' command not found."
    echo "     Install 'sudo' before calling this script"
    exit 1
fi

# install zsh+oh my zsh+p10k theme
sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- \
  -a 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir newline)' \
  -a 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status direnv virtualenv pyenv newline)'
  -p https://github.com/zsh-users/zsh-autosuggestions \
  -p z
echo "=======zsh installation susscessful======="

# download zellij binary from internet
wget -qO- https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz \
  | tar -xzv && $Sudo chmod +x zellij && $Sudo mv zellij /usr/bin/
echo "=======zellij installation susscessful======="

# download yazi binary and link them to /usr/bin
wget -qO yazi.zip https://github.com/sxyazi/yazi/releases/download/v0.3.3/yazi-x86_64-unknown-linux-musl.zip \
 && unzip yazi.zip -d ~/.yazi \
 && $Sudo ln -s ~/.yazi/yazi-x86_64-unknown-linux-musl/ya /usr/bin/ya \
 && $Sudo ln -s ~/.yazi/yazi-x86_64-unknown-linux-musl/yazi /usr/bin/yazi \
 && $Sudo rm yazi.zip

# add yy() to .zshrc
echo 'function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}' >> ~/.zshrc
echo "=======yazi installation susscessful======="
