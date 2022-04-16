!bin/bash

user='ubuntu'

# instalamos la zsh
sudo apt install zsh

#instalamos la powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# configuramos la powerlevel10k

# no olvide instalar la powerlevel10k en usuario root

#creamos un enlace simbolico del root al usuario
# sudo su
# ln -s -f /home/${user}/.zshrc .zshrc


#instalar autocompletion y autosuggestion
cd /Downloads
git clone https://github.com/zsh-users/zsh-autosuggestions

echo 'source ~/Downloads/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh' >> ~/.zshrc



#definimos zsh por default
usermod --shell /usr/bin/zsh root
usermod --shell /usr/bin/zsh $user

