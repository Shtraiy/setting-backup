#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s /bin/zsh

cp -f .zshrc ~/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/wting/autojump.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump

cd ~/.oh-my-zsh/custom/plugins/autojump

./install.py

source .zshrc
