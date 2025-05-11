# User packages configuration - can be updated separately from the system
{ config, lib, pkgs, ... }:

{
  # Ensure unfree packages are allowed
  nixpkgs.config.allowUnfree = true;

  # Define root packages
  users.users.root.packages = with pkgs; [
    # CLI Packages
    dig
    btop
    ripgrep
    ranger
    glances
    lazygit
    lazydocker
    zoxide
    tldr
    cheat
  ];


  # Define user packages
  users.users.hydra.packages = with pkgs; [
    # CLI Packages
    dig
    btop
    ripgrep
    ranger
    glances
    lazygit
    lazydocker
    zoxide
    tldr
    cheat

    # System Packages
    yakuake
    gimp
    audacity
    inkscape
    libreoffice
    vlc

    # Desktop packages
    discord-canary
    chromium
    vscode
    code-cursor
    bitwarden-desktop
    obsidian
    
    # Unstable packages
    unstable.claude-code
  ];

  # Other packages
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
    enableVirtualCamera = true;
  };
}
