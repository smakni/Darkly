# Data scraping

## Description

https://owasp.org/www-community/attacks/Forced_browsing

For this vulnerability we find a directory .hidden with countless folders containing other folders and readme files
We are gonna download all these readmes recurscivly with wget to find the one witch contain the flag
This is a data scraping vulnerabilty or forced browsing
Forced browsing is an attack where the aim is to enumerate and access resources that are not referenced by the application, but are still accessible.
An attacker could explore or download all our files with a scraping tool or script to get sentivive data

## Attack

	$ sh attack.sh
	
	...Download all readmes... cf. log file

	README.15794:Hey, here is your flag : d5eec3ec36cf80dce44a896f961c1831a05526ec215693c8f2c39543497d4466

[Link to file](http://${IP}/.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README)

## Defense

Block access to these files and make them private
