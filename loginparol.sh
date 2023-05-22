#!/bin/bash
echo "Введите ваш логин"
read login
echo "Придумайте пароль"
read password
echo "Повторите пароль"
read password_test
if [[ $password == $password_test ]]
then
    password_save=$(echo -n $password | sha512sum)
    echo "Ваши данные сохранены"
    echo $login $password_save >> users_data.txt
else
    echo "Пароли не совпадают"
fi