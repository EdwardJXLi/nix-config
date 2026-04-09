{ pkgs, unstable, ... }:

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

    # Unstable / Latest Packages
    unstable.claude-code
    unstable.codex
    unstable.gemini-cli-bin
  ];
}
