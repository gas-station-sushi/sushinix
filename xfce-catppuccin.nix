 { pkgs,  ... }:
 {
 #Enables XFCE
 services.xserver.displayManager.lightdm.enable = true;
 services.xserver.desktopManager.xfce.enable = true;

 environment.systemPackages = (with pkgs; [
  papirus-icon-theme gtk-engine-murrine catppuccin-gtk catppuccin-qt5ct catppuccin-cursors.mochaSapphire catppuccin catppuccin-kvantum themechanger
  ])
  ++ (with pkgs.xfce; [
   xfce4-pulseaudio-plugin xfce4-whiskermenu-plugin xfce4-clipman-plugin
  ]) 
  ++ (with pkgs.libsForQt5; [
   qt5ct qtstyleplugin-kvantum
  ])
  ++ (with pkgs.kdePackages; [
  breeze qt6ct qtstyleplugin-kvantum
  ]);
 
 programs = { 
  thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin ];
  partition-manager.enable = true; };
 qt = { 
   enable = true;
   style = "kvantum";
   platformTheme = "qt5ct" ;
   };
 environment.variables= {
  QT_QPA_PLATFORMTHEME = "qt5ct"; };
}
