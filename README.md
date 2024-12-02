# openbsd-gns3-image

This script generates qcow2 OpenBSD image for using it as a GNS3 applience. Default root password is `gns3`.

## Prerequisites
```sh
sudo apt-get update
sudo apt-get install -y packer make qemu-system qemu-utils qemu-kvm libvirt-daemon-system virtinst libvirt-clients bridge-utils
```
## Usage

```sh
make
```

The image will be generated to the folder specified in the `OUTPUT_DIR` environment variable.

### Environment variables

The default environment variables are set to build the latest version of OpenBSD (deafult arch is i386). See Makefile.

* MAJOR_VERSION
* MINOR_VERSION
* ARCH (default is `i386`)
* VERSION (default is `$(MAJOR_VERSION).$(MINOR_VERSION)`)
* MIRROR (default is `https://mirror.yandex.ru/openbsd`)
* ISO_URL (default is `$(MIRROR)/$(VERSION)/$(ARCH)/install$(MAJOR_VERSION)$(MINOR_VERSION).iso`)
* ISO_CHECKSUM
* OUTPUT_DIR (default is `artifacts`)
* VM_NAME (default is `openbsd-$(VERSION)-$(ARCH).qcow2`)
