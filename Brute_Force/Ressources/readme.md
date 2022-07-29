# Brute Force Attack

## Description

https://owasp.org/www-community/attacks/Brute_force_attack

A brute force attack can manifest itself in many different ways, but primarily consists in an attacker configuring predetermined values, making requests to a server using those values, and then analyzing the response	

## Attack

For this attack we are gonna use the script attack.sh
First we need to set the target ip address
Then it will test several password for the user root with curl
And check the html response to find a flag string
We find it for the password shadow

	test with user[admin]:passwd:[shadow]
	<center><h2 style="margin-top:50px;">The flag is : b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2 </h2><br/><img src="images/win.png" alt="" width=200px height=200px></center>				</div>

The flag is : b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2

## Defense

To prevent this attack we should set a strong password policie: min length, special character, numbers, letters.
This way we can limit the possibilitie to find it in the most communs password dictionnarys