#!/bin/bash
sudo pacman -Syu
sudo pacman -S base-devel linux-headers --noconfirm
sudo pacman -S hyprland kitty gtk3 rofi-wayland dolphin sddm sddm-kcm git nano --noconfirm
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all && sudo make install --noconfirm
echo wrappedhl > ~/wrappedhl
echo .bash_profile > ~/.bash_profile
echo 00-hyprland.conf > /etc/sddm.conf.d/00-hyprland.conf
sudo sed -i 's/kb_layout = us/kb_layout = fr/' ~/.config/hypr/hyprland.conf
sudo sed -i 's/autogenerated = 1 # remove this line to remove the warning//' ~/.config/hypr/hyprland.conf
sudo sed -i 's/bind = $mainMod, C, killactive,/bind = $mainMod, W, killactive,/' ~/.config/hypr/hyprland.conf
sudo sed -i 's/$menu = wofi --show drun/$menu = wofi -show drun/' ~/.config/hypr/hyprland.conf
sudo sed -i 's/bind = $mainMod, R,/bind = $mainMod, F,/' ~/.config/hypr/hyprland.conf

sudo sed -i 's/# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10/bind = $mainMod, F,/# Workspaces
bind = SUPER, ampersand, workspace, 1
bind = SUPER, eacute, workspace, 2
bind = SUPER, quotedbl, workspace, 3
bind = SUPER, apostrophe, workspace, 4
bind = SUPER, parenleft, workspace, 5
bind = SUPER, egrave, workspace, 6
bind = SUPER, minus, workspace, 7
bind = SUPER, underscore, workspace, 8
bind = SUPER, ccedilla, workspace, 9
bind = SUPER, agrave, workspace, 10


# Send to Workspaces
bind = SUPER_SHIFT, ampersand, movetoworkspace, 1
bind = SUPER_SHIFT, eacute, movetoworkspace, 2
bind = SUPER_SHIFT, quotedbl, movetoworkspace, 3
bind = SUPER_SHIFT, apostrophe, movetoworkspace, 4
bind = SUPER_SHIFT, parenleft, movetoworkspace, 5
bind = SUPER_SHIFT, egrave, movetoworkspace, 6
bind = SUPER_SHIFT, minus, movetoworkspace, 7
bind = SUPER_SHIFT, underscore, movetoworkspace, 8
bind = SUPER_SHIFT, ccedilla, movetoworkspace, 9
bind = SUPER_SHIFT, agrave, movetoworkspace, 10' ~/.config/hypr/hyprland.conf
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
