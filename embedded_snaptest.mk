# Sample basic library from Embedded Android - Page 144

# Use a small subset of languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# Pulls in all modules required to run a minimal android install
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Pulls in definitions required to run the emulator 
# -- The following calls are already made by full.mk, so not needed for this
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulator.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/board/generic/device.mk)
include $(SRC_TARGET_DIR)/product/emulator.mk
# --


# Pulled from working example in /device/generic/armv7-a-neon
# ---- 
PRODUCT_PACKAGES += camera.goldfish.jpg

PRODUCT_RUNTIMES := runtime_libart_default

PRODUCT_CHARACTERISTICS := nosdcard
# ----

# Allows replacing of default packages (not to do with dtb's)
DEVICE_PACKAGE_OVERLAYS +=

# Adding i2c tools to the binaries for debugging
PRODUCT_PACKAGES += i2c-tools \
	i2cget \
	i2cset \
	i2cdetect \
	i2cdump \
	

# Copy raw configuration files, kernel modules, firmware, etc to specific 
# folders
PRODUCT_COPY_FILES +=

# These should match what you see in lunch
PRODUCT_NAME := embedded_snaptest

# This MUST match the directory under the device tab, or this will not work
PRODUCT_DEVICE := snaptest

# Do whatever you want here for a long descriptive name
# This will show up in the about device section
PRODUCT_MODEL := Sentera Snapcamp Compilation Test - Embedded Only 

# Usually set to android, but doesn't have to be
PRODUCT_BRAND := Android

