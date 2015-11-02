# This makefile simply builds any sub libraries that may be present in the folder

LOCAL_PATH := $(call my-dir)

# ALWAYS run this to clear any old local variables that a prior module
# may have left behind.
include $(CLEAR_VARS)

ifneq ($(filter snaptest,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
