{ config, lib, pkgs, unstable, nixgl, ... }:

let
  # Create shorter aliases for nixGL wrapping
  wrapGL = config.lib.nixGL.wrap;
  wrapGlAll = packages: map wrapGL packages;
in {
  # Setup libGL to use system opengl
  targets.genericLinux.nixGL.packages = nixgl.packages.${pkgs.stdenv.hostPlatform.system};

  targets.genericLinux.nixGL.defaultWrapper = "mesa";  # Use mesa for AMD
  targets.genericLinux.nixGL.installScripts = [ "mesa" ];  # Install nixGLMesa script
  targets.genericLinux.nixGL.vulkan.enable = true;

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

    # Unfree Apps
    jetbrains.idea
    obsidian
    slack

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
