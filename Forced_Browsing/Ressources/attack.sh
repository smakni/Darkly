#!/bin/sh

IP="192.168.56.101"

rm -rf READMES
mkdir READMES
wget -P ./READMES -r -np -R "index.html*" "http://${IP}/.hidden/"  -e robots=off -nd 2>&1 log.txt | tee log.txt
cd READMES
grep 0 README*