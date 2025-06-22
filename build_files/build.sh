#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y hidapi net-snmp-utils rclone gdb butane minicom java-latest-openjdk java-latest-openjdk-devel java-latest-openjdk-headless v4l-utils flac id3v2

dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y install cosmic-desktop
dnf5 -y copr disable ryanabx/cosmic-epoch

dnf5 -y install gnome-keyring gvfs gvfs-smb gvfs-archive gvfs-afc gvfs-afp

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket
