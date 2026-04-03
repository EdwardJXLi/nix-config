{ config, lib, pkgs, ... }:

let
  # Unfree packages
  unfree = import <nixpkgs> {
    config.allowUnfree = true;
  };

  # Unstable packages channel
  unstable = import <unstable> {
    config.allowUnfree = true;  # Allow unfree packages in unstable too
  };

  # Mozilla overlay for Firefox Nightly
  # moz-rev = "master";
  # moz-url = builtins.fetchTarball { url = "https://github.com/mozilla/nixpkgs-mozilla/archive/${moz-rev}.tar.gz";};
  moz-rev = "channel";
  moz-url = builtins.fetchTarball { url = "https://github.com/andersk/nixpkgs-mozilla/archive/${moz-rev}.tar.gz";};
  nightlyOverlay = (import "${moz-url}/firefox-overlay.nix");

  mozillaNightly = import <nixpkgs> {
    overlays = [ nightlyOverlay ];
  };

  # Create shorter aliases for nixGL wrapping
  wrapGL = config.lib.nixGL.wrap;
  wrapGlAll = packages: map wrapGL packages;
in {
  # Setup libGL to use system opengl
  nixGL.packages = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/nixGL/archive/main.tar.gz";
  }) { inherit pkgs; };

  nixGL.defaultWrapper = "mesa";  # Use mesa for AMD
  nixGL.installScripts = [ "mesa" ];  # Install nixGLMesa script
  nixGL.vulkan.enable = true;

  # Desktop packages
  home.packages = wrapGlAll (with pkgs; [
    # Core Apps
    audacity
    bitwarden-desktop
    boxbuddy
    emote
    gimp
    gparted
    inkscape
    krita
    libreoffice
    librewolf
    nwg-displays
    obs-studio
    podman-desktop
    vlc

    # KDE Apps
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.kate
    kdePackages.okular

    # Firefox Nightly
    mozillaNightly.latest.firefox-nightly-bin

    # Unfree Apps
    unfree.jetbrains.idea-ultimate
    unfree.obsidian
    unfree.slack

    # Unstable / Latest Packages
    unstable.antigravity
    unstable.chromium
    unstable.code-cursor
    unstable.discord-canary
    unstable.vicinae
    unstable.vscode
    unstable.zed-editor
  ]);

  # Fix cursors for Electron apps
  home.sessionVariables = {
    XCURSOR_SIZE = 24;
    XCURSOR_PATH = "/usr/share/icons";
  };
}
