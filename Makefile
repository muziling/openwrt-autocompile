#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# autocore会覆盖/usr/lib/lua/luci/view/admin_status/index.htm，如果luci-base版本不一样会有问题
#
include $(TOPDIR)/rules.mk

ARCH:=i386
BOARD:=x86
BOARDNAME:=x86
FEATURES:=squashfs vdi vmdk pcmcia fpu boot-part rootfs-part
SUBTARGETS:=64 generic legacy geode

KERNEL_PATCHVER:=5.4
KERNEL_TESTING_PATCHVER:=5.4

KERNELNAME:=bzImage

include $(INCLUDE_DIR)/target.mk
# luci-theme-edge
DEFAULT_PACKAGES += mkf2fs fdisk e2fsprogs kmod-e1000e kmod-vmxnet3 kmod-r8125 kmod-8139cp kmod-8139too kmod-fs-ext4 \
htop lm-sensors luci-proto-bonding ca-certificates \
iptables-mod-extra iptables-mod-conntrack-extra bash curl tcpdump \
luci-theme-argon luci-app-wrtbwmon luci-app-oaf fullconenat luci-app-flowoffload \
luci luci-compat \
kmod-nf-nathelper kmod-nf-nathelper-extra kmod-ipt-raw wget luci-app-chinadns-ng dns2tcp sudo fping\
luci-app-ddns openssl-util luci-app-upnp luci-app-autoreboot luci-app-filetransfer luci-app-vsftpd luci-app-vlmcsd luci-app-ramfree

$(eval $(call BuildTarget))

$(eval $(call $(if $(CONFIG_ISO_IMAGES),SetupHostCommand,Ignore),mkisofs, \
	Please install mkisofs. , \
	mkisofs -v 2>&1 , \
	genisoimage -v 2>&1 | grep genisoimage, \
	xorrisofs -v 2>&1 | grep xorriso \
))
