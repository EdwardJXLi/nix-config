{ pkgs, ... }:

{
  # Base / core system packages
  home.packages = with pkgs; [
    # Shell & Terminal Utilities
    bash
    file
    git
    less
    screen
    tmux
    zsh

    # Text Editors
    nano
    neovim
    vim

    # Networking & Internet
    curl
    dig
    netcat
    openssh
    wget

    # System Tools & Utilities
    btop
    htop
    neofetch
    nettools
    lsof
    p7zip
    rsync
    smartmontools
    tree
    unzip
    which
    zip
  ];
}
