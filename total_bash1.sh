#!/bin/bash

# for loop command subsitutue1

for a in `cat /opt/bash_test2/list`
do
  echo "$a"
done

# arithmetic

b=$((2+4))
echo "b equal $b"

# while loop

c=0

while [ "$c" -lt 5 ]
do
  echo "$c"
  c=$((c+1))
done

# positional parameter

IFS=","
echo "script name $0"
echo "first paramenter: $1"
echo "second paramenter: $2"
echo "Total number of parameter: $@"
echo "Total number of parameter: $*"


# if else statement

day="Sun"

if [ $day == "Sun" ]
then
  echo "Today is $day"
else
  echo "Today is NOT $day"
fi

# Logical NOT plus Logical And

[ ! -d /opt/test092720 ] && mkdir -p /opt/test092720


# file expansion 

d=`ls /opt/{bash_test,bash_test2}`
echo "$d"

# function 

finddatetime() {
  echo "Today is $(date)"
}

$(finddatetime)

e=`seq 2 4 50`
echo "$e"

# exit status value

grep g2 /etc/passwd

echo "excution exit value is $?"

if [ "$?" -eq 0 ]
then
  echo "g2 user found on this host $(hostname)"
else
  echo "g2 user NOT found on this host $(hostname)"
fi
