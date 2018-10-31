LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),j3xlte)
include $(call all-makefiles-under,$(LOCAL_PATH))

endif