{ pkgs, unstable, master, ... }:

{
  # Extra / non-required packages
  home.packages = with pkgs; [
    # CLI Tools
    asciinema
    asciinema-agg
    distrobox-tui
    glances
    lazygit
    lynx
    nix-search-cli
    nh
    podman-tui
    radeontop
    shell-gpt
    smartmontools
    tldr
    usbutils
    zellij
    zoxide

    # Development Packages
    buildah
    corepack
    direnv
    distrobox
    gdb
    nodejs_24
    rustup
    podman
    podman-compose
    python313
    qemu
    uv

    # Unfree Packages
    rar

    # Bleeding Edge Latest Packages
    master.claude-code
    master.codex
    master.gemini-cli-bin
  ];
}
