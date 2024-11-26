# home.nix
# home-manager switch 
{ config, pkgs, ... }:

{
    home.username = "hm";
    home.homeDirectory = "/Users/hm";
    home.stateVersion = "23.05"; # Please read the comment before changing.

    # Makes sense for user specific applications that shouldn't be available system-wide
    #  home.packages = [
    #];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
        ".config/fish".source = ~/dotfiles/fish;
        ".config/wezterm".source = ~/dotfiles/wezterm;
        ".config/starship".source = ~/dotfiles/starship;
        ".config/nvim".source = ~/dotfiles/nvim;
        ".config/nix".source = ~/dotfiles/nix;
        ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
        ".config/tmux".source = ~/dotfiles/tmux;
    };

    home.sessionVariables = {
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_DIRS = "/etc/xdg";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_DIRS = "/usr/local/share/:/usr/share/";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_STATE_HOME = "$HOME/.local/state";
    };
    programs.git = {
        enable = true;
        userName = "Oleg Vastaev";
        userEmail = "olegvastaev@gmail.com";
        ignores = [ ".DS_Store" ];
        extraConfig = {
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
        };
    };
    home.sessionPath = [
        "/run/current-system/sw/bin"
        "$HOME/.nix-profile/bin"
    ];

    programs.home-manager.enable = true;
    programs.fish = {
        enable = true;
        shellAliases = {
            hm-switch = "darwin-rebuild switch --impure --flake ~/dotfiles/nix-darwin";
        };
    };
}

