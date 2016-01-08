#!/bin/bash
#
# This script sets a daemon up for izou and adds it to the raspberry-pi start-up
# services.

echo "#!/bin/bash

java -jar -DnoSecurity=true /izou/izou/izou.jar" >> izou-start.sh

echo "#!/bin/bash
pid=\`ps aux | grep izou | awk '{print \$2}'\`
kill -9 \$pid" >> izou-stop.sh

echo "#!/bin/bash
# Izou
#
# description: Daemon for Izou

case \$1 in
    start)
        /bin/bash /usr/local/bin/izou-start.sh
    ;;
    stop)
        /bin/bash /usr/local/bin/izou-stop.sh
    ;;
    restart)
        /bin/bash /usr/local/bin/izou-stop.sh
        /bin/bash /usr/local/bin/izou-start.sh
    ;;
esac
exit 0" >> izou

mv izou-start.sh /usr/local/bin/
mv izou-stop.sh /usr/local/bin/
mv izou /etc/init.d

cd /etc/init.d
chmod u+x izou
update-rc.d izou defaults

rm -rf /home
chmod -R 777 /izou
