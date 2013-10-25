#
# Copyright (C) 2011 Texas Instruments Inc.
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

ifneq ($(WLAN_DISABLED),true)
USES_BCM_WLAN := true
BOARD_BCM_WLAN_CHIP := bcm4330
BOARD_BCM_WIFI_BAND   := abg
endif

include device/amazon/soho/dolby.mk
include device/amazon/common/BoardConfig.mk

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/amazon/soho/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=1G vmalloc=496M init=/init androidboot.console=ttyO2 androidboot.hardware=bowser
BOARD_KERNEL_CMDLINE += omap_wdt.timer_margin=30

BOARD_USES_MAXIM_MAX98090 := true

# Target information
TARGET_BOOTLOADER_BOARD_NAME := soho

# Default values, possibly overridden by BoardConfigVendor.mk
TARGET_BOARD_INFO_FILE := device/amazon/soho/board-info.txt

# Recovery
TARGET_RECOVERY_DOUBLE_BUFFERING := "No"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_soho
# device-specific extensions to the updater binary
TARGET_RELEASETOOLS_EXTENSIONS := device/amazon/soho

# Partition Information
TARGET_USERIMAGES_USE_EXT4 := true
# System image size 1200MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 943718400
BOARD_EFSIMAGE_PARTITION_SIZE := 16777216

# ACOS_MOD_BEGIN
#ifneq ($(TARGET_BUILD_VARIANT), user)
USE_TRAPZ := true
#endif
#ACOS_MOD_END
