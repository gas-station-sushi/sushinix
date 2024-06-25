{pkgs, ...}:
{
 nixpkgs.config.allowUnfree = true;
 programs = {
    git.enable = true;
    firefox.enable = true;
    neovim.enable = true;
    steam.enable = true;
    dconf.enable = true;
    partition-manager.enable = true;
    kdeconnect.enable = true;
  };

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

networking =  {
    hostName = "sushinix";
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [32400 53266];
      allowedUDPPorts = [32400 53266];
      enable = true;
    };
    nftables.enable = true;
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


  }
