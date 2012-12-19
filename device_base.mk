# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/beni/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/beni/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


## Device specific overlay
DEVICE_PACKAGE_OVERLAYS := device/samsung/beni/overlay

## Included Packages
PRODUCT_PACKAGES += \
    make_ext4fs \
    brcm_patchram_plus \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    audio.a2dp.default \
    audio.primary.beni \
    audio_policy.beni \
    hwcomposer.default \
    bdaddr_read \
    DSPManager \
    GalaxyICS-FileManager \
    MusicFX \
    setup_fs 
#Mike Gapinski Change
PRODUCT_PACKAGES += \
    	libOmxCore \
	libOmxVidEnc \
	libmm-omxcore \
	libstagefrighthw \
        libgenlock \
	liboverlay \
 	libtilerenderer \
	libQcomUI

## CM9 MDPI bootanimation
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/bootanimation.zip:system/media/bootanimation.zip

## Binaries
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \
    device/samsung/beni/prebuilt/bin/chmod:system/bin/chmod \
    device/samsung/beni/prebuilt/bin/mount:system/bin/mount \
    device/samsung/beni/prebuilt/bin/run_drm:system/bin/run_drm \
    device/samsung/beni/prebuilt/bin/run_usb:system/bin/run_usb \
    device/samsung/beni/prebuilt/bin/su:system/bin/su

## Run DRM and USB mass storage
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/etc/init.local.rc:system/etc/init.local.rc \
    device/samsung/beni/prebuilt/etc/usb.fix:system/etc/usb.fix

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/beni/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/beni/ueventd.gt-s5670.rc:root/ueventd.gt-s5670.rc \
    device/samsung/beni/default.prop:root/default.prop \
    device/samsung/beni/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/beni/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/beni/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/beni/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/beni/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/beni/prebuilt/cifs.ko:system/lib/modules/cifs.ko \
    device/samsung/beni/prebuilt/tun.ko:system/lib/modules/tun.ko \
    device/samsung/beni/init.gt-s5670.rc:root/init.gt-s5670.rc \
    device/samsung/beni/prebuilt/zram.ko:system/lib/modules/zram.ko 

## wifi module
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/beni/prebuilt/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/beni/prebuilt/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/beni/prebuilt/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/beni/prebuilt/bdata.SD31.bin.01:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01 \
    device/samsung/beni/prebuilt/bdata.SD31.bin.02:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02 \
    device/samsung/beni/prebuilt/bdata.SD31.bin.03:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03 \
    device/samsung/beni/prebuilt/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/beni/prebuilt/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/beni/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/beni/prebuilt/wlan_mac:system/bin/wlan_mac \
    device/samsung/beni/prebuilt/wlan_tool:system/bin/wlan_tool \
    device/samsung/beni/prebuilt/wmiconfig:system/bin/wmiconfig 

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/beni/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/beni/prebuilt/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/beni/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/beni/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/beni/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/beni/prebuilt/hosts:system/etc/hosts \
    device/samsung/beni/prebuilt/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/beni/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

## Camera
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/camera.beni.so:system/lib/hw/camera.beni.so \
    device/samsung/beni/prebuilt/libcamera.so:system/lib/libcamera.so \
    device/samsung/beni/prebuilt/libcamera_client.so:system/lib/libcamera_client.so \
    device/samsung/beni/prebuilt/libcameraservice.so:system/lib/libcameraservice.so \
    device/samsung/beni/prebuilt/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/samsung/beni/prebuilt/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/samsung/beni/prebuilt/libmmipl.so:system/lib/libmmipl.so \
    device/samsung/beni/prebuilt/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/samsung/beni/prebuilt/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    device/samsung/beni/prebuilt/liboemcamera.so:system/lib/liboemcamera.so

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/beni/prebuilt/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/beni/prebuilt/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/beni/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/beni/prebuilt/sec_key.kl:system/usr/keylayout/sec_key.kl 

## keychar
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/beni/prebuilt/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/beni/prebuilt/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/beni/prebuilt/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/BCM2049C0_003.001.031.0088.0094.hcd:system/bin/BCM2049C0_003.001.031.0088.0094.hcd \
    device/samsung/beni/prebuilt/BCM2049C0_003.001.031.0088.0094.hcd:system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd

## Sensor
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/gpsd:system/bin/gpsd \
    device/samsung/beni/prebuilt/qmuxd:system/bin/qmuxd \
    device/samsung/beni/prebuilt/gps.msm7x27.so:system/vendor/lib/hw/gps.msm7x27.so \
    device/samsung/beni/prebuilt/gps.msm7x27.so:system/lib/hw/gps.msm7x27.so \
    device/samsung/beni/prebuilt/gps.beni.so:system/lib/hw/gps.beni.so \
    device/samsung/beni/prebuilt/lights.default.so:system/lib/hw/lights.default.so \
    device/samsung/beni/prebuilt/sensors.beni.so:system/lib/hw/sensors.beni.so \
    device/samsung/beni/prebuilt/gpsd:system/vendor/bin/gpsd \
    device/samsung/beni/prebuilt/memsicd:system/bin/memsicd 

## GPU firmware and libraries
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/qcom/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/samsung/beni/prebuilt/qcom/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/samsung/beni/prebuilt/qcom/lib/libC2D2.so:system/lib/libC2D2.so \
    device/samsung/beni/prebuilt/qcom/lib/libgsl.so:system/lib/libgsl.so \
    device/samsung/beni/prebuilt/qcom/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/samsung/beni/prebuilt/qcom/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/samsung/beni/prebuilt/qcom/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/beni/prebuilt/qcom/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/samsung/beni/prebuilt/qcom/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/beni/prebuilt/qcom/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/samsung/beni/prebuilt/qcom/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/beni/prebuilt/qcom/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/beni/prebuilt/qcom/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

## other media
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/get_macaddrs:system/bin/get_macaddrs

## ril
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/libdiag.so:system/lib/libdiag.so \
    device/samsung/beni/prebuilt/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/beni/prebuilt/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/beni/prebuilt/libril.so:system/lib/libril.so 

## script
PRODUCT_COPY_FILES += \
    device/samsung/beni/prebuilt/01sysctl:system/etc/init.d/01sysctl \
    device/samsung/beni/prebuilt/02beni:system/etc/init.d/02beni \
    device/samsung/beni/prebuilt/04modules:system/etc/init.d/04modules \
    device/samsung/beni/prebuilt/20userinit:system/etc/init.d/20userinit \
    device/samsung/beni/prebuilt/99complete:system/etc/init.d/99complete

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

$(call inherit-product-if-exists, vendor/samsung/beni/beni-vendor.mk)
# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
$(call inherit-product, build/target/product/full_base.mk)

# HardwareRenderer properties
# dirty_rebenins: "false" to disable partial invalidates, override if enabletr=true
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_rebenins=false

# Misc properties
# events_per_sec: default 90
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=1
