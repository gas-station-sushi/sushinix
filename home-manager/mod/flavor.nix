{pkgs, ...}:
{
catppuccin = {
 pointerCursor = {
    enable = true;
    accent = "maroon";
    flavor = "mocha";};
 enable = true;
 accent = "maroon";
 flavor = "mocha";};

gtk = {
  enable = true;
  catppuccin = {
   enable = true;
   accent = "maroon";
   flavor = "mocha";
   gnomeShellTheme = true;
   icon = {
    enable = true;
    accent = "maroon";
    flavor = "mocha";};
     };
    };
home.packages = with pkgs; [
    (catppuccin-kde.override {
     flavour = ["mocha"];
     accents = ["maroon"];})
    (catppuccin-papirus-folders.override {
     flavor = "mocha";
     accent = "maroon";})
     ];
}
