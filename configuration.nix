# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "littlejohn"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  security.sudo.wheelNeedsPassword = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  # };
  users.users.cgorshing = {
    isNormalUser = true;
    home = "/home/cgorshing";
    extraGroups = [ "wheel" ];
    # mkpasswd -m sha-512
    # https://nixpkgs-manual-sphinx-markedown-example.netlify.app/configuration/user-mgmt.xml.html
    hashedPassword = "$6$gK9ZH5bdBSfJ8B0.$B1FMzcFxK5FJ8dLP28cD9gu46ybLVqYuk5jD1xxd1TKX2wvlV9Eog6lwWqiaogOV7iFohbdg454GTtjxZZ0n0/";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE+htgAsQNydhZnQUxyZt/q77JhHS0hbwWT/5vfmQOSwe4keq/JmhpmoBDhvxEaKH4yP1kQBapSEQh0M/gkzT70Ajxd5re30ZTBt1ffILbGGnGPwOhyilBbtLAamoy/wvGzK6tI5Mgzl5HXFDc4DFbG/D+FJSY5ha6hbSM9VSwHeKfUISg/3kAxRx+CGkVbmxYSRcSonmf6LuELaRrlUWttJb9n08TxT0LBQMGJ0ubrYXB2eQurn+Qy+3i5I8hblv6LodVdZxMXMyNN9v0QHpo7dFR8aaBynbvZHXamrb54i+bPFo4fGWBffE1bokQIEjXnZ9CHuJmzTPrf1xnBhpYZffF3SkaBHet/Ppd29F3u+K2xft5+LX47jdlieBqh5YLjMdoRT771GluAkX6KRsc1wS4o1AFVEH/OrLHOaqWlWf5xc4replrrfnO8WJMIYEnL4kHKDkKizo4VGurmXwR4/Lh0DO3VVo+mDeuD5cR9jBLVTrDzzNKrkc3kotCSXc= cgorshing@Chads-iMac.local"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    git
    tmux
    unzip
    vim
    wget

    clang
    nodejs_18
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.settings.PermitRootLogin = "no";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

