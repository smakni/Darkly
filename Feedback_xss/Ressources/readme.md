# Feedback_xss


## Description

https://owasp.org/www-community/attacks/xss/

Here we find a classic XXS vulnerabilitie, it consist in uploading a malicious script in a db to be run on a client side
<script>...</scritp>


## Attack
If we go on http://${IP}/index.php?page=feedback
Type script in one of the input
It will save our input and show it on our browser, if it was a <script>...</script>
We would be able to exec any code on a client side that would read it

THE FLAG IS : 0FBB54BBF7D099713CA4BE297E1BC7DA0173D8B3C21C1811B916A3A86652724E

## Defense
We should verify our input before validation to check for anything that could end up being a malicious script, mainly <script>