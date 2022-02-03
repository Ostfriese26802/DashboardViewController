#!/bin/sh

# Variablen
file=/home/pi/dvc/trigger

# Pruefung ob Datei vorhanden ist und lesen des Inhalts
if [ -f $file ]; then
  content=$(cat $file)   # Inhalt der Datei wird eingelesen
  sleep 5
  [ ! -z "$content" ] && echo -n > $file  # Datei wird geleert
  case $content in
    reboot   ) logger -t DVC -p info "Reboot durch DVC getriggert!" && shutdown -r now;;
    shutdown ) logger -t DVC -p info "Shutdown durch DVC getriggert!" && shutdown now;;
    update   ) logger -t DVC -p info "Update durch DVC getriggert!" && apt update && apt upgrade -y && shutdown -r now;;
  esac
else
  echo "Datei" $file "nicht vorhanden!"
fi
