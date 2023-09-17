################################################################################
#
# Phoniebox Jukebox
#
################################################################################

PHONIEBOX_CORE_VERSION = origin/future3/develop
PHONIEBOX_CORE_SITE = https://github.com/MiczFlor/RPi-Jukebox-RFID
PHONIEBOX_CORE_SITE_METHOD = git

define PHONIEBOX_CORE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/opt/jukebox
	mkdir -p $(TARGET_DIR)/opt/jukebox/resources/audio
	mkdir -p $(TARGET_DIR)/etc/jukebox
	cp -r $(@D)/src/jukebox/* $(TARGET_DIR)/opt/jukebox/;
	cp -r $(@D)/resources/audio/* $(TARGET_DIR)/opt/jukebox/resources/audio/;
	$(INSTALL) -D -m 0644 "$(BR2_EXTERNAL_PHONIEBOX_PATH)/package/phoniebox-core/jukebox.yaml" "$(TARGET_DIR)/etc/jukebox/jukebox.yaml"
	$(INSTALL) -D -m 0644 "$(@D)/resources/default-settings/logger.default.yaml" "$(TARGET_DIR)/etc/jukebox/logger.yaml"
endef
#	$(INSTALL) -D -m 0644 "$(@D)/settings/jukebox.yaml" "$(TARGET_DIR)/etc/jukebox/jukebox.yaml"

define PHONIEBOX_CORE_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/resources/default-services/jukebox-daemon.service \
		$(TARGET_DIR)/usr/lib/systemd/system/jukebox-daemon.service
endef

# echo "Register Jukebox settings"
# cp -f "${INSTALLATION_PATH}/resources/default-settings/jukebox.default.yaml" "${SETTINGS_PATH}/jukebox.yaml"
# cp -f "${INSTALLATION_PATH}/resources/default-settings/logger.default.yaml" "${SETTINGS_PATH}/logger.yaml"
# sudo cp -f "${INSTALLATION_PATH}/resources/default-services/jukebox-daemon.service" "${SYSTEMD_USR_PATH}"
# sudo chmod 644 "${SYSTEMD_USR_PATH}/jukebox-daemon.service"


$(eval $(generic-package))
