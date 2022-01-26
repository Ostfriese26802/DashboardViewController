# DashboardViewController
Der DashbordViewController ist dafür gedacht einen Raspberry Pi mitzuteilen welche Webseite er im Kiosk Modus auf dem Bildschirm ausgeben soll. Zusätzlich ist es möglich den Raspberry Pi herunterzufahren bzw. neu zu starten.

In der Weboberfläche ist es möglich Gruppen und Benutzer anzulegen. Der Benutzer kann die zuvor genannten Tätigkeiten bei den Raspberry Pis die seiner Gruppe zugeordnet sind durchführen.

Neue Raspberry Pis bzw. Anpassung bestehender können nur durch Mitglieder der Admin Gruppe  durchgeführt / hinzugefügt werden.


#### Installation
Zunächst das Repository auschecken
bundle install
yarn install --check-files

Im Anschluss die Datenbank anlegen
rake db:create
rake db:migrate
rake db:seed (Anlegen des admin Benutzers mit dem Kennwort admin)


#### Auf dem Raspberry PI
Für das starten des Browser im Kiosk Modus inklusive öffnen der hinterlegten URL gibt es im git Repository die entsprechenden Scripte. Gleichzeitig gibt es ein Script das unter dem Root Benutzer ausgeführt muss. Es prüft eine Steuerdatei und startet den Pi neu oder fährt ihn herunter.


##### Beispielbild
![Computerverwaltung](http://www.itbasic.de/wp-content/uploads/2022/01/dvc.png)
