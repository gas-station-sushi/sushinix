# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./drive.nix
    ./system/boot.nix
    ./system/soft.nix
  ];

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sushinix = {
    isNormalUser = true;
    description = "sushinix";
    extraGroups = ["networkmanager" "wheel"];
  };

  ## Nix
  nix = {
    optimise.automatic = true;
    optimise.dates = ["07:00"];
    settings.experimental-features = ["nix-command" "flakes"];
    nixPath = [
   "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
   "nixos-config=/home/sushinix/nigiri/sushi.nix"
   "/nix/var/nix/profiles/per-user/root/channels"];
  };

  system.stateVersion = "24.05";
}
