
PRODUCT_COPY_FILES += \
	device/softwinner/common/bin/fsck.exfat:system/bin/fsck.exfat \
	device/softwinner/common/bin/mkfs.exfat:system/bin/mkfs.exfat \
	device/softwinner/common/bin/mount.exfat:system/bin/mount.exfat \
	device/softwinner/common/bin/ntfs-3g:system/bin/ntfs-3g \
	device/softwinner/common/bin/ntfs-3g.probe:system/bin/ntfs-3g.probe \
	device/softwinner/common/bin/mkntfs:system/bin/mkntfs \
	device/softwinner/common/bin/busybox:system/bin/busybox	

# 3g dongle conf
PRODUCT_COPY_FILES += \
	device/softwinner/common/rild/ip-down:system/etc/ppp/ip-down \
	device/softwinner/common/rild/ip-up:system/etc/ppp/ip-up \
	device/softwinner/common/rild/call-pppd:system/etc/ppp/call-pppd \
	device/softwinner/common/rild/usb_modeswitch.sh:system/etc/usb_modeswitch.sh \
	device/softwinner/common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/softwinner/common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/softwinner/common/rild/liballwinner-ril.so:system/lib/liballwinner-ril.so

PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/softwinner/common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)