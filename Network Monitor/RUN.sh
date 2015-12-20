#!/bin/bash
#
# This script installs a service that periodically checks if there is internet,
# and if there is not it reboots the network manager until internet is there again.

echo "
#!/bin/bash

# The IP for the server you wish to ping (8.8.8.8 is a public Google DNS server)
SERVER=8.8.8.8

# Only send two pings, sending output to /dev/null
ping -c2 ${SERVER} > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
    # Restart the wireless interface
    ifdown --force wlan0
    ifup wlan0
fi
" >> network-monitor.sh

mv network-monitor.sh /usr/local/bin

chmod +x /usr/local/bin/network-monitor.sh

echo "*/5 *   * * *   root    /usr/local/bin/network-monitor.sh" >> /etc/crontab
