{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qemu
    qemu_kvm
    adwaita-icon-theme
  ];
  programs.virt-manager.enable = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
      };
    };
  };
}
