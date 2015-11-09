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
TARGET_CPU_ABI2 := armeabi

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true

USE_CAMERA_STUB := true

# Addresses build errors in the graphics/Paint.cpp:809
BUILD_EMULATOR_OPENGL := true
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 0

# Added to prevent a cryptfs error on build
TARGET_USERIMAGES_USE_EXT4 := true

# Build complains it is out of size when creating system 
# image in build_image.py
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 576716800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800

# These fixes were added since the emulator could not find the type
# of the user partition (wasn't specified)
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# New build requires block size or the image will not create
# It fails when writing the system.img file
BOARD_FLASH_BLOCK_SIZE := 512

# The emulator will now run, but a kernal fault triggers on missing SePolicy
# Default policy is to deny access to everything, so this prevents boot

# From https://source.android.com/devices/tech/security/selinux
# In the Android 5.0 (L) release, Android moves to full enforcement of 
# SELinux. This builds upon the permissive release of 4.3 and the partial
# enforcement of 4.4. In short, Android is shifting from enforcement on a 
# limited set of crucial domains (installd, netd, vold and zygote) to 
# everything (more than 60 domains). This means manufacturers will have to 
# better understand and scale their SELinux implementations to provide 
# compatible devices. Understand that:

# Everything is in enforcing mode in the 5.0 release
# No processes other than init should run in the init domain
# Any generic denial (for a block_device, socket_device, default_service, 
# etc.) indicates that device needs a special domain

# Currently running the emulator with this disabled:
# IE emulator -selinux disabled

BOARD_SEPOLICY_DIRS += build/target/board/generic/sepolicy
BOARD_SEPOLICY_UNION += \
        bootanim.te \
        device.te \
        domain.te \
        file.te \
        file_contexts \
        qemud.te \
        rild.te \
        shell.te \
        surfaceflinger.te \
        system_server.te

# After switching to embedded.mk, got error:
# LIBART_IMG_HOST_BASE_ADDRESS unset
# ANDROID_COMMON_BUILD_MK := true

# This is an optimization to help emulator startup on Linux
# Enables dex-preoptimization to speed up first boot sequence
# of an SDK AVD.
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif
#DONT_DEXPREOPT_PREBUILTS := true
