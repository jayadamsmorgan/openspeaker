#!/bin/bash

# Function to list available disk devices
list_devices() {
    echo "Available disk devices:"
    lsblk -d -o NAME,SIZE,MODEL | grep -vE "loop|sr"
}

# Function to confirm the selected device
confirm_device() {
    local device="$1"
    echo "You have selected /dev/$device. All data on this device will be erased!"
    read -r -p "Are you sure you want to proceed? (yes/no): " confirm
    if [ "$confirm" != "yes" ]; then
        echo "Aborting."
        exit 1
    fi
}

# Function to flash the image to the device
flash_image() {
    local image="$1"
    local device="$2"

    echo "Flashing $image to /dev/$device..."
    sudo dd if="$image" of="/dev/$device" bs=4M status=progress
    sync

    echo "Flashing completed."
}

# Function to flash U-Boot to the device
flash_uboot() {
    local uboot_image="$1"
    local device="$2"

    echo "Flashing U-Boot from $uboot_image to /dev/$device..."
    sudo dd if="$uboot_image" of="/dev/$device" bs=512 seek=1
    sync

    echo "U-Boot flashing completed."
}

# Main script logic
echo "=== Flash WIC Image and U-Boot to SD Card ==="
echo ""

# Step 1: List available disk devices
list_devices

# Step 2: Ask user to specify the device
read -r -p "Enter the device name (e.g., sdb): " device

# Step 3: Confirm the selected device
confirm_device "$device"

# Step 4: Define the WIC image and U-Boot paths
wic_image="poky/build/tmp/deploy/images/libretech-cc/lepotato-openspeaker-libretech-cc.rootfs.wic"
uboot_image="uboot/aml-s905x-cc"

# Step 5: Flash the WIC image to the device
flash_image "$wic_image" "$device"

# Step 6: Flash U-Boot to the device
flash_uboot "$uboot_image" "$device"

echo "=== Operation Completed Successfully ==="

