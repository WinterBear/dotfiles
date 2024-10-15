{ config, pkgs, ... }:
{

  home-manager.users.winterbear = {
    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      neofetch
      btop
      #discord
      #webcord
      vesktop
      #starship
      #asciiquarium
      #pipes
      #neo
      #cbonsai
      tty-clock
      filezilla
      ani-cli
      obsidian
      prismlauncher-unwrapped
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
  };
}
