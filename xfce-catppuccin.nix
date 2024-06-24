{pkgs, ...}: {
  #Enables XFCE
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  environment.systemPackages =
    (with pkgs; [
      papirus-icon-theme
      gtk-engine-murrine
      catppuccin-gtk
      catppuccin-cursors.mochaSapphire
      catppuccin-kvantum
      lxqt.lxqt-config
    ])
    ++ (with pkgs.xfce; [
      xfce4-pulseaudio-plugin
      xfce4-whiskermenu-plugin
      xfce4-clipman-plugin
    ])
    ++ (with pkgs.libsForQt5; [
      ark
    ])
    ++ (with pkgs.kdePackages; [
      breeze
      qtstyleplugin-kvantum
    ]);

  programs = {
    thunar.plugins = with pkgs.xfce; [thunar-archive-plugin];
    partition-manager.enable = true;
  };
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "lxqt";
  };
}
