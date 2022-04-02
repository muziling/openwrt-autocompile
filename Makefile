# fast-classifier
# https://github.com/Lienol/openwrt/commit/cd2a138128e5071bb2f924485e6524fa32c6e159
# https://github.com/Lienol/openwrt/commit/8658a014d516a8384a223ceedfc959befef81b79
# https://github.com/Lienol/openwrt/commit/f62ddae92be21968d923b651983b15f82d4608f8
# luci-app-fullconenat fast-classifier
include $(TOPDIR)/rules.mk

ARCH:=i386
BOARD:=x86
BOARDNAME:=x86
FEATURES:=squashfs vdi vmdk vhdx pcmcia fpu boot-part rootfs-part
SUBTARGETS:=64 generic legacy geode 

KERNEL_PATCHVER:=5.4
KERNEL_TESTING_PATCHVER:=5.4

KERNELNAME:=bzImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += autocf bash ca-certificates curl e2fsprogs fdisk fping htop ipset ipt2socks \
iptables-mod-conntrack-extra iptables-mod-extra iptables-mod-tproxy jq kmod-gre kmod-fs-ext4 \
kmod-ipt-raw kmod-ipt-tproxy kmod-nf-nathelper kmod-nf-nathelper-extra lm-sensors luci luci-app-ddns \
luci-app-autoreboot luci-app-mosdns luci-app-ramfree luci-app-upnp luci-app-vlmcsd luci-app-vsftpd \
luci-app-wrtbwmon luci-compat luci-theme-argon mkf2fs openssl-util ss-tproxy-lite sudo tcpdump wget-ssl \
xray-core luci-app-nft-qos  ddns-scripts-aliyun kmod-vmxnet3 kmod-virtio kmod-virtio-net kmod-r8168 ethtool \
bandwidthd hysteria kmod-bpf-test kmod-netem iptables-mod-tee tc-full

$(eval $(call BuildTarget))

$(eval $(call $(if $(CONFIG_ISO_IMAGES),SetupHostCommand,Ignore),mkisofs, \
	Please install mkisofs. , \
	mkisofs -v 2>&1 , \
	genisoimage -v 2>&1 | grep genisoimage, \
	xorrisofs -v 2>&1 | grep xorriso \
))