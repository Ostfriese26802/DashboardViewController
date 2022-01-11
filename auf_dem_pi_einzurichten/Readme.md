# Einrichtung des Pi

## Ablauf/ Funktionsweise
Es wird ein Systemd-Service installiert, welcher nach erfolgtem Start des Systems läuft.
Dieser Service startet ein Script, welches folgende Aufgaben abarbeitet:
 - Zu Beginn wird die aufzurufende URL ausgelesen (die aufzurufende URL wird durch DVC konfiguriert)
 - Der Start von unclutter wird im Autostart hinterlegt, um den Mauszeiger zu deaktivieren
 - Chromium wird im Kioskmodus mit zugehöriger URL aufgerufen

## Voraussetzung
Installiert werden müssen Chromium-browser, sowie unclutter (um den Mauszeiger zu deaktivieren)

## Installation/ Einrichtung
### Installation Browser und unclutter
```
$ sudo apt update
$ sudo apt install chromium-browser
$ sudo apt install unclutter
```
### Einrichtung Systemd-Service
Die Datei *"chromium-dashboard.service"* wird unter `/etc/systemd/system` abgelegt.
Anschließend den Deamon neu laden und den Service aktivieren:
```
$ systemctl daemon-reload
$ systemctl enable chromium-dashboard.service
```
### Start-Script einrichten
Das Script *"chromium-autostart.sh"* wird unter `/opt/` abgelegt.
Damit das Script durch jeden gestartet werden kann, muss noch die Berechtigung angepasst werden:
```
$ chmod +x /opt/chromium-autostart.sh
