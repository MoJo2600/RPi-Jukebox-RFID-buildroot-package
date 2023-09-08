################################################################################
#
# Phonibox
#
################################################################################

# Use a tag or a full commit ID
#PHONIEBOX_SITE = https://github.com/MiczFlor/RPi-Jukebox-RFID
PHONIEBOX_WEBAPP_VERSION = origin/future3/develop
PHONIEBOX_WEBAPP_SITE = https://github.com/MiczFlor/RPi-Jukebox-RFID
PHONIEBOX_WEBAPP_SITE_METHOD = git

PHONIEBOX_WEBAPP_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_PHONIEBOX_WEBAPP),y)
define PHONIEBOX_WEBAPP_BUILD_CMDS
	cd $(@D)/src/webapp; $(NPM) ci --prefer-offline --no-audit --production
	cd $(@D)/src/webapp; rm -rf build
	cd $(@D)/src/webapp; $(NPM) run build
endef
endif

ifeq ($(BR2_PACKAGE_PHONIEBOX_WEBAPP),y)
define PHONIEBOX_WEBAPP_INSTALL_TARGET_CMDS
	rm $(TARGET_DIR)/usr/html/*
	cp -r $(@D)/src/webapp/build/* $(TARGET_DIR)/usr/html/;
endef
endif

$(eval $(generic-package))