# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./xfce-catppuccin.nix
    ./drive.nix
    ./AMDAMD.nix
  ];
  networking = {
    hostName = "sushinix";
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [32400 53266];
      allowedUDPPorts = [32400 53266];
      enable = true;
    };
    nftables.enable = true;
  };
  virtualisation.libvirtd.enable = true;

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "es_MX.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
    enable = true;
  };

  # Configure console keymap
  console.keyMap = "la-latin1";
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.sushinix = {
    isNormalUser = true;
    description = "sushi";
    extraGroups = ["networkmanager" "wheel"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #--- MY CONFIG ---

  location.longitude = ;
  location.latitude = ;

  ## Services
  services = {
    locate.enable = true;
    resolved.enable = true;
    printing.enable = true;
    redshift.enable = true;
    geoclue2.enable = true;
    flatpak.enable = true;
    sonarr.enable = true;
    radarr.enable = true;
    jackett.enable = true;
    plex.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;
  ## Nix
  nix = {
    optimise.automatic = true;
    optimise.dates = ["07:00"];
    settings.experimental-features = ["nix-command" "flakes"];
  };

  ## Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = ["ntfs"];
  };

  ## Programs

  programs = {
    neovim.enable = true;
    firefox.enable = true;
    steam.enable = true;
    virt-manager.enable = true;
  };

  ## Packages
  environment = {
    systemPackages = with pkgs; [
      thunderbird
      wineWowPackages.full
      winetricks
      vlc
      wget
      zip
      unzip
      python3
      xdg-desktop-portal-gtk
      pavucontrol
      krita
      hyfetch
      nicotine-plus
      kdiskmark
      speedtest-cli
      cmake
      timeshift
    ];
    ## script to generate list with installed packages in /etc/current-system-packages
    etc."current-system-packages".text = let
      packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
      sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
      formatted = builtins.concatStringsSep "\n" sortedUnique;
    in
      formatted;
  };
  ## Portals
  systemd.user.services.xdg-desktop-portal-gtk = {
    wantedBy = ["xdg-desktop-portal.service"];
    before = ["xdg-desktop-portal.service"];
  };
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      (pkgs.xdg-desktop-portal-gtk.override {
        # Do not build portals that we already have.
        buildPortalsInGnome = false;
      })
    ];
  };
  system.stateVersion = "24.05";
}
