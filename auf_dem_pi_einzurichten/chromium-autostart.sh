#!/bin/sh

# Dieses Script wird mittels Systemd nach erfolgtem Start des Systems aufgerufen:
# Dazu die Unit-File "chromium-dashboard.service" unter /etc/systemd/system ablegen
# anschließend den neuen Service einlesen:
# Bitte ausfuehren: systemctl daemon-reload
# Für den Systemstart aktivieren:
# Bitte ausführen: systemctl enable chromium-dashboard.service
#
# Dieses Script "chromium-autostart.sh" muss unter /opt/ abgelegt werden
# Berechtigung anpassen: chmod +x /opt/chromium-autostart.sh
#
# Installiert sein muessen zur Ausfuehrung: unclutter und chromium-browser
#
# Ablauf:
# Zu Beginn wird die aufzurufende URL ausgelesen
# Der Start von unclutter wird im Autostart hinterlegt um den Mauszeiger zu deaktivieren
# Der Bildschirmschoner wird deaktiviert und im Autostart hinterlegt
# Chromium wird im Kioskmodus mit zugehöriger URL aufgerufen

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
