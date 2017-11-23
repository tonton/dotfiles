ln -snf ~/dotfiles/.vimrc         ~/.vimrc
ln -snf ~/dotfiles/.exrc          ~/.exrc
ln -snf ~/dotfiles/vim            ~/.vim
ln -snf ~/dotfiles/.zshrc         ~/.zshrc
ln -snf ~/dotfiles/.zshrc.mine    ~/.zshrc.mine
ln -snf ~/dotfiles/.tmux.conf     ~/.tmux.conf
ln -snf ~/dotfiles/.gitconfig     ~/.gitconfig
ln -snf ~/dotfiles/.gitignore     ~/.gitignore
mkdir -p ~/.vim_back ~/.vim_swap

if [ ! -d ~/.vim/dein ]; then
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_init.sh && sh dein_init.sh ~/.vim/dein && rm ./dein_init.sh
fi

if [ ! -d ~/.anyenv ]; then
	git clone https://github.com/riywo/anyenv ~/.anyenv
	exec $SHELL -l
fi

if [ ! `which rbenv` ]; then
	anyenv install rbenv
fi
if [ ! `which ndenv` ]; then
	anyenv install ndenv
fi
if [ ! `which goenv` ]; then
	anyenv install goenv
fi
exec $SHELL -l

