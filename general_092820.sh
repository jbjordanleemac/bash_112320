#!/bin/bash

# define a variable

a="stuff"
echo "$a"

# if else statement

echo -n "Do you enjoy? "
read answer

if [ $answer == "yes" ]
then
  echo "Looks like you enjoy !!!"
else
  echo "Maybe not that fun "
fi


# case statement

echo -n "What program language you like most? "
read language

case "$language" in
  python)
    echo "You must like python"
    ;;
  java)
    echo "You must love java"
    ;;
  *)
    echo "No scripting for you"
    ;;
esac

# file expansion and command subsitution

b=`ls /opt/{bash_test,bash_test2}`
# echo "$b"

# Logical NOT

[ ! -d /opt/test092820 ] && echo " test092820 dir not under opt "

# for loop and command execution

for c in $(ls /opt/bash_test2)
do
  echo "$c"
done

# for loop2 and command excution

for d in /opt/bash*
do
  echo "$d"
done

# pasitional parameter

IFS=","

echo "script name is : $0"
echo "first parameter is : $1 "
echo "second parameter is: $2 "
echo "total number of parameter is : $# "
echo "display all parameters : $@"
echo "display all parameter including IFS : $*"

# number adding

echo -n "Please enter first number: "
read first
echo -n "Please enter second number: "
read second

total=$(( first + second ))
echo "Total of $first plus $second is $total"

# function

sum() {
  addthemup=$(( first + second ))
  echo " $first plus $second equal $addthemup "
}

sum

# how to find out ip address 

# inet 192.168.1.132/24 
info=$(ip a)
echo "$info" > /opt/bash_test2/result
ip=`grep '\<inet\>' /opt/bash_test2/result | grep -v '127.0.0.1' | awk -F" " '{print $2}' | awk -F"/" '{print $1}'`
echo "ip address for this host $(hostname) is $ip"
