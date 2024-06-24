{pkgs, ...}:
# Setup for my AMD Zen2 + AMD Navi PC
{
  hardware = {
    # amdgpu.amdvlk.enable = true;
    # amdgpu.amdvlk.support32Bit.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [khronos-ocl-icd-loader];
      driSupport32Bit = true;
    };
    pulseaudio.enable = false;
  };

  environment.systemPackages = with pkgs; [mangohud mesa-demos vulkan-tools];
  boot.initrd.kernelModules = ["amdgpu"];
  # services.ollama.acceleration = "rocm";
}
