{
  self,
  pkgs,
  ...
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

  # ターミナル用: 日本語 + Nerd Font（UDEV Gothic NF）
  fonts.packages = [ pkgs.udev-gothic-nf ];

  system.defaults = {
    # F1–F12 をそのままファンクションキーとして使う（明るさ等は Fn + Fキー）
    NSGlobalDomain."com.apple.keyboard.fnState" = true;

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
    };
    dock = {
      show-recents = false;
    };
  };
}
