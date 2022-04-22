# !bin/bash

user=$USER

# instalamos la zsh y otros paquetes
sudo apt install zsh curl wget -y

#descargamos la fuente 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip

sudo mv Hack.zip /usr/local/share/fonts
cd /usr/local/share/fonts/
sudo unzip Hack.zip
cd ~
sudo rm /usr/local/share/fonts/Hack.zip
# configure el font en la terminal preferences


#instalamos la powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# configuramos la powerlevel10k
# 2 clasic
# 1 unicode
# 4 darkest
# 1 no time
# 1 angled
# 2 blurred
# 1 flat
# 1 one line
# 2 sparce
# 2 many icons
# 1 concise
# y yes
# 2 quiet 
# y yes

#remember to add  to the .p10k


# no olvide instalar la powerlevel10k en usuario root

#creamos un enlace simbolico del root al usuario
# sudo su
# ln -s -f /home/${user}/.zshrc .zshrc


#instalar autocompletion y autosuggestion
cd ~/Downloads
git clone https://github.com/marlonrichert/zsh-autocomplete
sudo mv zsh-autocomplete /usr/share
git clone https://github.com/zsh-users/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting


sudo mv zsh-syntax-highlighting  /usr/share 
sudo mv zsh-autosuggestions  /usr/share 

# instalamos el sudo
cd /usr/share
sudo mkdir zsh-plugings
sudo chown $user:$user zsh-plugings
cd zsh-plugings
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
cd ~

echo "# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh-plugings/sudo.plugin.zsh" >> ~/.zshrc
# echo 'source ~/Downloads/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh' >> ~/.zshrc

#intalamos el bat y lsd SI QUIERES LA ULTIMA VERSION BUSCALA EN RELEASE GITHUB
cd ~/Downloads
wget https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb
wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
sudo dpkg -i bat_0.20.0_amd64.deb
sudo dpkg -i lsd_0.21.0_amd64.deb


echo "# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='/usr/bin/bat'
alias catn='/usr/bin/cat'
alias catnl='/usr/bin/bat --pagin=never' 
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory " >> ~/.zshrc


#instalar el fzf y ranger
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# usar con ctr + t o ctr+r

sudo apt install ranger


#definimos zsh por default
sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh $user

