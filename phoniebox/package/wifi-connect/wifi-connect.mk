################################################################################
#
# wifi-connect
#
################################################################################

WIFI_CONNECT_VERSION = v4.11.3
WIFI_CONNECT_SITE = $(call github,balena-io,wifi-connect,$(WIFI_CONNECT_VERSION))

WIFI_CONNECT_DEPENDENCIES = host-rustc

WIFI_CONNECT_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
		     CC=$(TARGET_CC) \
                     HOST_CC=gcc \
		     PKG_CONFIG_ALLOW_CROSS=1 \
		     OPENSSL_LIB_DIR=$(HOST_DIR)/lib \
		     OPENSSL_INCLUDE_DIR=$(HOST_DIR)/include \
			 CARGO_TARGET_ARMV7_UNKNOWN_LINUX_GNUEABIHF_LINKER=arm-buildroot-linux-gnueabihf-gcc \
#			 CC_armv7_unknown_Linux_gnueabihf=arm-linux-gnueabihf-gcc \
#			 CXX_armv7_unknown_linux_gnueabihf=arm-linux-gnueabihf-g++

WIFI_CONNECT_BIN_DIR = target/$(RUSTC_TARGET_NAME)/release

WIFI_CONNECT_CARGO_OPTS = \
			  $(if $(BR2_ENABLE_DEBUG),,--release) \
		      --target=$(RUSTC_TARGET_NAME) \
		      --manifest-path=$(@D)/Cargo.toml

define WIFI_CONNECT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(WIFI_CONNECT_CARGO_ENV) \
	cargo build $(WIFI_CONNECT_CARGO_OPTS)
endef

define WIFI_CONNECT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/sbin
	$(INSTALL) -D -m 0755 $(@D)/$(WIFI_CONNECT_BIN_DIR)/wifi-connect \
		$(TARGET_DIR)/usr/local/sbin/wifi-connect
endef

$(eval $(generic-package))
#$(eval $(cargo-package))
