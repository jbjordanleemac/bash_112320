#!/bin/bash

# print out the last 3 lines of a file without using tail command

# using array initilize an empty array and adding items one by one

lists=()

for a in `cat /opt/bash_test2/list`
do
  echo "$a"
  lists=(${lists[@]} $a)
done

echo ${lists[@]}

# display the total number of the array

b=${#lists[@]}

echo "$b"

# only print the last 3 lines of a file
for c in {1..3}
do
  echo ${lists[$(( b - 1 ))]}
  b=$(( b - 1 ))
done

# Show the total number of processes running for each user

#UID        PID  PPID  C STIME TTY          TIME CMD
#root         1     0  0 11:36 ?        00:00:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
#root         2     0  0 11:36 ?        00:00:00 [kthreadd]
#root         3     2  0 11:36 ?        00:00:00 [ksoftirqd/0]

echo `ps -ef | awk -F" " '{print $1}' | sort | uniq -c`

# how to rename the files on certail dir ending with doc to txt

# how to use file expansion curley bracket

touch /tmp/junk{1..3}.doc

for d in `ls /tmp/*.doc`
do
  mv "$d" "${d/%doc/txt}"
done

# logical NOT

[ ! -d /tmp/test110120 ] && ( echo "Today is `date +%Y-%m-%d_%H_%M_%S`"; echo "this dir NOT exists on this host $(hostname)" )

# case statement

echo -n "What language you like most? "
read language

case "$language" in 
  Python)
    echo "Python can do web app which is awesome"
    ;;

  Java)
    echo "Java is also a cool language"
    ;;

  *)
    echo "No Scripting language for you I guess"
    ;;
esac

# positional parameters
IFS=","

echo "script name is $0"
echo "first parameter is $1"
echo "second parameter is $2"
echo "Total number of parameter is $#"
echo "Total Parameters display $@"
echo "Total parameter display with IFS $*" 

# if else statement

day="Sunday"

if [ $day=="Sunday" ]
then
  echo "Today is $day"
else
  echo "Today is NOT $day"
fi

# function 

echo -n "First Name: "
read first

echo -n "Last Name: "
read last

hello () {
  echo "Your name is $first $last"
}

hello

# function to display the most used files on each directory

for e in /*
do
  if [ -d "$e" ]
  then 
    echo "$e"
    cd "$e" && echo `du -sm * | sort -rn | head -3`
  fi
done

# if else statement plus test statement

grep g2 /etc/passwd

if [ $? -eq 0 ]
then
  echo " g2 user exists on this host $(hostname) "
else
  echo " g2 user NOT exist on this host $(hostnameP) "
fi

find / -maxdepth 1 -type d -exec echo {} \;

