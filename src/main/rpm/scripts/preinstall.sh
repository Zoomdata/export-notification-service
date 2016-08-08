# preinstallation scipt
# vim:ft=sh

#needed to correct yum upgrade
if [ -f /etc/init.d/${service_name} ]; then
    service ${service_name} stop >/dev/null 2>/dev/null
fi
if [ -f /lib/systemd/system/${service_name}.service ]; then
    systemctl stop ${service_name}.service >/dev/null 2>/dev/null
fi

echo "Creating service user/group ${systemuser}/${systemuser}"
getent group  ${systemuser} >/dev/null || groupadd -r ${systemuser}
getent passwd ${systemuser} >/dev/null || \
useradd -r -g ${systemuser} -d $RPM_INSTALL_PREFIX/${service_name} -s /sbin/nologin -c "Zoomdata ${service_name} service account" ${systemuser}
