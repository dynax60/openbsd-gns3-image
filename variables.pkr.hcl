variable "iso_url" {
  type = string
  default = "${env("ISO_URL")}"
  validation {
    condition     = length(var.iso_url) > 0
    error_message = <<EOF
The ISO_URL environment variable must be set.
EOF
  }
}

variable "iso_checksum" {
  type = string
  default = "${env("ISO_CHECKSUM")}"
  validation {
    condition     = length(var.iso_checksum) > 0
    error_message = <<EOF
The ISO_CHECKSUM environment variable must be set.
EOF
  }
}

variable "vm_name" {
  type = string
  default = "${env("VM_NAME")}"
  validation {
    condition     = length(var.vm_name) > 0
    error_message = <<EOF
The VM_NAME environment variable must be set.
EOF
  }
}

variable "output_dir" {
  type = string
  default = "${env("OUTPUT_DIR")}"
  validation {
    condition     = length(var.output_dir) > 0
    error_message = <<EOF
The OUTPUT_DIR environment variable must be set.
EOF
  }
}

variable "mirror" {
  type = string
  default = "${env("MIRROR")}"
  validation {
    condition     = length(var.mirror) > 0
    error_message = <<EOF
The MIRROR environment variable must be set.
EOF
  }
}
