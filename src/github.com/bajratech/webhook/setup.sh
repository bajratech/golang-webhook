#!/bin/bash

# copy supervisor config
cp webhook.conf /etc/supervisor/conf.d/

# copy necessary script and binary to /usr/bin
cp webhook.sh /usr/bin/
cp webhook /usr/bin/

# give executable access to script
chmod +x /usr/bin/webhook.sh