include $(TOPDIR)/rules.mk
PKG_NAME:=onion-console-base-ext
PKG_VERSION:=0.1.5
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
	DEPENDS:=+rpcd
endef

define Package/onion-console-base-ext/description
Web-based virtual desktop for the Omega. Base package with bluetooth and 3G extension
endef

define Package/onion-console-base-ext/install
	# install the acl permissions file
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/acl.d/onion-console.json $(1)/usr/share/rpcd/acl.d/onion-console.json
	# install scripts
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/factory-reset.sh $(1)/usr/sbin/factory-reset
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/power-down.sh $(1)/usr/sbin/power-down
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/change-password.sh $(1)/usr/sbin/change-password
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/disk-space.sh $(1)/usr/sbin/disk-space
	# install the rpcd script
	$(INSTALL_DIR) $(1)/usr/libexec/rpcd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rpcd/onion-console.sh $(1)/usr/libexec/rpcd/onion-console
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

	# copy the lib directory
	cp -r ./files/lib/* $(1)/www/console/lib/.
	# copy the elements directory
	cp -r ./files/elements/* $(1)/www/console/elements/.
	# copy the fonts directory
	cp -r ./files/fonts/* $(1)/www/console/fonts/.
	# copy the images directory
	cp -r ./files/images/* $(1)/www/console/images/.
	# copy the services directory
	cp -r ./files/services/* $(1)/www/console/services/.
	# copy other random files
	cp ./files/.bowerrc $(1)/www/console/.bowerrc
	cp ./files/bower.json $(1)/www/console/bower.json
	cp ./files/index.html $(1)/www/console/index.html
	# copy the apps into the directory
	# copy the launcher app
	cp -r ./files/apps/onion-launcher/* $(1)/www/console/apps/onion-launcher/.
	cp -r ./files/apps/onion-settings/* $(1)/www/console/apps/onion-settings/.
	cp -r ./files/apps/onion-login/* $(1)/www/console/apps/onion-login/.

	cp -r ./files/apps/onion-oled/* $(1)/www/console/apps/onion-oled/.
	cp -r ./files/apps/onion-gpio/* $(1)/www/console/apps/onion-gpio/.
	cp -r ./files/apps/onion-pwm/* $(1)/www/console/apps/onion-pwm/.
	cp -r ./files/apps/onion-relay/* $(1)/www/console/apps/onion-relay/.

	## Adding the index page

	cp -r ./files/apps/onion-editor/* $(1)/www/console/apps/onion-editor/.
	rm -r $(1)/www/console/apps/onion-editor/onion-editor.html
	cp -r ./files/apps/onion-terminal/* $(1)/www/console/apps/onion-terminal/.
	rm -r $(1)/www/console/apps/onion-terminal/onion-terminal.html

	cp -r ./files/apps/onion-webcam/* $(1)/www/console/apps/onion-webcam/.
	rm -r $(1)/www/console/apps/onion-webcam/onion-webcam.html

	rm -r $(1)/www/console/lib/juicy-ace-editor/

endef

$(eval $(call BuildPackage,onion-console-base-ext))