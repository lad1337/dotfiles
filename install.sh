set -ex pipefail

echo "source $HOME/dotfiles/index" > "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
mkdir -p "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/nvim-init.vim" "$HOME/.config/nvim/init.vim"
echo "Installing VIM plugin manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installing VIM plugins"
vim +PlugInstall +qall
