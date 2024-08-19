#!/bin/bash

# Define the directories and branches
POKY_DIR="poky"
POKY_REPO="git://git.yoctoproject.org/poky"
POKY_BRANCH="nanbield"

META_OPENEMBEDDED_DIR="$POKY_DIR/meta-openembedded"
META_OPENEMBEDDED_REPO="https://github.com/openembedded/meta-openembedded"
META_OPENEMBEDDED_BRANCH="nanbield"

META_QT5_DIR="$POKY_DIR/meta-qt5"
META_QT5_REPO="https://github.com/meta-qt5/meta-qt5"
META_QT5_BRANCH="nanbield"

META_MESON_DIR="$POKY_DIR/meta-meson"
META_MESON_REPO="https://github.com/superna9999/meta-meson"
META_MESON_BRANCH="nanbield"

META_OPENSPEAKER_DIR="../../meta-openspeaker"
LOCAL_CONF="../../conf/local.conf"

# Clone repositories if they don't exist
clone_repo() {
    local dir="$1"
    local repo="$2"
    local branch="$3"

    if [ ! -d "$dir" ]; then
        echo "Cloning $repo into $dir..."
        git clone -b "$branch" "$repo" "$dir"
    else
        echo "Repository $dir already exists. Skipping clone."
    fi
}

# Clone necessary repositories
clone_repo "$POKY_DIR" "$POKY_REPO" "$POKY_BRANCH"
clone_repo "$META_OPENEMBEDDED_DIR" "$META_OPENEMBEDDED_REPO" "$META_OPENEMBEDDED_BRANCH"
clone_repo "$META_QT5_DIR" "$META_QT5_REPO" "$META_QT5_BRANCH"
clone_repo "$META_MESON_DIR" "$META_MESON_REPO" "$META_MESON_BRANCH"

# Enter the poky directory
cd "$POKY_DIR" || { echo "Failed to change directory to $POKY_DIR"; exit 1; }

# Source the environment
echo "Setting up Yocto build environment..."
source oe-init-build-env

# Add layers if they are not already added
add_layer_if_not_present() {
    local layer="$1"

    if ! bitbake-layers show-layers | grep -q "$layer"; then
        echo "Adding layer $layer..."
        bitbake-layers add-layer "$layer"
    else
        echo "Layer $layer is already added. Skipping."
    fi
}

# Add necessary layers
add_layer_if_not_present "../meta-meson"
add_layer_if_not_present "../meta-openembedded/meta-oe"
add_layer_if_not_present "../meta-qt5"
add_layer_if_not_present "$META_OPENSPEAKER_DIR"

# Copy local.conf if it exists
if [ -f "$LOCAL_CONF" ]; then
    echo "Copying local.conf..."
    cp "$LOCAL_CONF" conf/local.conf
else
    echo "local.conf not found at $LOCAL_CONF. Skipping copy."
fi

# Build the image
echo "Starting build for lepotato-openspeaker..."
bitbake lepotato-openspeaker

