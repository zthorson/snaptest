# This is where compile time options can be enabled/disabled

# This is a sample file from Embedded Android - Page 145


# This is a very small makefile, but contains the options required
# to build the system for the emulator.
# Since we don't actually target a device, the bootloader and kernel
# is skipped
TARGET_NO_KERNEL := true
TARGET_NO_BOOTLOADER := true
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi
BOARD_USES_GENERIC_AUDIO := true

USB_CAMERA_STUB := true
