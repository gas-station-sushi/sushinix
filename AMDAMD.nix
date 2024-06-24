{pkgs, ...}:
# Setup for my AMD Zen2 + AMD Navi PC
{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio.enable = false;
  };

  environment.systemPackages = with pkgs; [mangohud mesa-demos vulkan-tools];
  boot.initrd.kernelModules = ["amdgpu"];
}
