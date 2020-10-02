#!/bin/bash

declare -a lists=()


for a in `cat /opt/bash_test2/list`
do
  echo "$a"
  lists=(${lists[@]} "$a")
done 

echo "${lists[@]}"

b=`wc -l /opt/bash_test2/list | awk -F" " '{print $1}'`
echo "$b"

for c in {1..3}
do
  echo "${lists[$b]}"
  b=$(( b - 1 ))
done

