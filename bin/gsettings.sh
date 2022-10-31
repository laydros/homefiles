#!/bin/sh

# for gnome and unity, allow resize with right button
echo "Allow gnome resize with right mouse button, set alt as modifier"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'

echo "Set gnome to use emacs style keybindings"
gsettings set org.gnome.desktop.interface gtk-key-theme 'Emacs'

echo 'Enable hot corner for overview'
gsettings set org.gnome.desktop.interface enable-hot-corners true

echo "Set gnome workspace and window management to a mix of pop-os and regolith style"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Shift><Alt>j', '<Super><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Shift><Alt>k', '<Super><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Primary><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Primary><Super>Up']"

gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Primary><Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right  "['<Primary><Super>Right']"

echo "Set some gnome launch shortcuts to regolith style"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>c']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super><Shift>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super><Shift>n']"

