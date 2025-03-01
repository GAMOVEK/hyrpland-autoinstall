#!/bin/bash
sudo pacman -Syu
sudo pacman -S base-devel linux-headers --noconfirm
sudo pacman -S hyprland kitty gtk3 rofi-wayland dolphin sddm sddm-kcm git nano --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
echo wrappedhl > ~/wrappedhl
echo .bash_profile > ~/.bash_profile
echo 00-hyprland.conf > /etc/sddm.conf.d/00-hyprland.conf
sudo sed -i 's/kb_layout = us/kb_layout = fr/' ~/.config/hypr/hyprland.conf
sudo sed -i 's/autogenerated = 1 # remove this line to remove the warning//' ~/.config/hypr/hyprland.conf
sudo sed -i 's/bind = $mainMod, C, killactive,/bind = $mainMod, W, killactive,/' ~/.config/hypr/hyprland.conf
sudo sed -i 's/$menu = wofi --show drun/$menu = rofi -show drun/' ~/.config/hypr/hyprland.conf
sudo sed -i 's/bind = $mainMod, R,/bind = $mainMod, F,/' ~/.config/hypr/hyprland.conf

sudo systemctl enable sddm

#theme sddm
git clone siddrs/tokyo-night-sddm ~/usr/share/sddm/themes/
sudo sed -i 's/Current=/Current=tokyo-night-sddm/' ~/usr/lib/sddm/sddm.conf.d/default.conf


#tlp batterie
pacman -S tlp tlp-rdw
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo reboot 
