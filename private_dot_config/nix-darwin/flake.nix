{
    description = "My Darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
        let
            configuration = { pkgs, ... }: {
                # List packages installed in system profile. To search by name, run:
                # $ nix-env -qaP | grep wget
                environment.systemPackages =
                    [ pkgs.vim
                    ];

                services.nix-daemon.enable = true;
                nix.settings.experimental-features = "nix-command flakes";
                programs.fish = {
                    enable = true;
                    shellAliases = {
                        hm-switch = "darwin-rebuild switch --impure --flake ~/dotfiles/nix-darwin";
                    };
                };
                system.configurationRevision = self.rev or self.dirtyRev or null;
                system.stateVersion = 5;
                nixpkgs.hostPlatform = "aarch64-darwin";
                security.pam.enableSudoTouchIdAuth = true;

                users.users.hm.home = "/Users/hm";
                home-manager.backupFileExtension = "backup";
                nix.configureBuildUsers = true;
                nix.useDaemon = true;
            };
        in
            {
            # Build darwin flake using:
            # $ darwin-rebuild build --flake .#hm
            darwinConfigurations."hm" = nix-darwin.lib.darwinSystem {
                modules = [ 
                    configuration
                    home-manager.darwinModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.hm = import ./home.nix;
                    }
                ];     
            };

            # Expose the package set, including overlays, for convenience.
            darwinPackages = self.darwinConfigurations."hm".pkgs;
        };
}
