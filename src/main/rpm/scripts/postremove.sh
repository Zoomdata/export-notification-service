# postremove script
# vim:ft=sh

if [ ! -f $RPM_INSTALL_PREFIX/${service_name}/bin/${service_name} ]; then
    rm -f /usr/bin/${service_name}
    rm -f /etc/init.d/${service_name}

    systemctl disable ${service_name} >/dev/null 2>/dev/null
    chkconfig ${service_name} off >/dev/null 2>/dev/null
    update-rc.d ${service_name} remove >/dev/null 2>/dev/null
    rm -rf $RPM_INSTALL_PREFIX/${service_name}/* 
fi