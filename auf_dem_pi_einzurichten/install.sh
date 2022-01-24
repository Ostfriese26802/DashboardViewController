#!/bin/sh

main() {
  # Variablen
  install_dir=/opt/dvc/
  home_dir=/home/pi/dvc

  # check ob root das Script ausfuehrt
  check_root

  # Paketlisten aktualisieren
  apt update

  # Chromium-browser installieren
  apt install chromium-browser -y

  # Unclutter installieren
  apt install unclutter -y

  # Check ob das Zielverszeichnis unter /opt/ existiert und ggf. anlegen
  check_dir $install_dir

  # Check ob das Zielverszeichnis unter /home/pi/ existiert und ggf. anlegen
  check_dir $home_dir

  # Trigger-Datei anlegen
  [ ! -f $home_dir/trigger ] && touch $home_dir/trigger

  # Chromium-dashboard.service ablegen
  copy_to_systemd "chromium-dashboard.service"

  # Trigger-mon.path ablegen
  copy_to_systemd "trigger-mon.path"

  # Trigger-mon.service ablegen
  copy_to_systemd "trigger-mon.service"

  # Services aktivieren und starten
  systemctl daemon-reload
  systemctl enable chromium-dashboard.service --now
  systemctl enable trigger-mon.path --now
  systemctl enable trigger-mon.service --now

  # Copy ./trigger.sh to install_dir
  copy_to_install_dir "trigger.sh"

  # Copy ./chormium-autostart.sh to install_dir
  copy_to_install_dir "chromium-autostart.sh"

  # Berechtigungen fuer autostart-script anpassen
  chmod +x $install_dir/chromium-autostart.sh && echo "Berechtigungen erfolgreich gesetzt fuer chromium-autostart.sh"

  # Berechtigungen fuer trigger.sh anpassen
  chown root:root $install_dir/trigger.sh  && echo "Owner erfolgreich gesetzt fuer trigger.sh"
  chmod 700 $install_dir/trigger.sh  && echo "Berechtigungen erfolgreich gesetzt fuer trigger.sh"
}

## Funktionen
# check root-permissions
check_root() {
  if [ $(id -u) != 0 ]; then
    echo "You must run this command as root."
    exit 1
  fi
}

# check directorys
check_dir() {
  [ ! -d $1 ] && mkdir $1 && echo "Verzeichnis" $1 "angelegt"
}

# copy files to /etc/systemd/system
copy_to_systemd() {
    cat ./$1 > /etc/systemd/system/$1 && echo "Datei" $1 "erfolgreich abgelegt"
}

# copy files to $install_dir
copy_to_install_dir() {
  cat ./$1 > $install_dir/$1 && echo "Datei" $1 "erfolgreich abgelegt"
}

## Start
# Abfrage ob mit der Installation begonnen werden soll
read -r -p "Soll mit der Installation begonnen werden? [y/N] " input

case $input in
      [yY][eE][sS]|[yY])
            echo "Installation wird gestartet"
            ## Mainaufruf
            main
            ;;
      [nN][oO]|[nN])
            echo "Installation wird abgebrochen!"
            exit 1
            ;;
      *)
            echo "Invalid input..."
            echo "Installation wird abgebrochen!"
            exit 1
            ;;
esac
