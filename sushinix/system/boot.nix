{config, pkgs, ...}:

 let
  dm = "displayManager";
  de = "desktopManager";
 in
{

 boot = {
   loader = {
    #grub = {
      #enable = true;
      #device = "";
      #theme = "breeze";}
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    };
   initrd.kernelModules = ["amdgpu"];
   supportedFilesystems = ["ntfs"];
   };

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
   getty.autologinUser = "sushinix";
   "${dm}".sddm = {
     enable = true;
     wayland.enable = true;
     theme = "catppuccin-mocha";
     };
   "${de}".plasma6.enable = true;
    };

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;};
     pulseaudio.enable = false;
     };
  ## Services
  security.rtkit.enable = true;
  security.polkit.enable = true;

  }
