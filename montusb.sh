#!/bin/bash

action=$(zenity --list --title="Управление флешкой" --text="Что вы хотите сделать?" --radiolist --column="" --column="Действие" TRUE "Примонтировать" FALSE "Отмонтировать")

if [[ $action == "Примонтировать" ]]; then
	sudo mkdir /mnt/usb
	sudo mount /dev/sda /mnt/usb
	zenity --info --title="Успех" --text="Флешка успешно примонтирована."
	ls /mnt/usb
else
	sudo umount /mnt/usb
	zenity --info --title="Успех" --text="Флешка успешно отмонтирована."
fi
