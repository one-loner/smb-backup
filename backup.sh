#!/bin/bash
REMOTE_BACKUP_DIR=directory #Сюда пишем имя папки на шаре
USER="user"                 #Имя пользователя SMB
PASSWORD="password"         #Пароль пользователя SMB
REMOTE_HOST=192.168.1.1     #IP-адрес сервера, данные с которого будем бекапить
MOUNT_DIR=/mnt/remote/      #Директория для монтирования шары на локальном сервере
DT=`date '+%Y%m%d'`         #Переменная, выводящая текущую дату. Используется в названии архива
BACKUP_DIR=/home/backups/   #Директория, куда будут складываться бекапы
mount -r -t cifs -o user=$USER,password=$PASSWORD //$REMOTE_HOST/$REMOTE_BACKUP_DIR/ $MOUNT_DIR
tar cvfz $BACKUP_DIR/backup_$DT.tar.gz $MOUNT_DIR
umount $MOUNT_DIR
