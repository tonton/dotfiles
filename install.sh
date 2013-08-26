ln -snf ~/dotfiles/.exrc          ~/.exrc
ln -snf ~/dotfiles/.tmux.conf     ~/.tmux.conf
ln -snf ~/dotfiles/.vimrc         ~/.vimrc
ln -snf ~/dotfiles/.zshrc         ~/.zshrc
ln -snf ~/dotfiles/.zshrc.mine    ~/.zshrc.mine

mkdir bundle 
git clone https://github.com/Shougo/neobundle.vim.git vim/bundle/neobundle.vim
