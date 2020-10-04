#!/bin/bash
# print the last 4 lines for a file called list without using tail 100420
lists=()

for a in `cat /opt/bash_test2/list`
do
  echo "$a"
  lists=(${lists[@]} $a)
done

echo "${lists[@]}"

b=${#lists[@]}
echo "$b"

for c in {1..4}
do
  echo "${lists[$(( b - 1 ))]}"
  b=$(( b - 1 ))
done
