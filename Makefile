#
# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2006-2011 OpenWrt.org
# autocore会覆盖/usr/lib/lua/luci/view/admin_status/index.htm，如果luci-base版本不一样会有问题

include $(TOPDIR)/rules.mk

ARCH:=i386
BOARD:=x86
BOARDNAME:=x86
FEATURES:=squashfs ext4 vdi vmdk pcmcia targz fpu boot-part rootfs-part
SUBTARGETS:=generic legacy geode 64

KERNEL_PATCHVER:=5.4
KERNEL_TESTING_PATCHVER:=5.4

KERNELNAME:=bzImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += autocf bash ca-certificates curl e2fsprogs fast-classifier fdisk fping fullconenat htop ipset ipt2socks iptables-mod-conntrack-extra iptables-mod-extra iptables-mod-tproxy jq kmod-e1000e kmod-fs-ext4 kmod-ipt-raw kmod-ipt-tproxy kmod-nf-nathelper kmod-nf-nathelper-extra lm-sensors luci luci-app-ddns luci-app-autoreboot luci-app-mosdns luci-app-ramfree luci-app-upnp luci-app-vlmcsd luci-app-vsftpd luci-app-wrtbwmon luci-compat luci-proto-bonding luci-theme-argon mkf2fs openssl-util shortcut-fe ss-tproxy-lite sudo tcpdump wget-ssl xray-core luci-app-nft-qos luci-app-fullconenat luci-app-smartdns ddns-scripts-aliyun kmod-vmxnet3 kmod-virtio kmod-virtio-net

$(eval $(call BuildTarget))

$(eval $(call $(if $(CONFIG_ISO_IMAGES),SetupHostCommand,Ignore),mkisofs, \
	Please install mkisofs. , \
	mkisofs -v 2>&1 , \
	genisoimage -v 2>&1 | grep genisoimage, \
	xorrisofs -v 2>&1 | grep xorriso \
))