#Hello

cp .bash_tpo ~/
cp .zshrc ~/
mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors/
cp .vimrc ~/

grep -qxF 'source ~/.bash_tpo' ~/.bash_tpo || echo 'source ~/.bash_tpo' >> ~/.bash_tpo

#Fonts
sh ./getFont.sh
