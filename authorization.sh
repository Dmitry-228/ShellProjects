#!/bin/bash
check=1
user_data=0
echo "Введите ваш логин:"
read login
while read line
do 
    user_data=($line)
    if [[ ${user_data[0]} == $login ]]
    then
        for ((i=0;i<4;i++))
        do
            if [[ $i == 3 ]]
            then
                echo Вот ты и попался, $USER!
                path="/home/$USER/its_you.mp4"
                ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -t 3 $path
                exit
            fi
            echo "Введите ваш пароль:"
            read -s -t 25 pass <&1
            input=$(echo -n $pass | sha512sum)
            pass=($input)
            password="${pass[0]}"
            if [[ $password == ${user_data[1]} ]]        
            then
                echo "Авторизация успешна"
                exit
            else
                echo Не верный пароль. Осталось попыток $((3-($i+1)))
            fi
        done 
    else
        check=0
    fi
done < users_data.txt
if [[ $check == 0 ]]
then
    echo "Такого логина не существует!"
    exit
fi
