set -ex pipefail

ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
echo "source $HOME/dotfiles/index" > "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/vim" "$HOME/.config/nvim"
echo "Installing VIM plugins"
vim +PlugInstall +qall
