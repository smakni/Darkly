#/bin/sh

# https://stackoverflow.com/questions/273743/using-wget-to-recursively-fetch-a-directory-with-arbitrary-files-in-it

rm -rf READMES
mkdir READMES
wget -P ./READMES -r -np -R "index.html*" http://192.168.1.77/.hidden/  -e robots=off -nd 2>&1 log.txt | tee log.txt
wc -w READMES/README* | grep " 1"