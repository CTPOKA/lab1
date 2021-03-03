#!/bin/bash

echo "Program displays the number of files owned by the specified user"
echo "Gnedenkov Daniil"

a="y"
while [ $a = "y" ]
do
    echo "Current directory: $PWD"

    while [ $a = "y" ]
    do
        read -p "Enter username:  " $usr

        grep "^$usr:" /etc/passwd >/dev/null
        if [ $? -ne 0 ]
        then
            echo "User $usr does not exist"
            echo "Try again? (y/n)"
            read a
        else
            read -p "Enter directory name:  " $path
            d=$(find $path -user $usr | wc)
            echo "Number of files:"`expr "$d" : '\(......[0-9]*\)'`
            break
        fi
    done

    echo "Restart program? (y/n)"
    read a
done
