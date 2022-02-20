#!/bin/sh

cd /tmp
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus
export DISPLAY=:0
wget -q "https://teleservices.paris.fr/rdvtitres/jsp/site/Portal.jsp?page=appointmentsearch&view=search" -O CNI.res
grep -q "Aucun rendez-vous n'est actuellement disponible." CNI.res
if [ $? != 0 ]
then
	notify-send "WTF un rdv, go reserver (https://teleservices.paris.fr/rdvtitres/jsp/site/Portal.jsp?page=appointmentsearch&view=search)"
fi
rm CNI.res
