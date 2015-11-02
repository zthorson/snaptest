# Full makefile details for this particular board.
# Sample basic library from Embedded Android - Page 144

# Pull in all locales for language options from base AOSP 
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Pulls in all modules required to be equivalent to full-eng
# For android >4.2 use full_base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)




# Allows replacing of default packages (not to do with dtb's)
DEVICE_PACKAGE_OVERLAYS :=

# Allows adding of additional packages beyond the inherited onces. 
# Will likely be needed to add custom apps, binaries, or libraries
PRODUCT_PACKAGES :=




# Copy raw configuration files, kernel modules, firmware, etc to specific 
# folders
PRODUCT_COPY_FILES :=

# These should match what you see in lunch
PRODUCT_NAME := full_snaptest

# This MUST match the directory under the device tab, or this will not work
PRODUCT_DEVICE := snaptest

# Do whatever you want here for a long descriptive name
# This will show up in the about device section
PRODUCT_MODEL := Sentera Snapcamp Compilation Test - Full Android 

# Usually set to android, but doesn't have to be
PRODUCT_BRAND := Android
