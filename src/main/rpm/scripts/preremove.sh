# preremove script
# vim:ft=sh

which systemctl >/dev/null 2>/dev/null
systemctl_present=$?
if [ $systemctl_present -eq 0 ]; then
    systemctl stop ${service_name}
else
    service ${service_name} stop
fi