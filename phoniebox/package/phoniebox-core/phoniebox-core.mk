################################################################################
#
# Phoniebox Core
#
################################################################################

PHONIEBOX_CORE_VERSION = origin/future3/develop
PHONIEBOX_CORE_SITE = https://github.com/MiczFlor/RPi-Jukebox-RFID
PHONIEBOX_CORE_SITE_METHOD = git

define PHONIEBOX_CORE_INSTALL_TARGET_CMDS
	mkdir $(TARGET_DIR)/usr/phoniebox
	cp -r $(@D)/src/jukebox/* $(TARGET_DIR)/usr/phoniebox/;
endef

# echo "Register Jukebox settings"
# cp -f "${INSTALLATION_PATH}/resources/default-settings/jukebox.default.yaml" "${SETTINGS_PATH}/jukebox.yaml"
# cp -f "${INSTALLATION_PATH}/resources/default-settings/logger.default.yaml" "${SETTINGS_PATH}/logger.yaml"
# sudo cp -f "${INSTALLATION_PATH}/resources/default-services/jukebox-daemon.service" "${SYSTEMD_USR_PATH}"
# sudo chmod 644 "${SYSTEMD_USR_PATH}/jukebox-daemon.service"


$(eval $(generic-package))
