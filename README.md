# Dot Files

The folders in this repo are `stow` packages.

```sh
stow -t ~ alacritty atuin git kanata lazygit nvim starship zellij zsh
```

## Kanata

Setup instrucitons: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md

```sh
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER
```

```sh
sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF
```
```sh
systemctl --user daemon-reload
systemctl --user enable kanata.service
systemctl --user start kanata.service
systemctl --user status kanata.service
```

## Lazygit

On MacOS Lazygit configuration has to be in different a location.
```sh
stow -t ~/Library/Application\ Support lazygit/.config
```
