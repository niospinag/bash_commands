#install starship in terminal
sudo snap install starship
echo 'eval "$(starship init bash)"' >> ~/.bashrc

# change color gnome-theme
sudo pacman -S dconf-cl
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh -1 

#echo 'do not forget to change the settings in tweaks'

#change theme gedit
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
mkdir -p ~/.local/share/gedit/styles/
mv dracula.xml ~/.local/share/gedit/styles/
echo 'DO NOT FORGET TO ACTIVAATE IT IN GEDIT SETTINGS'

#change the Grafical theme
git clone https://github.com/dracula/gtk.git
mkdir -p /usr/share/themes/
sudo mv gtk /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
