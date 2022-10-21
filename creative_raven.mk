#
# Copyright (C) 2022 The CreativeOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Creative stuff.
$(call inherit-product, vendor/creative/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/raviole/aosp_raven.mk)
$(call inherit-product, device/google/gs101/creative_common.mk)
$(call inherit-product, device/google/raviole/device-creative.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_NAME := creative_raven

# Boot animation
CREATIVE_BOOTANIMATION := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=raven \
    PRIVATE_BUILD_DESC="raven-user 13 TP1A.221005.002 9012097 release-keys"

BUILD_FINGERPRINT := google/raven/raven:13/TP1A.221005.002/9012097:user/release-keys

$(call inherit-product, vendor/google/raven/raven-vendor.mk)
