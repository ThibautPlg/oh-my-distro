#Hello

cp .bash_tpo ~/
cp .zshrc ~/
apt install -y vim
mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors/
cp .vimrc ~/

grep -qxF 'source ~/.bash_tpo' ~/.bash_tpo || echo 'source ~/.bash_tpo' >> ~/.bash_tpo

#Fonts
mkdir -p ~/.local/share/fonts
cp ./LigaDroidSansMono.ttf ~/.local/share/fonts/LigaDroidSansMono.ttf
fc-cache -vf

#Get Yakuake Theme
mkdir -p /usr/share/yakuake/skins/
cp -r ./sodadark-thintitlebar /usr/share/yakuake/skins/
# @todo : Write "Skin=sodadark-thintitlebar" in .config/yakuakerc
