################################################################################
#
# Phonibox Web Application
#
################################################################################

# Use a tag or a full commit ID
#PHONIEBOX_SITE = https://github.com/MiczFlor/RPi-Jukebox-RFID
PHONIEBOX_WEBAPP_VERSION = origin/future3/develop
PHONIEBOX_WEBAPP_SITE = https://github.com/MiczFlor/RPi-Jukebox-RFID
PHONIEBOX_WEBAPP_SITE_METHOD = git
PHONIEBOX_WEBAPP_DEPENDENCIES = nodejs

PHONIEBOX_WEBAPP_INSTALL_STAGING = YES

define PHONIEBOX_WEBAPP_BUILD_CMDS
	cd $(@D)/src/webapp; $(NPM) install --prefer-offline --no-audit --production
	cd $(@D)/src/webapp; rm -rf build
	cd $(@D)/src/webapp; $(NPM) run build
endef

define PHONIEBOX_WEBAPP_INSTALL_TARGET_CMDSc
	mkdir -p $(TARGET_DIR)/opt/webapp
	# rm $(TARGET_DIR)/usr/html/*
	cp -r $(@D)/src/webapp/build/* $(TARGET_DIR)/opt/webapp;
endef

$(eval $(generic-package))
