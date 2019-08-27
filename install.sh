#Hello

cp .bash_tpo ~/
cp .zshrc ~/
mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors/
cp .vimrc ~/

grep -qxF 'source ~/.bash_tpo' ~/.bash_tpo || echo 'source ~/.bash_tpo' >> ~/.bash_tpo

#Fonts
sh ./getFont.sh

#Get Yakuake Theme
cp -r ./sodadark-thintitlebar /usr/share/yakuake/skins/
# @todo : Write "Skin=sodadark-thintitlebar" in .config/yakuakerc
