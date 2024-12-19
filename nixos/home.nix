{ config, pkgs, ... }:


let
  additionalJDKs = with pkgs; [ jdk8 jdk17 jdk21_headless ];
in
{
  home-manager.users.winterbear = {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      neofetch 
      btop
      #discord
      #webcord
      vesktop
      #starship
      #asciiquarium
      pipes
      neo
      #cbonsai
      tty-clock
      filezilla
      ani-cli
      obsidian
      #prismlauncher-unwrapped
      (prismlauncher.override { jdks = [ jdk8 jdk17 jdk21_headless ]; })
      aseprite-unfree
      spotify
      #spicetify-cli
      #vscode-fhs
      gimp
      jdk21_headless
      #openjdk17-bootstrap
      audacity
      steam
      lutris
      glfw
      _1password-gui
      oh-my-posh
      obs-studio
      kdenlive
      vlc
      blockbench
      krusader
      krename
      kompare
      zip 
      thunderbird # email client
      protonmail-bridge # bridge for connecting to proton imap/smtp servers
      xpipe # ssh connection manager
      jetbrains.idea-community #intellij
      handbrake # video encoding
      cifs-utils
      jdiskreport
      godot_4
      ldmtool
      #blender
    ];
    programs.oh-my-posh = {
      enable = true;
      useTheme = "amro";
      enableFishIntegration = true;
      #settings = builtins.fromJSON (builtins.unsafeDiscardStringContext ( "{ \"disable_notice\": true }" ) );
    };
    programs.fish = {
      enable = true;
      interactiveShellInit = "neofetch";
    };



    #programs.java = { /*...*/ };

    home.sessionPath = [ "$HOME/.jdks" ];
    home.file = (builtins.listToAttrs (builtins.map (jdk: {
    name = ".jdks/${jdk.version}";
    value = { source = jdk; };
    }) additionalJDKs));


  };


}
