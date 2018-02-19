echo "source $HOME/dotfiles/index" > "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
