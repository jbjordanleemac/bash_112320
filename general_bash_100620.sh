#!/bin/bash

# print out the last few lines using array

lists=()

for a in `cat /opt/bash_test2/list`
do
  echo "$a"
  lists=("${lists[@]}" "$a")
done

echo "${lists[@]}"

# here we go print the last 2 lines of the list

b="${#lists[@]}"

echo "$b"

for c in {1..3}
do
  echo "${lists[$(( b - 1 ))]}"
  b=$(( b - 1 ))
done

# logical NOT

[ ! -d /tmp/dir100620 ] && echo "/tmp/dir100620 dir NOT exists"

# variable comparison

string1="yes"

if [ "$string1"=="yes" ]
then
  echo "string equals yes"
else
  echo "string not equal yes"
fi 

# positional parameters

IFS=","
echo "script name is $0"
echo "first parameter is $1"
echo "second parameter is $2"
echo "number of parameter is $#"
echo "display all parameter $@"
echo "display all parameter with IFS $*"

# function

echo -n "What's your name: "
read name

hello() {
  echo "Greeting to you my friend: $name"
}

hello

# while 

echo -n "What scripting language you like most? "
read language

case "$language" in 
  Python)
    echo "Python is your favorit"
    ;;
  
  Java)
    echo "You must love Java"
    ;;

  *)
    echo "No scripting language you like"
    ;;
esac

# print out the top 3 most disk usage for each dir

for e in /*
do
  echo "$e"
  cd "$e" && echo `du -sm * . | sort -rn | head -3`
done

# find out the file order than 30 days and display them

for f in /*
do
  echo "$f"
  cd "$f" && echo `find  -mtime +30 -exec ls -lhrt {} \;`
done

# compound command

[ ! -d /tmp/test100620 ] && ( date; hostname; echo "/tmp/test100620 dir NOT exist" ) 
