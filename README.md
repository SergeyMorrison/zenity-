montusb.sh
```
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
```
razbienie.sh
```
#!/bin/bash

filename=$(zenity --entry --title="Ввод имени файла" --text="Введите имя файла:")
if [[ ! -f "$filename" ]]; then
        zenity --error --title="Ошибка" --text="Файл не существует"
        exit 1
fi
output_filename=$(zenity --entry --title="Ввод имени нового файла" --text="Введите имя нового файла:")
quantity=$(zenity --entry --title="Ввод количества символов в строке" --text="Введите количество символов в строке:")
sed "s/.\{1,$quantity\}/&\n/g" "$filename" > "$output_filename.txt"
line_number=$(zenity --entry --title="Ввод номера строки" --text="Введите номер строки, в которую нужно добавить фразу 'hello world'")
sed "${line_number}s/.*/& hello world/" "$output_filename.txt" > "$output_filename"
rm "$output_filename.txt"
if zenity --question --title="Успех" --text="Файл успешно обработан и сохранен как $output_filename. Хотите вывести содержимое файла?" --ok-label="Да" --cancel-label="Нет"; then
        zenity --text-info --title="Содержимое файла" --filename="$output_filename"
fi
```
