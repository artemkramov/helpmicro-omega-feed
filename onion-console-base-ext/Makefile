include $(TOPDIR)/rules.mk
PKG_NAME:=onion-console-base-ext
PKG_VERSION:=0.1.4
PKG_RELEASE:=1


PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=HEAD # dev for dev branch, HEAD for master
PKG_SOURCE_URL:=https://github.com/OnionIoT/Onion-Console.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/onion-console-base-ext
	SECTION:=ECR
	CATEGORY:=ECR
	SUBMENU:=Console
	TITLE:=Extended web-based virtual desktop for the Omega
	DEPENDS:=+onion-console-base
endef

define Package/onion-console-base-ext/description
Web-based virtual desktop for the Omega. Base package with bluetooth and 3G extension
endef

define Package/onion-console-base-ext/install
	# copy the web site files, starting with the lib and element folders
	$(INSTALL_DIR) $(1)/www/console
	# Create a lib directory
	$(INSTALL_DIR) $(1)/www/console/lib
	# Create a elements directory
	$(INSTALL_DIR) $(1)/www/console/elements
	# Create the apps directory
	$(INSTALL_DIR) $(1)/www/console/apps
	# Create the directory for the onion-launcher
	$(INSTALL_DIR) $(1)/www/console/apps/onion-launcher
	# Create the directort for onion-login
	$(INSTALL_DIR) $(1)/www/console/apps/onion-login
	# Create the directory for the onion-settings
	$(INSTALL_DIR) $(1)/www/console/apps/onion-settings

	#### Add the app shells
	$(INSTALL_DIR) $(1)/www/console/apps/onion-editor
	$(INSTALL_DIR) $(1)/www/console/apps/onion-terminal
	$(INSTALL_DIR) $(1)/www/console/apps/onion-webcam

	### Installing the OLED, RELAY AND PWM

	$(INSTALL_DIR) $(1)/www/console/apps/onion-oled
	$(INSTALL_DIR) $(1)/www/console/apps/onion-pwm
	$(INSTALL_DIR) $(1)/www/console/apps/onion-relay
	$(INSTALL_DIR) $(1)/www/console/apps/onion-gpio


	# Create the services directory
	$(INSTALL_DIR) $(1)/www/console/services
	# Create the fonts directory
	$(INSTALL_DIR) $(1)/www/console/fonts
	# Create the images directory
	$(INSTALL_DIR) $(1)/www/console/images
	rm -r $(1)/www/console/*
	cp -r ./files/ $(1)/www/console

	# cp -r $(PKG_BUILD_DIR)/www/* $(1)/www/console/.

	# Add the
endef

$(eval $(call BuildPackage,onion-console-base-ext))