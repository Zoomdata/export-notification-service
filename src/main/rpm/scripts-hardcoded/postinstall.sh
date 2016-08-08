# postinstallation script
# vim:ft=sh

echo "[*] Post-installation script started"

chown -R expsrv_user:expsrv_user $RPM_INSTALL_PREFIX/export-notification-service

echo "==> Linking binary files"

for FILE in $RPM_INSTALL_PREFIX/export-notification-service/bin/*; do
    ln -sf $FILE /usr/bin/
done

echo "==> Enabling auto-start for export-notification-service server"

which systemctl > /dev/null 2>/dev/null
systemctl_present=$?
if [ $systemctl_present -eq 0 ]; then

    echo "==> Linking SYSTEMD services"

    for FILE in $RPM_INSTALL_PREFIX/export-notification-service/service/systemd/*; do
        ln -sf $FILE /lib/systemd/system/
    done

    systemctl daemon-reload
    systemctl enable export-notification-service
    echo "==> Starting SYSTEMD export-notification-service service..."
    systemctl start export-notification-service
else

    echo "==> Linking SYSV-INIT scripts"

    for FILE in $RPM_INSTALL_PREFIX/export-notification-service/service/sysv/*; do
        ln -sf $FILE /etc/init.d/
    done
    which chkconfig > /dev/null 2>/dev/null
    is_redhat=$?
    if [ $is_redhat -eq 0 ]; then
        /sbin/chkconfig export-notification-service on
    else
        which update-rc.d > /dev/null
        is_debian=$?
        if [ $is_debian -eq 0 ]; then
            update-rc.d zoomdata default
        fi
    fi
    echo "==> Starting SYSV-INIT export-notification-service service..."
    service export-notification-service start
fi
