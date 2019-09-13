#!/bin/bash
if ps -eo comm,etime,user | grep -v grep | grep httpd > /dev/null
then
    echo "Apache server is up and running for instance: $h (Staging East)
else
    echo "Apache server is down"
    echo "Apache server for $h (Staging East) is down" | mail -s "Staging East Apache Service down - `date`” email@mail.com
    systemctl restart httpd.service
    ps -eo comm,etime,user | grep -v grep | grep httpd | mail -s "Staging East Apache Service Restarted - `date`” email@mail.com
    
fi
