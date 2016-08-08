# postinstallation script
# vim:ft=sh

echo "Post-installation script started"

chown -R ${service_name}:${service_name} $RPM_INSTALL_PREFIX/${service_name}
for FILE in $RPM_INSTALL_PREFIX/${service_name}/bin/*; do
    ln -sf $FILE /usr/bin/
done
echo Enabling auto-start for ${service_name} server
which systemctl > /dev/null 2>/dev/null
systemctl_present=$?
if [ $systemctl_present -eq 0 ]; then
    systemctl daemon-reload
    systemctl enable ${service_name}
    echo "Starting ${service_name} service..."
    systemctl start ${service_name}
else
    for FILE in $RPM_INSTALL_PREFIX/${s}/service/sysv/*; do
        ln -sf $FILE /etc/init.d/
    done
    which chkconfig > /dev/null 2>/dev/null
    is_redhat=$?
    if [ $is_redhat -eq 0 ]; then
        /sbin/chkconfig ${service_name} on
    else
        which update-rc.d > /dev/null
        is_debian=$?
        if [ $is_debian -eq 0 ]; then
            update-rc.d zoomdata default
        fi
    fi
    echo "Starting ${service_name} service..."
    service ${service_name} start
fi