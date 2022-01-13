# Einrichtung des Pi

## Ablauf/ Funktionsweise
Es wird ein Systemd-Service installiert, welcher nach erfolgtem Start des Systems läuft.
Dieser Service startet darauf ein Script, welches folgende Aufgaben abarbeitet:
 - Zu Beginn wird die aufzurufende URL ausgelesen (die aufzurufende URL wird durch DVC konfiguriert)
 - Der Start von unclutter wird im Autostart hinterlegt um den Mauszeiger zu deaktivieren
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
Die Datei *"chromium-dashboard.service"* muss unter `/etc/systemd/system` abgelegt werden.
Die Datei *"trigger-mon.service"* muss unter `/etc/systemd/system` abgelegt werden.
Die Datei *"trigger-mon.path"* muss unter `/etc/systemd/system` abgelegt werden.
Anschließend den Deamon neu laden und den Service aktivieren:
```
$ systemctl daemon-reload
$ systemctl enable chromium-dashboard.service --now
$ systemctl enable trigger-mon.path --now
```
### Scripte einrichten
Das Script *"chromium-autostart.sh"* wird unter /opt/dvc/ abgelegt.
Das Script *"trigger.sh"* wird unter /opt/dvc/ abgelegt.
Damit das Script *"chromium-autostart.sh"* durch jeden gestartet werden kann, muss noch die Berechtigung angepasst werden:
```
$ chmod +x /opt/dvc/chromium-autostart.sh
```
Das Script *"trigger.sh"* wird nur mit dem User root ausgeführt und entsprechend berechtigt:
```
$ chown root:root /opt/dvc/trigger.sh
$ chmod 700 /opt/dvc/trigger.sh
```
