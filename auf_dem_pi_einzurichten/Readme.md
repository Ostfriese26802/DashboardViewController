# Einrichtung des Pi

## Ablauf/ Funktionsweise
Es werden zwei Systemd-Services installiert.  
Der erste Service startet direkt nach Start des System und daraufhin ein Script, welches folgende Aufgaben abarbeitet:
 - Zu Beginn wird die aufzurufende URL ausgelesen (die aufzurufende URL wird durch DVC konfiguriert)
 - Der Start von unclutter wird im Autostart hinterlegt um den Mauszeiger zu deaktivieren
 - Chromium wird im Kioskmodus mit zugehöriger URL aufgerufen

Der zweite Service überwacht die Datei `/home/pi/dvc/trigger`. Sobald diese Datei verändert wird, wird das Script *"trigger.sh"* gestartet.  
Das Script prüft ob reboot oder shutdown eingetragen wurden durch das DVC und startet das System neu, bzw. fährt dieses herunter.  

## Voraussetzung
Installiert werden müssen Chromium-browser, sowie unclutter (um den Mauszeiger zu deaktivieren)

## Installation/ Einrichtung
Für die Installation muss der Inhalt des gesamten Verzeichnisses auf den Pi kopiert werden.  
Anschließend kann innerhalb dieses Verzeichnisses der installer aufgerufen werden.
```
$ sudo ./install.sh
```

## Alternativ kann die Installation händisch durchgeführt werden:
### Installation Browser und unclutter
```
$ sudo apt update
$ sudo apt install chromium-browser
$ sudo apt install unclutter
```
### Einrichtung Systemd-Service
Die Datei *"chromium-dashboard.service"* muss unter `/etc/systemd/system` abgelegt werden.  
Eine neue Datei anlegen unter `/home/pi/dvc` namens *"trigger"*  
```
$ touch /home/pi/dvc/trigger
```
Die Datei *"trigger-mon.path"* muss unter `/etc/systemd/system` abgelegt werden.  
Die Datei *"trigger-mon.service"* muss unter `/etc/systemd/system` abgelegt werden.  
Anschließend den Deamon neu laden und den Service aktivieren:  
```
$ systemctl daemon-reload
$ systemctl enable chromium-dashboard.service --now
$ systemctl enable trigger-mon.path --now
$ systemctl enable trigger-mon.service --now
```
### Scripte einrichten
Das Script *"chromium-autostart.sh"* wird unter `/opt/dvc/` abgelegt.  
Das Script *"trigger.sh"* wird unter `/opt/dvc/` abgelegt.  
Damit das Script *"chromium-autostart.sh"* durch jeden gestartet werden kann, muss noch die Berechtigung angepasst werden:  
```
$ chmod +x /opt/dvc/chromium-autostart.sh
```
Das Script *"trigger.sh"* wird nur mit dem User root ausgeführt und entsprechend berechtigt:  
```
$ chown root:root /opt/dvc/trigger.sh
$ chmod 700 /opt/dvc/trigger.sh
```
