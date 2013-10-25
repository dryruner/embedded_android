#
# Copyright (C) 2009 Texas Instruments
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

#
# This file is the build configuration for a full Android
# build for blaze & sdp hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Use a compressed filesystem for font resources rather than a directory of
# discrete font files. If this is true, then the property sys.fonts.squashed
# must also be true. If false sys.fonts.squashed should be false or
# undefined.  This build variable must be defined here rather than in
# BoardConfig.mk because fonts are installed by a makefile included
# from full_base.mk, which is significantly before BoardConfig files
# are included, so conditional build of fonts is not possible to control
# from BoardConfig.mk.
TARGET_SQUASHED_FONTS := true


include device/amazon/soho/dolby.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/amazon/soho/device.mk)
$(call inherit-product, device/amazon/soho/ducati/ducati.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := soho
PRODUCT_DEVICE := soho
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := Soho
PRODUCT_MANUFACTURER := Amazon
WITH_DEXPREOPT_PREBUILTS := true

PRODUCT_SIGN_BOOTLOADER := true
PRODUCT_SIGN_BOOTIMAGE := true
PRODUCT_PREBUILT_XLOADER_DUMMY := MLO-dummy
