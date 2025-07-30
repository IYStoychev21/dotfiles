{ config, pkgs, ... }:

{
  home.username = "vankata";
  home.homeDirectory = "/home/vankata";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    alacritty
    fish
    matugen
    rofi-wayland
    waybar
    zed-editor
    dunst
    zellij
    starship
    docker
    rustc
    cargo
    go
    libgcc
    python3Full
    bun
    nodejs_24
    virt-manager
    qemu
    pipewire
    kitty
    xfce.thunar
    xfce.thunar-volman
    gvfs
    flatpak
    spotify
    vesktop
    git
    lazygit
    bruno
    wget
    appimage-run
    libarchive
    unzip
    gdm
    pfetch
    font-manager
    eza
    mpvpaper
    playerctl
    waypaper
    udisks
    pamixer
    nwg-look
    kdePackages.qt6ct
    kdePackages.ark
    btop
    sass
    cmake
    gnumake
    sassc
    swaylock-effects
    sway-contrib.grimshot
    gimp
    libreoffice-qt6-fresh
    looking-glass-client
    inotify-tools
    gnome-calendar
    edk2
    OVMF
    qbittorrent
    parsec-bin
    pgadmin4
    vscode
    obsidian
    vlc
    ags
    glib
    astal.hyprland
    astal.io
    astal.gjs
    json-glib
  ];

  programs.home-manager.enable = true;
}

