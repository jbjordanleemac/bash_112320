#!/bin/bash

# array to display the last 3 lines without using tail 

lists=()

for a in `cat /opt/bash_test2/list`
do
  echo "$a"
  lists=(${lists[@]} $a)
done

echo "${lists[@]}"

b=${#lists[@]}
echo "$b"

for c in {1..3}
do
  echo "${lists[$(( b - 1 ))]}"
  b=$(( b - 1 ))
done

# display the process count for each user

#D        PID  PPID  C STIME TTY          TIME CMD
#root         1     0  0 15:59 ?        00:00:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
#root         2     0  0 15:59 ?        00:00:00 [kthreadd]
#root         3     2  0 15:59 ?        00:00:00 [ksoftirqd/0]
#root         4     2  0 15:59 ?        00:00:00 [kworker/0:0]

echo `ps -ef | awk -F" " '{print $1}' | sort | uniq -c` 

# rename files from .doc to .txt under a dir

touch /tmp/{file1,file2,file3}.doc

for d in `ls /tmp/*.doc`
do
  mv "$d" "${d%.doc}.txt"
done 


# logical NOT compound command plus commnad substitution

[ ! -d /tmp/test1010 ] && (echo `date +%Y-%m-%d_%H-%M-%S`; echo "test1010 dir NOT exist on this host $(hostname)")

# case statement

echo -n "What's your favorate scripting language? "
read language

case "$language" in 
  Python)
    echo "I knew you Love Python!!! "
    ;;

  Java)
    echo "You're a Java Guy!!! "
    ;;

  *)
    echo "No Scripting for U I guess!!!"
    ;;
esac

  
# Positional Parameter

IFS=","

echo "Script name is: $0"
echo "First parameter is $1"
echo "Second parameter is $2"
echo "Total number of parameter is $#"
echo "Here are all your parameters $@"
echo "Here are all your parameters with IFS $*"


# if else statement plus test statement

grep g2 /etc/passwd

if [ $? -eq 0 ]
then
  echo " g2 user existed on this host $(hostname) "
else
  echo " g2 user NOT existed on this host $(hostname) "
fi

# function to display most used directory

for e in /*
do
  echo "$e"
  cd "$e" && echo `du -sm * | sort -rn | head -3`
done 

# string comparison

today="Sat"

if [ "$today"=="Sat" ]
then
  echo "Today is $today"
else
  echo "Today is NOT $today"
fi

# function

echo -n "Enter first name: "
read first
echo -n "Enter last name: "
read last

hello() {
  echo "You are $first $last"
}

hello


