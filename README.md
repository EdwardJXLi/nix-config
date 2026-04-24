# Edward Li's Nix Config

My personal [Home Manager](https://github.com/nix-community/home-manager) flake used across my linux systems!

## Main Contents

- `flake.nix` - flake inputs for `hydra` (my main user account) and `root`
- `hydra.nix` - Home Manager config for the `hydra` user (imports base, extras, desktop)
- `root.nix` - Home Manager config for the `root` user (imports base, extras)
- `base.nix` - core CLI packages (shell, editors, networking, system tools)
- `extras.nix` - extra CLI tools, dev packages, etc.
- `desktop.nix` - GUI applications
