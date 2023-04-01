#!bin/sh

aurhelper () {
    cd /tmp/
    curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
    tar xvzf yay.tar.gz
    cd yay
    makepkg -sci --noconfirm
}

installpkgs () {
    # xorg
    pkgs="xorg-server xorg-xwininfo xorg-xprop xorg-xdpyinfo"
    pkgs="$pkgs xorg-xset xorg-xsetroot xorg-xinit xterm"
    # nvidia
    pkgs="$pkgs lib32-nvidia-utils"
    pkgs="$pkgs vulkan-icd-loader lib32-vulkan-icd-loader"
    # core
    pkgs="$pkgs xcape mlocate man-db zip unzip unrar dosfstools ntfs-3g"
    pkgs="$pkgs xclip xdo xdotool mediainfo bc tree"
    # audio
    pkgs="$pkgs wireplumber pipewire-pulse pulsemixer"
    # fonts
    pkgs="$pkgs ttc-iosevka ttc-iosevka-aile"
    # others
    pkgs="$pkgs yt-dlp ffmpeg maim sxiv xwallpaper imagemagick"
    pkgs="$pkgs newsboat picom mpd mpc mpv ncmpcpp"
    pkgs="$pkgs zathura zathura-pdf-mupdf poppler python-adblock cronie"
    pkgs="$pkgs dunst libnotify gucharmap htop discord"
    pkgs="$pkgs qutebrowser qrencode steam transmission-cli"
    # lib32 needed for lutris
    pkgs="$pkgs wine-staging lib32-giflib lib32-libpng lib32-gnutls lib32-mpg123"
    pkgs="$pkgs lib32-openal lib32-v4l-utils lib32-libpulse lib32-libjpeg-turbo"
    pkgs="$pkgs lib32-libxcomposite lib32-libgcrypt lib32-libxinerama ocl-icd lib32-ocl-icd"
    pkgs="$pkgs lib32-libxslt lib32-libva lib32-gtk3 lib32-gst-plugins-base-libs lutris"
    daemon="cronie"
    # aur pkgs
    pkgs="$pkgs tremc-git lf-git"
    # emojify libxft-bgra
    yay --needed --noconfirm -Syu $pkgs
    yes | yay -S libxft-bgra-git
    # system daemon
    systemctl enable $daemon
}

# Arch aur helper yay
aurhelper

# Install all listed packages
installpackages

echo '\033[0;32mPackages installation completed please run ./2_dotsetup.sh'