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
# Es wird unclutter gestartet um den Mauszeiger zu deaktivieren
# Der Bildschirmschoner wird deaktiviert
# Chromium wird im Kioskmodus mit zugehöriger URL aufgerufen

# Variablen
url_file = /home/pi/url  # Pfad zur Datei welche die aufzurufende URL beinhaltet
url = $(cat $url_file)   # Inhalt der Datei wird eingelesen
# (!) Die Datei darf nur die URL beinhalten, ggf. mehrere durch Komma getrennt (!)

# Unclutter starten
@unclutter

# Bildschirmschoner deaktivieren
@xset s off
@xset -dpms
@xset s noblank

# Chromium im Kiosk-modus starten
@chromium-browser --kiosk $url
