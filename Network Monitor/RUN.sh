#!/bin/bash
#
# This script installs a service that periodically checks if there is internet,
# and if there is not it reboots the network manager until internet is there again.

echo "#!/bin/bash

#!/bin/bash

while true ; do
   if ifconfig wlan0 | grep -q \"inet addr:\" ; then
      sleep 60
   else
      echo \"Network connection down! Attempting reconnection.\"
      ifup --force wlan0
      sleep 10
   fi
done" >> network-monitor.sh

mv network-monitor.sh /usr/local/bin

chmod +x /usr/local/bin/network-monitor.sh
