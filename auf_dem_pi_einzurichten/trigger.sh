#!/bin/sh

# Variablen
file=/home/pi/dvc/trigger

# Pruefung ob Datei vorhanden ist und lesen des Inhalts
if [ -f $file ]; then
  content=$(cat $file)   # Inhalt der Datei wird eingelesen
  echo -n > $file  # Datei wird geleert
  case $content in
    reboot   ) logger -t DVC -p info "Reboot durch DVC getriggert!" && shutdown -r now;;
    shutdown ) logger -t DVC -p info "Shutdown durch DVC getriggert!" && shutdown now;;
  esac
else
  echo "Datei" $file "nicht vorhanden!"
fi
