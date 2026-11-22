# Release name
PRODUCT_RELEASE_NAME := n8010

# Inherit device configuration
$(call inherit-product, device/samsung/n8010/n8010.mk)
$(call inherit-product, device/samsung/n80xx-common/n80xx-common.mk)
$(call inherit-product, device/samsung/smdk4412-common/common.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n8010
PRODUCT_NAME := lineage_n8010
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N8010
PRODUCT_MANUFACTURER := samsung

# Set build identity using the current product override keys.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="p4notewifixx-user 4.4.2 KOT49H N8010XXUDNE4 release-keys" \
    BuildFingerprint=samsung/p4notewifixx/p4notewifiww:4.4.2/KOT49H/N8010XXUDNE4:user/release-keys \
    DeviceName=p4notewifi \
    DeviceProduct=p4notewifiue
