#!/bin/bash

#UID        PID  PPID  C STIME TTY          TIME CMD
#root         1     0  0 09:17 ?        00:00:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
#root         2     0  0 09:17 ?        00:00:00 [kthreadd]
#root         3     2  0 09:17 ?        00:00:00 [ksoftirqd/0]

# print out the processes count for each user plus command substitution

echo `ps -ef | awk -F" " '{print $1}' | sort | uniq -c`

# print out the last 3 lines of a file without using tail

# array initilization

lists=()

for a in `cat /opt/bash_test2/list`
do
  echo $a
  lists=(${lists[@]} $a)
done

echo ${lists[@]}

b=${#lists[@]}

echo $b

for c in {1..3}
do
  echo ${lists[$(( b - 1 ))]}
  b=$(( b - 1 ))
done


# how to rename files ending with doc to txt 

touch /tmp/junk{1..3}.doc

for d in `ls /tmp/junk*.doc`
do
  cd /tmp && mv $d ${d/%doc/txt}
done

# function

echo -n "First name: "
read first

echo -n "Last name: "
read last

hello () {
  echo "Your name is $first $last"
}

hello
 
# positional parameters

IFS=","

echo "Script name is $0"
echo "First parameter is $1"
echo "Second paramter is $2"
echo "Total number of parameter is $#"
echo "Display all the parameters $@"
echo "Display all the parameters with IFS $*"


# logical NOT

if [ ! -d /tmp/test_112320 ]
then
  echo "dir test_112320 NOT exist on $(hostname)"
else
  echo "dir test_112320 exists on $(hostname)"
fi


# exit status detection

grep g2 /etc/passwd

if [ $? -eq 0 ]
then
  echo "user g2 exists on host $(hostname)"
else
  echo "user g2 NOT exist on host $(hostnam)"
fi

# arithmetic

echo -n "first number pls: "
read e

echo -n "second number pls: "
read f

addthemup() {
  echo "After adding $e and $f together total sum is $(( e + f ))"
}

addthemup

# case statement

echo -n "Your favoritate scripting Language pls: "
read language

case $language in
  Python) 
    echo "Python is your favorite scripting language!!! "
    ;;
  
  Java)
    echo "Java is your choice!!!"
    ;;

  *)
esac

# while statement

g=0

while [ $g -lt 9 ]
do
  echo $g
  g=$(( g + 1 ))
done

# find out the most use file on each dir

for h in /*
do
  if [ -d $h ]
  then
    echo $h
    cd $h && echo `du -sm * | sort -rn | head -3` 
  fi
done
