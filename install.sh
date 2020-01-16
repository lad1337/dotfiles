set -ex pipefail

echo "source $HOME/dotfiles/index" > "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/vim" "$HOME/.config/nvim"
echo "Installing VIM plugins"
vim +PlugInstall +qall
