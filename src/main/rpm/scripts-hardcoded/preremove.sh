# preremove script
# vim:ft=sh

echo "[*] Starting PreRemove script"

which systemctl >/dev/null 2>/dev/null
systemctl_present=$?
if [ $systemctl_present -eq 0 ]; then
    systemctl stop export-notification-service
else
    service export-notification-service stop
fi