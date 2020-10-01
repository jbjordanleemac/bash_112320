#!/bin/bash

#variable assignment

day="Wed"
echo "$day"

# sum of two numbers

echo -n "Enter the first number: "
read first

echo -n "Enter the second number: "
read second

total=$(( first + second ))
echo "Here is your total by adding $first and $second equal $total"

# function of adding two numbers

sum() {
  addthemup=$(( first + second ))
  echo "By adding $first and $second equal $addthemup"
}

sum

# if else statement

aqi="Bad"

if [ $aqi == "Good" ]
then
  echo "Air quality is good"
else
  echo "Air Quality is NOT good"
fi 

# while statement

a=0

while [ $a -lt 5 ]
do
  echo "$a"
  a=$(( a + 1 ))
done

# positional parameters

IFS=","
echo " Script name is $0"
echo " First parameter is $1 "
echo " Second parameter is $2 "
echo " Total number of parameters is $#"
echo " Display all parameters: $@"
echo " Display all parameters including IFS: $*"

# file expansion and command substituion

b=`ls /opt/{bash_test,bash_test2}`
#echo "$b" 

# display current date and time

showdatetime() {
  echo "Here is your current date and time $( date +"%Y-%m-%d_%H-%M-%S" )"
}

showdatetime

# case statement

echo -n "Enter the car model you like most: "
read car

case $car in 
  toyota)
    echo "Looks like you like Toyota"
    ;;
  
  honda)
    echo "You might like Honda better"
    ;;
  *)
    echo "you don't like car"
    ;;
esac

findoutversion() {
  version=`grep -i Core /etc/*release | grep centos | awk -F":" '{print $2}' | sed 's/.*release//'`
  echo "Version of this linux host $(hostname) is $version"
}

findoutversion
