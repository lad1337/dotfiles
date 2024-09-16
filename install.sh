set -ex pipefail

ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
echo "source $HOME/dotfiles/index" > "$HOME/.zshrc"
rm -rf "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/vim" "$HOME/.config/nvim"
echo "Installing VIM plugins"
vim +PlugInstall +qall


#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# brew install git-delta fd rg bat nvim node golang coreutils zsh-syntax-highlighting
