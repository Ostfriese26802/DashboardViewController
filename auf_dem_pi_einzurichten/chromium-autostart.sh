#!/bin/sh

# Variablen
autostart_config = /etc/xdg/lxsession/LXDE-pi/autostart
url_file = /home/pi/url  # Pfad zur Datei welche die aufzurufende URL beinhaltet
url = $(cat $url_file)   # Inhalt der Datei wird eingelesen
# (!) Die Datei darf nur die URL beinhalten, ggf. mehrere durch Komma getrennt (!)

# Unclutter zum Autostart hinzufuegen
fgrep -q '@unclutter' $autostart_config || echo '@unclutter' >> $autostart_config

# Bildschirmschoner deaktivieren und dem Autostart hinzufuegen
fgrep -q '@xset s off' $autostart_config || echo '@xset s off' >> $autostart_config
fgrep -q '@xset -dpms' $autostart_config || echo '@xset -dpms' >> $autostart_config
fgrep -q '@xset s noblank' $autostart_config || echo '@xset s noblank' >> $autostart_config

# Chromium im Kiosk-modus starten
chromium-browser --kiosk $url
