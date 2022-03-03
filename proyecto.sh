#!/bin/bash
comp_pihole=`which pihole`
comp_curl=`which curl`
ip=`hostname -i`
admin="/admin/"
if [ "$comp_pihole" == "" ]; then
        read -p "No tienes instalado el servicio DNS. ¿Quieres instalarlo? S/N " opcion1
        while [ $opcion1 != "S" ] && [ $opcion1 != "N" ] && [ $opcion1 != "n" ] && [ $opcion1 != "s" ]
        do
                read -p "No te he entendido, quieres instalar el servicio DNS S/N" opcion1
        done
        if [ "$opcion1" != "n" ] && [ "$opcion1" != "N" ]; then
        if [ $comp_curl == "" ]; then
        sudo snap install curl
        fi
        sudo apt update
        sudo apt upgrade
        curl -sSL https://install.pi-hole.net | bash
        else
        exit
        fi
else
while [ $opcion2!=10 ]
do
echo "OPCIONES:"
echo "1. Comprobar estado PIHOLE"
echo "2. Iniciar servicio PIHOLE"
echo "3. Parar servicio PIHOLE"
echo "4. Abrir página administración PIHOLE"
echo "5. Cambiar contraseña PIHOLE"
echo "6. Desinstalar PIHOLE"
echo "7. Salir"
read -p "¿Que deseas hacer? " opcion2
case $opcion2 in
        1)
                sudo service pihole-FTL status
        ;;
        2)
                sudo service pihole-FTL start
        ;;
        3)
                sudo service pihole-FTL stop
        ;;
	4)
		firefox "$ip/admin"
	;;
	5)
		pihole -a -p
	;;
        6)
                pihole uninstall
                sudo rm -rf /etc/.pihole /etc/pihole /opt/pihole /usr/bin/pihole-FTL /usr/local/bin/pihole /var/www/html/admin
		reboot
        ;;
        7)
                exit
        ;;
        *)
                echo "Elige una opción válida"
        ;;
esac
done
fi
