#!/bin/bash
read login
read -s password
password_save=$(echo -n $password | sha512sum)
echo $login $password_save >> users_data.txt