{
  self, ...
}:
{
  users.users."sarukiti".home = "/Users/sarukiti";
  imports = [
    ./home_manager.nix
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;

  system.primaryUser = "sarukiti";
  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
    };
    dock = {
      show-recents = false;
    };
  };
}
