# Copyright (c) 2015 OpenWrt.org
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=mediatek
BOARDNAME:=MediaTek Ralink ARM
SUBTARGETS:=mt7622 mt7623 mt7629 mt7986 mt7981
FEATURES:=squashfs nand ramdisk fpu

KERNEL_PATCHVER:=5.4
KERNEL_TESTING_PATCHVER:=5.4

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	kmod-leds-gpio kmod-gpio-button-hotplug \
        uboot-envtools luci-app-firewall luci-proto-ipv6 luci-proto-ppp kmod-tun kmod-ipt-nat6 ntpdate luci-app-ddns ddns-scripts luci-theme-edge uhttpd wget-ssl luci-proto-relay nginx-all-module lua-cjson jq iperf3 luci-app-mosdns my-files xray-core luci-app-xray-fw3 luci-app-natmap hysteria autocore-arm luci-i18n-mtk-zh-cn

$(eval $(call BuildTarget))
