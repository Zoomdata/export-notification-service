# preinstallation scipt
# vim:ft=sh

echo "[*] Staring PreInstall script"

#needed to correct yum upgrade
if [ -f /etc/init.d/export-notification-service ]; then
    service export-notification-service stop >/dev/null 2>/dev/null
fi
if [ -f /lib/systemd/system/export-notification-service.service ]; then
    systemctl stop export-notification-service >/dev/null 2>/dev/null
fi

echo "==> Creating service user/group expsrv_user/expsrv_user"
getent group  expsrv_user >/dev/null || groupadd -r expsrv_user
getent passwd expsrv_user >/dev/null || \
useradd -r -g expsrv_user -d $RPM_INSTALL_PREFIX/export-notification-service -s /sbin/nologin -c "Zoomdata export-notification-service service account" expsrv_user
