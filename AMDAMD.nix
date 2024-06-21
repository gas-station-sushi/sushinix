{ pkgs, ... }:
 # Setup for my AMD Zen2 + AMD Navi PC
{
  #services = {
   #;
   #};
 hardware.amdgpu.amdvlk.enable = true;
 hardware.amdgpu.amdvlk.support32Bit.enable = true;
 hardware.opengl = { 
 extraPackages = (with pkgs; [ rocmPackages.clr amdvlk driversi686Linux.amdvlk]);
 driSupport32Bit = true;
 };
 environment.systemPackages = with pkgs; [ mangohud goverlay mesa-demos vulkan-tools ];
 boot.initrd.kernelModules = [ "amdgpu" ];
 services.ollama.acceleration = "rocm";
}
