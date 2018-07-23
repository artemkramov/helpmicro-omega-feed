include $(TOPDIR)/rules.mk

PKG_NAME:=lede-ecr-app
PKG_VERSION:=1.0.34
PKG_RELEASE:=1
PKG_REV:=HEAD
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.gz
PKG_MIRROR_HASH:=bbcf70f8b0a64fc631e2a62526d9270e3c49b52c7427c11983618931a03ae643
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)


PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/artemkramov/lede-ecr-app.git
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/lede-ecr-app
	CATEGORY:=ECR
	SECTION:=ECR
	TITLE:=ECR proxy app
	DEPENDS:=+uci +firewall +nodejs +bluez-daemon +libuci
endef


define Package/lede-ecr-app/description
Application to forward requests from external port to ECR
endef

define Build/Compile
        $(CP) ./files/Makefile $(PKG_BUILD_DIR)/makefile
endef

define Package/lede-ecr-app/conffiles
/etc/config/firewall
endef

define Package/lede-ecr-app/install
	# copy the web site files
	$(INSTALL_DIR) $(1)/www $(1)/usr/share/lede-ecr-util
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)//etc/bluetooth
	$(INSTALL_DIR) $(1)/etc/dbus-1/system.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/init.d/ecr $(1)/etc/init.d/ecr
	$(INSTALL_BIN) ./files/checkWanStatus.sh $(1)/usr/share/lede-ecr-util/checkWanStatus
	$(INSTALL_BIN) ./files/wanStatus $(1)/etc/init.d/wanStatus
	$(INSTALL_DATA) ./files/bluetooth.conf $(1)/etc/dbus-1/system.d/bluetooth.conf
	$(CP) -r $(PKG_BUILD_DIR)/ecr-app $(1)/www
endef

define Package/lede-ecr-app/postinst
#!bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/ecr enable
	/etc/init.d/wanStatus enable
	uci set bluetooth.@bluetoothd[0].config='test'
	uci commit
fi
exit 0
endef

define Package/lede-ecr-app/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/ecr disable
	/etc/init.d/wanStatus disable
fi
exit 0
endef 

$(eval $(call BuildPackage,lede-ecr-app))
