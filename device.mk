#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
$(call inherit-product, device/motorola/sm8250-common/common.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResPstar \
    SystemUIResPstar \
    SettingsProviderResPstar

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libgui_shim_vendor

PRODUCT_SYSTEM_PROPERTIES += \
    camera.disable_zsl_mode=1

PRODUCT_PRODUCT_PROPERTIES += \
    ro.camera.cfa.packagelist=com.motorola.coresettingsext,com.motorola.camera2,com.motorola.camera3,com.motorola.actions \
    ro.com.google.lens.oem_camera_package=com.motorola.camera3 \
    ro.product.motcameradesktop=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.physical.num=4 \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.motorola.camera3 \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.motorola.camera2,com.motorola.camera3,com.motorola.motocit \
    vendor.camera.aux.packagelist2=com.motorola.ccc,com.android.settings \
    ro.vendor.hw.cam_variant=2 \
    ro.vendor.hw.cam_variant_wb=2 \
    vendor.display.enable_camera_smooth=1

# Init
PRODUCT_PACKAGES += \
    init.device.rc

# LiveDisplay
$(call soong_config_set_bool,livedisplay_sysfs,enable_af,true)

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_ODM)/etc/media_profiles_V1_0.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/pstar/pstar-vendor.mk)

# Maintainer Name
INFINITY_MAINTAINER := VotikaBr

# Whether the device supports Fingerprint On Display
TARGET_HAS_UDFPS := false

# Whether Including Google Apps
WITH_GAPPS := true