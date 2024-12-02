packer {
  required_plugins {
    qemu = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

source "qemu" "openbsd" {
  iso_url           = "${var.iso_url}"
  iso_checksum      = "${var.iso_checksum}"
  output_directory  = "${var.output_dir}"
  shutdown_command  = "/sbin/halt -p"
  vm_name           = "${var.vm_name}"
  headless          = "true"
  qemuargs          = [
    ["-m", "512M"],
    ["-serial", "mon:stdio"]
  ]
  disk_size         = "2000M"
  format            = "qcow2"
  accelerator       = "kvm"
  http_directory    = "http"
  ssh_username      = "root"
  ssh_password      = "gns3"
  ssh_timeout       = "20m"
  net_device        = "virtio-net"
  disk_interface    = "virtio"
  boot_wait         = "60s"
  boot_command      = [
    "A<enter><wait5s>",
    "http://{{ .HTTPIP }}:{{ .HTTPPort }}/auto_install.conf<enter>"
  ]
}

build {
  sources = ["source.qemu.openbsd"]
  provisioner "file" {
    source = "files/boot.conf"
    destination = "/etc/boot.conf"
  }
  provisioner "shell" {
    inline = [
      "perl -pi -e 'if (/^tty00/) { s/9600/115200/; s/unknown/vt220/; s/off/on secure/; }' /etc/ttys",
      "echo ${var.mirror} > /etc/installurl",
      "pkg_add -r vim--no_x11 arping mtr-- zsh py3-pip wget curl jq jo",
      "rcctl disable sndiod",
      "rcctl disable snmpd"
    ]
  }
}
