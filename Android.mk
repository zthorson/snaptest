# This makefile simply builds any sub libraries that may be present in the folder
ifneq ($(filter snaptest,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

# This does NOT traverse the tree, only the first level, so specify tools
include $(call all-makefiles-under,$(LOCAL_PATH)/tools)

endif
