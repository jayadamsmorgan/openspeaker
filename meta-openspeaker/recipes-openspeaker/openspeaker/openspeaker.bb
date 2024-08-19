SUMMARY = "Qt Simple Calculator Application Recipe"
DESCRIPTION = "This recipe builds a Qt project for a simple calculator application."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtbase"
SRC_URI = " \
    file://openspeaker.service \
    file://eglfs.json \
    git://github.com/jayadamsmorgan/openspeaker.git;branch=master;protocol=https \
    "
SRCREV = "${AUTOREV}"

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "openspeaker.service"

S = "${WORKDIR}/git"

FILES:${PN} += " ${systemd_system_unitdir} ${systemd_system_unitdir}/openspeaker.service ${bindir}/simpleCalculator"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 openspeaker-qt ${D}${bindir}

    install -d ${D}/${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/openspeaker.service ${D}/${systemd_system_unitdir}

    install -d ${D}/${sysconfdir}
    install -m 0644 ${WORKDIR}/eglfs.json ${D}/${sysconfdir}
}

inherit qmake5 systemd
