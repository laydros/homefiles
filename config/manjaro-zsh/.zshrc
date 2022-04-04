# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
if [ -e /home/laydros/.nix-profile/etc/profile.d/nix.sh ]; then . /home/laydros/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
