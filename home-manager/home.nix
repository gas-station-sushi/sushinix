{ config, pkgs, ... }:

{
 imports = [./mod/flavor.nix ./mod/program.nix];
  home = {
   username = "sushinix";
   stateVersion = "24.05";
   homeDirectory = "/home/sushinix";};

nixpkgs.config.allowUnfree = true;

home.packages = with pkgs; [
    kid3
    qbittorrent
    heroic
    libreoffice-fresh
    nil
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
