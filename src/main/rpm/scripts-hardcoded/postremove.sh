# postremove script
# vim:ft=sh

echo "[*] Staring PostRemove script"

if [ ! -f $RPM_INSTALL_PREFIX/export-notification-service/bin/export-notification-service ]; then
    rm -f /usr/bin/export-notification-service
    rm -f /etc/init.d/export-notification-service

    systemctl disable export-notification-service >/dev/null 2>/dev/null
    chkconfig export-notification-service off >/dev/null 2>/dev/null
    update-rc.d export-notification-service remove >/dev/null 2>/dev/null
    rm -rf $RPM_INSTALL_PREFIX/export-notification-service/*
fi