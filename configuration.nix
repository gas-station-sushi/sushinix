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
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["ntfs"];
  networking.hostName = "sushinix"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    desktopManager.wallpaper.mode = "~/bg.png";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sushinix = {
    isNormalUser = true;
    description = "sushinix";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };
  services = {
    getty.autologinUser = "sushinix";
    displayManager.sddm = {
     enable = true;
     theme = "catppuccin-sddm";};
    desktopManager.plasma6.enable = true;
  };
  programs = {
    git.enable = true;
    firefox.enable = true;
    neovim.enable = true;
    steam.enable = true;
    dconf.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    hyfetch
    wineWowPackages.full
    winetricks
    vlc
    wget
    zip
    unzip
    pavucontrol
    krita
    hyfetch
    nicotine-plus
    speedtest-cli
    cmake
    timeshift
    mesa-demos
    vulkan-tools
    (catppuccin-sddm.override {
     flavor = "mocha";
     loginBackground = true; })
  ];


  #--- MY CONFIG ---

  #location.longitude = ;
  #location.latitude = ;
  hardware = {
   opengl = {
    enable = true;
    driSupport32Bit = true;
    };
    pulseaudio.enable = false;
    };
    boot.initrd.kernelModules = ["amdgpu"];
  ## Services
  services = {
    locate.enable = true;
    resolved.enable = true;
    printing.enable = true;
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
