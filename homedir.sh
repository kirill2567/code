#!/bin/bash

# Проверка, был ли передан аргумент
if [ -z "$1" ]; then
  echo "Ошибка: Необходимо указать имя пользователя."
  exit 1
fi

# Проверка наличия пользователя в /etc/passwd
user_info=$(grep "^$1:" /etc/passwd)

if [ -n "$user_info" ]; then
  home_dir=$(echo "$user_info" | cut -d: -f6)
  echo "Домашняя директория пользователя $1: $home_dir"
else
  echo "Ошибка: пользователь $1 не найден."
fi
