# User packages configuration - can be updated separately from the system
{ config, lib, pkgs, ... }:

{
  # Ensure unfree packages are allowed
  nixpkgs.config.allowUnfree = true;

  # Define user packages
  users.users.hydra.packages = with pkgs; [
    # Main system packages
    yakuake
    discord-canary
    chromium
    code-cursor
    bitwarden-desktop
    gimp
    audacity
    obsidian
    libreoffice
    
    # Unstable packages
    unstable.claude-code
  ];
}
