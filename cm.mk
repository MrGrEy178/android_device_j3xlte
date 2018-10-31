# Release name
CM_DEVICE := j3xlte
PRODUCT_RELEASE_NAME := j3xltexx
TARGET_OTA_ASSERT_DEVICE := SM-J320F

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/themes_common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/j3xlte/full_j3xltejt.mk)

## Device identifier. This must come after all inclusions
PRODUCT_MODEL := SM-J320F
PRODUCT_BRAND := samsung
PRODUCT_NAME := cm_j3xltejt
PRODUCT_DEVICE := j3xlte
PRODUCT_MANUFACTURER := samsung