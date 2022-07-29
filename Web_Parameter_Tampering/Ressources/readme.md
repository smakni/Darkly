# Web_Parameter_Tampering

## Description

https://owasp.org/www-community/attacks/Web_Parameter_Tampering

The Web Parameter Tampering attack is based on the manipulation of parameters exchanged between client and server in order to modify application data, such as user credentials and permissions, price and quantity of products, etc.

## Attack

On the feedback page

we Inspect the grade input
and find

	<form action="#" method="post">
		<input type="hidden" name="sujet" value="2">
		<select name="valeur" onchange="javascript:this.form.submit();">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
		</select>
	</form>

We see that the value is writen in the html and when we select an option the form directly submit it to the server

We modify the value in the html and select the modified option

## Defense

Check input in code before submiting

Set bounderies for your value 1 <= value <= 10