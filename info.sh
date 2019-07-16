#!/bin/bash

ip="$1"
export SSHPASS=$2
if [ -n "$3" ];then
    user=$3
else
    user=root
fi

c1="pwd"
c3="cat /etc/os-release|grep '^NAME='"

c13="bash"

listc=$(egrep "^c\w+=" $0 | awk -F"\"" '{ print $2 }' | sed 's/"//g' | sed ':a; /$/N; s/\n/;/; ta')
sshpass -e ssh -oStrictHostKeyChecking=no $user@$ip -t $listc
