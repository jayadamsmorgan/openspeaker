#!/bin/bash

# Detect the operating system
OS=$(uname -s)

if [ "$OS" = "Linux" ]; then
    if [ -f /etc/debian_version ]; then
        DISTRO=$(lsb_release -is)

        if [ "$DISTRO" = "Ubuntu" ] || [ "$DISTRO" = "Debian" ]; then
            echo "Detected $DISTRO. Installing prerequisites..."
            sudo apt-get update
            sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
                build-essential chrpath socat libsdl1.2-dev xterm

        fi

    elif [ -f /etc/fedora-release ]; then
        echo "Detected Fedora. Installing prerequisites..."
        sudo dnf install -y gawk make wget tar bzip2 gzip python unzip perl patch \
            diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
            ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue socat \
            findutils which SDL-devel xterm

    elif [ -f /etc/SuSE-release ]; then
        echo "Detected OpenSUSE. Installing prerequisites..."
        sudo zypper install -y python gcc gcc-c++ git chrpath make wget python-xml \
            diffstat makeinfo python-curses patch socat libSDL-devel xterm

    elif [ -f /etc/centos-release ]; then
        echo "Detected CentOS. Installing prerequisites..."
        sudo yum install -y gawk make wget tar bzip2 gzip python unzip perl patch \
            diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
            perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue SDL-devel xterm

    else
        echo "Unsupported Linux distribution."
        exit 1
    fi
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

echo "Prerequisites installation completed."
