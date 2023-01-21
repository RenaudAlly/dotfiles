 # Screenshots

![rice1_colorscheme](https://user-images.githubusercontent.com/77428502/213889430-3a13219d-0802-48ed-b9f4-63e2313856cb.png)
![rice1_wayland_clients](https://user-images.githubusercontent.com/77428502/213889436-2b5f07a3-6f80-4a4b-9272-56b5d86efae0.png)
![rice1_hardware_stats](https://user-images.githubusercontent.com/77428502/213889437-c1d6a476-d2dc-4cf9-b953-7018fa581db4.png)
![rice1_neovim](https://user-images.githubusercontent.com/77428502/213889438-55892222-50f8-4234-a413-5cc255c11b5e.png)
![rice1_rofi](https://user-images.githubusercontent.com/77428502/213889439-ff998a7c-8d38-4a91-8f4e-cb8a8d8ecfdf.png)

# Recommended Usage
It is *highly* recommended to not blindly clone the configuration files. The repository is mainly meant for your reference for any configuration you like. Blindly downloading them will most likely not work, so be warned. The rice was created on a Microsoft Surface laptop so they Hyprland keybinds may NOT work for you.

# ⚠️ Warning 
The swayidle and swaylock in the code repository is NOT functional as of writing this. I am still working on getting Wayland to work with it. 

# Major required dependencies
Please refer to the git repositories of all the listed programs and install them using your favoured method. In my case, most of the programs were downloaded for all user or manually built to `~/Downloads`

The following are the window manager, bar, application finder, notification daemon, terminal, wallpaper support applications respectively.
```
yay -S hyprland-git waybar-hyprland-git rofi dunst kitty hyprpaper
```
Please note that you need the following to achieve other functionality such as taking screenshots, changing the backlight. changing volume on waybar
```
yay -S grim slurp swappy light pulseaudio
```
See the section below if you're interested in the terminal art and visualizers I have used. After that I have also linked the Spotify and Discord clients I showed in the rice.

# Terminal Art and Visualizers showcased
1. [Pipes: Animated pipes terminal screensaver](https://github.com/pipeseroni/pipes.sh)
2. [Lolcat: Rainbow coloring](https://github.com/busyloop/lolcat)
3. [Cbonsai: Bonsai tree generator](https://gitlab.com/jallbrit/cbonsai)
4. [Cmatrix: Matrix-like screensaver](https://github.com/abishekvashok/cmatrix)
5. [Cava: Audio visualizer](https://github.com/karlstav/cava)
6. [Btop: Resources Monitor](https://github.com/aristocratos/btop)

# Hyprland Clients
Please refer to the Hyprland [Wiki]([https://wiki.hyprland.org/](https://wiki.hyprland.org/Useful-Utilities/App-Clients/)) for more information on how to configure your App Clients (namely Spotify and Discord to work as intended. But here are the clients and themes I used respectively:

1. [Webcord](https://github.com/SpacingBat3/WebCord): Using the [Zelk](https://github.com/schnensch0/zelk/releases) theme
2. [Spotify](https://aur.archlinux.org/packages/spotify) with [spotifywm](https://github.com/amurzeau/spotifywm): Using [spicetify](https://github.com/spicetify/spicetify-cli)

# Theme
[decay-gtk](https://github.com/decaycs/decay-gtk): Follow the installation guide

# Credits
1. [iamverysimp1e](https://github.com/iamverysimp1e)'s dotfiles from which I got the jist of ricing!
2. [R/unixporn community](https://www.reddit.com/r/unixporn/)
