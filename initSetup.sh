echo Upgrading packages...
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# terminator 
echo Installing terminator...
sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get update
sudo apt-get install -y terminator

echo Installing nethogs... 
sudo apt-get install -y nethogs 

# unity tweak tool 
echo Installing unity tweak tool...
sudo apt-get install -y unity-tweak-tool

# install autojump
echo Installing autojump...
sudo apt-get install -y autojump
LINE='. /usr/share/autojump/autojump.sh'
FILE=~/.zshrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# install silversearcher-ag
echo Installing silversearcher-ag...
sudo apt-get install -y silversearcher-ag

# ssh
echo Installing ssh...
sudo apt-get install -y ssh

# firewall
echo Installing gufw...
sudo apt-get install -y gufw

# dns sec
echo Installing ubound...
sudo apt-get install -y ubound

# chrome
echo Installing chrome...
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads
sudo apt-get install -y ~/Downloads/google-chrome-stable_current_amd64.deb 

# git, latest upstream version
echo Installing git...
sudo add-apt-repository -y ppa:git-core/ppa 
sudo apt-get install -y git

# vim
echo Installing vim-gnome... 
sudo apt-get install -y vim-gnome
sudo apt-get install -y curl 

echo Mapping caplock as ESC key...
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Install Plug
echo Installing plug...
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vimrc
echo Installing vimrc...
wget https://raw.githubusercontent.com/ychclone/vimrc/master/.vimrc -P ~/

# pandoc
echo Installing pandoc...
pandocDeb=`curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d '"' -f 4`

cd ~/Downloads

wget $pandocDeb
sudo apt install -y ./"${pandocDeb##*/}"

# Go
echo Installing go...
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz -P ~/Downloads
cd ~/Downloads
sudo tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz

LINE='PATH=$PATH:/usr/local/go/bin'
FILE=~/.profile
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# g++
echo Installing g++
sudo apt-get install -y g++

# node js
echo Installing node js... 
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# npm
echo Updating npm...
sudo npm install npm@latest -g

# pug template
echo Installing pug template...
sudo npm install -g pug
sudo npm install -g pug-cli

# Filezilla
echo Installing Filezilla...
wget https://dl1.cdn.filezilla-project.org/client/FileZilla_3.33.0_x86_64-linux-gnu.tar.bz2 -P ~/Downloads
cd ~/Downloads
sudo tar -C /opt -xzf FileZilla_3.33.0_x86_64-linux-gnu.tar.bz2

# wine
echo Installing wine... 
sudo dpkg --add-architecture i386 

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'

sudo apt-get update
sudo apt install --install-recommends winehq-devel

# asciidoctor
echo Installing asciidoctor...
sudo gem update --system 
sudo gem install asciidoctor

# asciidoctor-pdf
echo Installing asciidoctor-pdf..
sudo gem install --pre asciidoctor-pdf
sudo gem install coderay pygments.rb 

# inkscape
# remove old version
echo Installing inkscape...
sudo snap remove inkscape
sudo add-apt-repository -y ppa:inkscape.dev/stable
sudo apt-get update
sudo apt install -y inkscape

# krita
echo Installing krita...
sudo snap remove krita
sudo add-apt-repository -y ppa:kritalime/ppa
sudo apt-get update
sudo apt-get install -y krita

# Calibre
echo Installing calibre...
sudo -v && wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

# firejail
echo Installing firejail... 
cd /opt
git clone https://github.com/netblue30/firejail.git
cd firejail
./configure && make && sudo make install-strip

echo Setting firejail...
sudo sed -i 's|Exec=/usr/bin/google-chrome-stable|Exec=/usr/local/bin/firejail /usr/bin/google-chrome-stable|' /usr/share/applications/google-chrome.desktop
sudo sed -i 's|Exec=firefox|Exec=/usr/local/bin/firejail firefox|' /usr/share/applications/firefox.desktop 

# xtrlock - transparent screen lock for X windows
echo Installing xtrlock... 
sudo apt-get install -y xtrlock

LINE='alias xl="sleep 3; xtrlock"' 
FILE=~/.profile
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE" 

# copyQ - clipboard manger
echo Installing copyQ...
sudo add-apt-repository -y ppa:hluk/copyq
sudo apt update
sudo apt install -y copyq

# kdenlive - video editor
echo Installing kdenlive... 
sudo add-apt-repository -y ppa:kdenlive/kdenlive-stable
sudo apt-get update
sudo apt-get install -y kdenlive

# smplayer - video player 
echo Installing smplayer...
sudo add-apt-repository -y ppa:rvm/smplayer 
sudo apt-get update 
sudo apt-get install -y smplayer smplayer-themes smplayer-skins 

# brightness controller - https://github.com/LordAmit/Brightness
echo Installing brightness controller...  
sudo add-apt-repository -y ppa:apandada1/brightness-controller
sudo apt-get update
sudo apt-get install -y brightness-controller

# fd - find alternative
wget https://github.com/sharkdp/fd/releases/download/v6.2.0/fd_6.2.0_amd64.deb -P ~/Downloads
sudo apt-get install -y ~/Downloads/fd_6.2.0_amd64.deb

# p7zip-full - 7zip
sudo apt-get install -y p7zip-full

# Rclone
echo Installing Rclone...
curl https://rclone.org/install.sh | sudo bash

# alias
LINE='alias n="nautilus ."'
FILE=~/.zshrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

LINE='alias kn="pkill nautilus"'
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

LINE='alias xl="sleep 3; xtrlock"' 
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

LINE='alias wm="firejail --net=none wine \"/home/yeung/.wine/drive_c/Program Files/WinMerge/WinMergeU.exe\""'
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# install zsh at last and change default shell
echo Installing zsh and change default shell... 
sudo apt-get install -y zsh
chsh -s $(which zsh)

# install oh-my-zsh
echo Installing oh-my-zsh...
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

