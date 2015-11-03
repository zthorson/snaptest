# This is where compile time options can be enabled/disabled

# This is a sample file from Embedded Android - Page 145


# This is a very small makefile, but contains the options required
# to build the system for the emulator.
# Since we don't actually target a device, the bootloader and kernel
# is skipped
TARGET_NO_KERNEL := true
TARGET_NO_BOOTLOADER := true
TARGET_ARCH := arm

# These cpu values were pulled from /device/generic/arm7a-a-neon
# in order to get a valid set of cpu architechtures to build
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := armeabi-v7a

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

# Addresses build errors in the graphics/Paint.cpp:809
BOARD_USE_LEGACY_UI := true
BUILD_EMULATOR_OPENGL := true
USE_OPENGL_RENDERER := true

# Added to prevent a cryptfs error on build
TARGET_USERIMAGES_USE_EXT4 := true

# Build complains it is out of size when creating system 
# image in build_image.py
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 576716800

# New build requires block size or the image will not create
# It fails when writing the system.img file
BOARD_FLASH_BLOCK_SIZE := 512

