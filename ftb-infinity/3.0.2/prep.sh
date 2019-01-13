#!/bin/sh

sed -i "s/motd=.*/motd=${motd}/g" server.properties
sed -i "s/    \"backup_timer\".*/    \"backup_timer\": $backuptimer,/g"  /minecraft/local/ftbu/config.json
sed -i "s/    \"backups_to_keep\".*/    \"backups_to_keep\": $backupstokeep,/g"  /minecraft/local/ftbu/config.json
sed -i "s/      \"Welcome to the server!\".*/      \"$loginmotd\"/g"  /minecraft/local/ftbu/config.json
sed -i "s/    \"restart_timer\":.*/    \"restart_timer\": $restarttimer,/g"  /minecraft/local/ftbu/config.json
sed -i "s/\[\].*/[\n{\n\"uuid\": \"$adminuuid\",\n\"name\": \"$adminname\",\n\"level\": 4\n}\n]/g" ops.json
./ServerStart.sh