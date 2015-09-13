#!/bin/sh
echo "src/gz openwrt_dist http://openwrt-dist.sourceforge.net/releases/ar71xx/packages" >> /etc/opkg.conf
echo "src/gz openwrt_dist_luci http://openwrt-dist.sourceforge.net/releases/luci/packages" >> /etc/opkg.conf
opkg install ChinaDNS luci-app-chinadns shadowsocks-libev-spec  luci-app-shadowsocks-spec luci-i18n-chinese
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /etc/ignore.list
echo "ignore list is store in /etc/ignore.list"
