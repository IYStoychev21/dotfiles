{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelModules = [ "vfio" "vfio_pci" "vfio_iommu_type1" "vfio_virqfd" ];
    kernelParams = [ "intel_iommu=on" "iommu=pt" "vfio-pci.ids=10de:2702,10de:22bb" ];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time = {
    timeZone = "Europe/Sofia";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  users.users.vankata = {
    isNormalUser = true;
    description = "Ivan Stoychev";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };

  services = {
    envfs.enable = true;
    openssh.enable = true;
    flatpak.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    devmon.enable = true;
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };
  };

  programs = {
    nix-ld.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    thunar.enable = true;
    xfconf.enable = true;
    virt-manager.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMF ];
        };
      };
    };
    virtualbox.host.enable = false;
  };

  system.stateVersion = "25.05";
}

