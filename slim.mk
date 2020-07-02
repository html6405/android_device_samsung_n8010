
#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2014 SlimRoms Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Release name
PRODUCT_RELEASE_NAME := n8010

# Inherit device configuration
$(call inherit-product, device/samsung/n80xx-common/n80xx-common.mk)
$(call inherit-product, device/samsung/n8010/n8010.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common stuff.
$(call inherit-product, vendor/slim/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n8010
PRODUCT_NAME := slim_n8010
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N8010
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=p4notewifiue \
	TARGET_DEVICE=p4notewifi \
	BUILD_FINGERPRINT="samsung/p4notewifixx/p4notewifiww:4.4.2/KOT49H/N8010XXUDNE4:user/release-keys" \
	PRIVATE_BUILD_DESC="p4notewifixx-user 4.4.2 KOT49H N8010XXUDNE4 release-keys"
