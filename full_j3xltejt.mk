# Inherit device configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk) # при изучении всех *.mk файлов по пути build/target/product этот собирает самый полный циан.
$(call inherit-product, device/samsung/j3xlte/j3xltejt.mk)
$(call inherit-product, device/samsung/j3xlte/vendor.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := full_j3xltejt
PRODUCT_DEVICE := j3xlte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J320F
PRODUCT_MANUFACTURER := samsung