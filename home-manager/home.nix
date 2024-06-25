{ config, pkgs, catppuccin, ... }:

{
 imports = [./flavor.nix];
  home = {
   username = "sushinix";
   stateVersion = "24.05";
   homeDirectory = "/home/sushinix";};

programs = {
   home-manager.enable = true;
   kitty = {
     enable = true;
     theme = "Catppuccin-Mocha";
     settings = {
       linux_display_server = "x11";
       tab_bar_min_tabs = 1;
       tab_bar_edge = "bottom";
       tab_bar_style = "powerline";
       tab_powerline_style = "slanted";
       initial_window_width = "85c";
       initial_window_height = "25c";
       remember_window_size = false;};
  };
  bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      getchvim = "sudo nix run github:getchoo/getchvim";
      homeswitch = "home-manager switch";
      nixswitch = "sudo nixos-rebuild switch";
      homebuild = "home-manager build";
      nixbuild = "sudo nixos-rebuild switch";};
  };
 };



home.packages = with pkgs; [
    kid3
    qbittorrent
    heroic
    libreoffice-fresh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sushinix/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {# EDITOR = "emacs";
   };
}
