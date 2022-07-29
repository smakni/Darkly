#!/bin/bash

IP="192.168.56.101"

curl -v --referer "https://www.nsa.gov/" -H "User-Agent: ft_bornToSec" "http://${IP}/index.php?page=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f" | grep flag