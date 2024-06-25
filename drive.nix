{
  fileSystems."swap" = {
    label = "swap";
    device = "UUID=93bde98e-ceef-4840-b025-c8629b319afe";
    fsType = "swap";
    options = ["nofail"];
  };

  fileSystems."/drive/hdd0" = {
    device = "UUID=188E4F328E4F07A8";
    fsType = "ntfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  fileSystems."/drive/hdd1" = {
    device = "UUID=b05a842b-19ff-4167-bf3c-0881c42ca735";
    fsType = "btrfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  fileSystems."/drive/hdd2" = {
    device = "UUID=daa54f38-5816-4e4c-bad8-9139fd7f1241";
    fsType = "btrfs";
    options = ["nofail"];
  };

  fileSystems."/drive/nvme" = {
    device = "UUID=79067b96-f698-4f7f-9ccb-267ff9dc7c37";
    fsType = "ext4";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  fileSystems."/drive/ssd" = {
    device = "UUID=1d0b3268-4938-47dc-947d-ee13fa6d07bf";
    fsType = "ext4";
    options = [
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };
}
