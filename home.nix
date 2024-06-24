{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    checkConfig = false;
    enable = true;
    xwayland = true;
    systemd.enable = true;
    wrapperFeatures.gtk = true;
    extraConfigEarly = "include catppuccin-mocha";
    config = rec {
      terminal = "kitty";
      menu = "fuzzel";
      modifier = "Mod4";
      input = {
        "*" = {
          xkb_layout = "latam";
        };
        "*" = {
          accel_profile = "flat";
        };
      };
      output = {
        HDMI-A-1 = {
          bg = "/home/sushinix/bg.png fill";
        };
      };
      colors = {
        background = "$base";
        placeholder = {
          background = "$base";
          text = "$text";
          indicator = "overlay0";
          border = "$overlay0";
          childBorder = "overlay0";
        };
        focused = {
          background = "$base";
          text = "$text";
          indicator = "$blue";
          border = "$sapphire";
          childBorder = "$blue";
        };
        focusedInactive = {
          background = "$base";
          text = "$text";
          indicator = "$blue";
          border = "$overlay0";
          childBorder = "$overlay0";
        };
        unfocused = {
          border = "$overlay0";
          background = "$surface0";
          text = "$text";
          indicator = "$blue";
          childBorder = "$overlay0";
        };
        urgent = {
          border = "$mauve";
          background = "$base";
          text = "$mauve";
          indicator = "$overlay0";
          childBorder = "$mauve";
        };
      };
      startup = [
        {command = "redshift";}
      ];
      bars = [
        {
          position = "bottom";
          # command = "waybar";
        }
      ];
    };
  };
  programs.fuzzel.enable = true;
  programs.kitty = {
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
      remember_window_size = false;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      getchvim = "sudo nix run github:getchoo/getchvim";
      homeswitch = "home-manager switch";
      nixswitch = "sudo nixos-rebuild switch";
      homebuild = "home-manager build";
      nixbuild = "sudo nixos-rebuild switch";
    };
  };

  xfconf.settings = {
    xfce4-session = {
      "/sessions/Failsafe/Client0_Command" = "-n -a -t string -s \"sway\"";
    };
  };

  services = {
    ssh-agent.enable = true;
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sushinix";
  home.homeDirectory = "/home/sushinix";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    kid3
    qbittorrent
    kdePackages.dolphin
    kate
    xorg.xwininfo
    heroic
    swaybg
    grim
    slurp
    sway-contrib.grimshot
    # swayfx
  ];

  programs.git = {
    enable = true;
    userName = "nigirix";
    userEmail = "sushicat777@proton.me";
  };

  # # It is sometimes useful to fine-tune packages, for example, by applying
  # # overrides. You can do that directly here, just don't forget the
  # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
  # # fonts?
  # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

  # # You can also create simple shell scripts directly inside your
  # # configuration. For example, this adds a command 'my-hello' to your
  # # environment:
  # (pkgs.writeShellScriptBin "my-hello" ''
  #   echo "Hello, ${config.home.username}!"
  # '')

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
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
