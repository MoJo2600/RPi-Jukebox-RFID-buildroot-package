################################################################################
#
# WM8960
#
################################################################################

SOUNDCARD_WAVESHARE_WM8960_VERSION = master
SOUNDCARD_WAVESHARE_WM8960_SITE =  $(call github,waveshare,WM8960-Audio-HAT,$(SOUNDCARD_WAVESHARE_WM8960_VERSION))
SOUNDCARD_WAVESHARE_WM8960_DEPENDENCIES = rpi-firmware dtc

$(eval $(kernel-module))

define SOUNDCARD_WAVESHARE_WM8960_INSTALL_TARGET_CMDS

	mkdir -p $(TARGET_DIR)/etc/wm8960-soundcard
	$(INSTALL) -D -m 0644 $(@D)/*.state $(TARGET_DIR)/etc/wm8960-soundcard
	$(INSTALL) -D -m 0644 $(@D)/*.conf $(TARGET_DIR)/etc/wm8960-soundcard

	$(INSTALL) -D -m 0644 $(@D)/wm8960-soundcard.dtbo $(BINARIES_DIR)/rpi-firmware/overlays/

endef

$(eval $(generic-package))
