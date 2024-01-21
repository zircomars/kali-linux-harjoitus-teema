# Bup Suite SSL/TSL certificate

<!-- Offensive-Security-OSCP-by-Offensive-Security_2020.pdf practice page: 268 - 270 -->

Burp Suite can easily decyrpt the HTTPS protocol traffic by generating its own SSL/TSL certificate, which essentially man-in-the-middling attack ourselves in order to capture the traffic. These warning may be irritating, but we can prevent them by issuing a new certificate and importing it into FireFox.


Each Burp Suite CA (Certificate authority) certificate should be unique, which will ensure the by regenerating it. This setting can be found  "Proxy" > "Proxy settings" under the Tools - settings, click the "regenerate CA certificate" and will popup small window and accep it (YES).

![Alt text](BurpSuite_images/burpSuite_SSL-1.png)

![Alt text](BurpSuite_images/burpSuite_SSL-2.png)

After "yes" it may wonder why did not happening? Because there (may) need to restart this Burp Suite.

After restart open firefox empty tab and input the same host website as under the "Proxy listeners" 127.0.0.1:8080 & but book say open host "http://burp", but if open this site it may will nothing.. just try both anyway as IP-add and hostname.

![Alt text](BurpSuite_images/burpSuite_SSL-3.png)


Next step is add to hostname path "/cert" so it will give some document/files to tester/user, it will be to "download" folder path and make small check how it looks like.

![Alt text](BurpSuite_images/burpSuite_SSL-4.png)

![Alt text](BurpSuite_images/burpSuite_SSL-5.png)

![Alt text](BurpSuite_images/burpSuite_SSL-6.png)

continue...




