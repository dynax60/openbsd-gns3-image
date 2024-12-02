#!/bin/sh
cat << EOF > openbsd.gns3a
{
    "name": "OpenBSD",
    "category": "router",
    "description": "The OpenBSD project produces a FREE, multi-platform 4.4BSD-based UNIX-like operating system. Our efforts emphasize portability, standardization, correctness, proactive security and integrated cryptography. As an example of the effect OpenBSD has, the popular OpenSSH software comes from OpenBSD.",
    "vendor_name": "OpenBSD",
    "vendor_url": "http://www.openbsd.org",
    "documentation_url": "http://www.openbsd.org/faq/index.html",
    "product_name": "OpenBSD",
    "registry_version": 1,
    "status": "experimental",
    "maintainer": "Denis S.Davydov",
    "maintainer_email": "dynax60@gmail.com",
    "usage": "User root, password gns3",
    "port_name_format": "em{1}",
    "qemu": {
        "adapter_type": "e1000",
        "adapters": 2,
        "ram": 1024,
        "hda_disk_interface": "virtio",
        "arch": "x86_64",
        "console_type": "telnet",
        "kvm": "require"
    },
    "images": [
        {
            "filename": "${VM_NAME}",
            "version": "${VERSION}-${ARCH}",
            "md5sum": "$(md5sum ${OUTPUT_DIR}/${VM_NAME} | cut -d ' ' -f1)",
            "filesize": $(wc -c < ${OUTPUT_DIR}/${VM_NAME})
        }
    ],
    "versions": [
        {
            "name": "${VERSION}-${ARCH}",
            "images": {
                "hda_disk_image": "${VM_NAME}"
            }
        }
    ]
}
EOF
