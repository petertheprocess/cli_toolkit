# Introduction
This repo is for me to quickly install the cli tools I use every day in a fresh linux system or inside a docker.
currently it includes:
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh): A delightful community-driven (with 2,400+ contributors) framework for managing your zsh configuration. 
- [Zellij](https://github.com/zellij-org/zellij): a tmux-like terminal multiplexer. Unlike Tmux, the default keybindings of Zellij are much kinder to new users.
<p align="center">
  <img src="https://raw.githubusercontent.com/zellij-org/zellij/main/assets/demo.gif" alt="demo">
</p>

- [Yazi](https://github.com/sxyazi/yazi): a ranger-like terminal file manager, allow you view and navigate through your directory interactively and smoothly.

https://github.com/sxyazi/yazi/assets/17523360/92ff23fa-0cd5-4f04-b387-894c12265cc7
# Usage
`sh -c "$(wget -O- https://raw.githubusercontent.com/petertheprocess/cli_toolkit/main/cli_toolkit_install.sh)"`
That command will install ohmyzsh with autosuggestion plugin, zellij, and yazi. zsh installation script is from [zsh-in-docker](https://github.com/deluan/zsh-in-docker)


