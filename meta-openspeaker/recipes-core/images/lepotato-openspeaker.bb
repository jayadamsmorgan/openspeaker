SUMMARY = "A console-only image that fully supports the target device \
hardware."

IMAGE_INSTALL = "\
    systemd \
    packagegroup-core-boot \
    kernel-image \
    kernel-modules \
    kernel-devicetree \
    linux-firmware \
    openspeaker \
    qtvirtualkeyboard \
    qtquickcontrols2 \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

LICENSE = "MIT"

IMAGE_ROOTFS_SIZE = "2194304"

inherit core-image

ROOTFS_POSTPROCESS_COMMAND += "remove_tty1_service; "

# remove getty@tty1.service and getty@.service
remove_tty1_service () {
    rm -f ${IMAGE_ROOTFS}/lib/systemd/system/getty@.service
    rm -f ${IMAGE_ROOTFS}/etc/systemd/system/getty.target.wants/getty@tty1.service
}
