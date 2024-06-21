{

 fileSystems."/drive/hdd" = {
   device = "UUID=188E4F328E4F07A8";
   fsType = "ntfs";
   options = [ # If you don't have this options attribute, it'll default to "defaults" 
     # boot options for fstab. Search up fstab mount options you can use
     "nofail" # Prevent system from failing if this drive doesn't mount
     
   ];
 };

 #fileSystems."/drive/hdd-zfs" = {
  # device = "UUID=4038374765573927695";
   #fsType = "zfs";
   #options = [ # If you don't have this options attribute, it'll default to "defaults" 
     # boot options for fstab. Search up fstab mount options you can use
     #"nofail" # Prevent system from failing if this drive doesn't mount
     
   #];
 #};

 fileSystems."/drive/nvme" = {
   device = "UUID=79067b96-f698-4f7f-9ccb-267ff9dc7c37";
   fsType = "ext4";
   options = [ # If you don't have this options attribute, it'll default to "defaults" 
     # boot options for fstab. Search up fstab mount options you can use
     "nofail" # Prevent system from failing if this drive doesn't mount
     
   ];
 };

 fileSystems."/drive/ssd" = {
   device = "UUID=1d0b3268-4938-47dc-947d-ee13fa6d07bf";
   fsType = "ext4";
   options = [ "nofail" # Prevent system from failing if this drive doesn't mount
   ];
 };

  fileSystems."/drive/hdd1" = {
    device = "UUID=b05a842b-19ff-4167-bf3c-0881c42ca735";
    fsType = "btrfs";
    options = [ # If you don't have this options attribute, it'll default to "defaults" 
      # boot options for fstab. Search up fstab mount options you can use
      "nofail" # Prevent system from failing if this drive doesn't mount
     
   ];
 };


}

