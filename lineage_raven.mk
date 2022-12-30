#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/raviole/aosp_raven.mk)
$(call inherit-product, device/google/gs101/lineage_common.mk)

include device/google/raviole/raven/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_NAME := lineage_raven

RICE_OFFICIAL := true

# chipset flag enclose var with "" if more than one
# friendly tip: builders can use init_xxx.cpp as workaround for spacing
# e.g. property_override("ro.rice.chipset", "Snapdragon 870 5G");
RICE_CHIPSET := "GoogleTensor"

# chipset flag enclose var with "" if more than one
# friendly tip: builders can use init_xxx.cpp as workaround for spacing
# e.g. property_override("ro.rice.maintainer", "get riced");
RICE_MAINTAINER := "AlvinF"

# chipset flag enclose var with "" if more than one
# this will reflect on build/display version, a firmware package/zip name 
# e.g. riceDroid-7.0-COMMUNITY-device-AOSP.zip - AOSP is the default package type, WITH_GMS will override the package type to PIXEL
RICE_PACKAGE_TYPE := "PIXEL"

# Sushi Bootanimation (only 720/1080p/1440 supported. if not defined, bootanimation is google bootanimation)
SUSHI_BOOTANIMATION := 1440

# Graphene Camera
TARGET_BUILD_GRAPHENEOS_CAMERA := false

# disable/enable blur support, default is false
TARGET_ENABLE_BLUR := false

# UDFPS ICONS/ANIMATIONS
TARGET_HAS_UDFPS := true

# Allow usage of custom binary linker (LD), default is false
TARGET_KERNEL_OPTIONAL_LD := true

# Spoof build description/fingerprint as pixel device
TARGET_USE_PIXEL_FINGERPRINT := true

# GMS build flags, if none were defined the package build type will be AOSP (default: false)
WITH_GMS := true

# Customized GMS Flags 
# WITH_GMS flag is required

# Opt out of google dialer support, compiler will build aosp dialer,
# package type will change from PIXEL -> GMS
TARGET_OPTOUT_GOOGLE_TELEPHONY := false

# Compiler will only build GMS playstore services, its dependencies, and Gboard app.
# package type will change from PIXEL/GMS -> CORE
TARGET_CORE_GMS := false

# extra flag under TARGET_CORE_GMS
TARGET_CORE_GMS_EXTRAS := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=raven \
    PRIVATE_BUILD_DESC="raven-user 13 TQ1A.221205.011 9244662 release-keys"

BUILD_FINGERPRINT := google/raven/raven:13/TQ1A.221205.011/9244662:user/release-keys

$(call inherit-product, vendor/google/raven/raven-vendor.mk)
