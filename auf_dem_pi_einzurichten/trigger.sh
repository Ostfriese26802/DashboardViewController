#!/bin/sh

# Variablen
file=/Users/Jannes/projects/tmp/trigger

# Pruefung ob Datei vorhanden ist und lesen des Inhalts
if [ -f $file ]; then
  content=$(cat $file)   # Inhalt der Datei wird eingelesen
  echo -n > $file  # Datei wird geleert
  case $content in
    reboot   ) echo "Reboot durch DVC getriggert!" && shutdown -r now;;
    shutdown ) echo "Shutdown durch DVC getriggert!" && shutdown now;;
  esac
else
  echo "Datei" $file "nicht vorhanden!"
fi
