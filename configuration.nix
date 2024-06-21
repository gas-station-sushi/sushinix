# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix ./xfce-catppuccin.nix ./drive.nix ./AMDAMD.nix
    ];

  networking.hostName = "nixiri"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
## System
  networking.networkmanager.enable = true;
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "es_MX.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
    enable = true;
    videoDrivers = ["amdgpu"];
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sushinix = {
    isNormalUser = true;
    description = "sushi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


#--- MY CONFIG --- 

  location.longitude = -101.9251;
  location.latitude = 21.3721;

## Services
  services = {
   locate.enable = true;
   resolved.enable = true;
   printing.enable = true;
   redshift.enable = true;
   geoclue2.enable = true;
   };

## Nix
  nix = {
   optimise.automatic = true;
   optimise.dates  = ["07:00"];
   settings.experimental-features = ["nix-command" "flakes"];
   };

## Boot
   boot = {
   loader.systemd-boot.enable = true;
   loader.efi.canTouchEfiVariables = true;
   supportedFilesystems =  [ "ntfs" ];
   };

## Programs

  programs = {
  neovim.enable = true;
  firefox.enable = true;
  steam.enable  = true;
  };
  
## Packages
  environment.systemPackages = with pkgs; [ 
  thunderbird wineWowPackages.full
  winetricks kitty findutils git vlc wget zip unzip kate python3 xdg-desktop-portal-gtk pavucontrol
  gnome.file-roller krita mesa dxvk hyfetch fastfetch nicotine-plus kdiskmark speedtest-cli clinfo cmake vimPlugins.lazy-nvim vimPlugins.LazyVim timeshift
  ];

## script to generate list with installed packages in /etc/current-system-packages
  environment.etc."current-system-packages".text =
  let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;
## Portals and Flatpak
  systemd.user.services.xdg-desktop-portal-gtk = {
      wantedBy = [ "xdg-desktop-portal.service" ];
      before = [ "xdg-desktop-portal.service" ];
    };
  services.flatpak.enable = true; 
    xdg.portal.xdgOpenUsePortal = true;
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      (pkgs.xdg-desktop-portal-gtk.override {
        # Do not build portals that we already have.
        buildPortalsInGnome = false;
      })
    ];
#--- END OF CONFIG ---


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
networking.firewall.allowedTCPPorts =
   [
    62177 32400 53266 
   ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
