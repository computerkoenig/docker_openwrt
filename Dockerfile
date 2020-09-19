FROM katta/openwrt-rootfs:19.07.3

RUN mkdir -p /var/lock \
  && mkdir -p /var/run \
  && opkg update \
  && opkg install \
    luci \
    # luci-theme-openwrt \
  && rm /var/opkg-lists/* \
  && /etc/init.d/dropbear enable

EXPOSE 80
VOLUME /etc/config/

CMD ["/sbin/init"]
