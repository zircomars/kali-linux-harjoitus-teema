# Cross-Site Scripting (XSS)
<!-- Offensive-Security-OSCP-by-Offensive-Security_2020 page: 297 - 312 -->

One of the important features of well-defended web application is a data sanitization ( the secure and permanent erasure of sensitive data from datasets and media to guarantee that no residual data can be recovered even through extensive forensic analysis). 

Which a process in which user input is process, removing or transfoming all dangerous characters or stings. Unsanitized  data allows an attack to inject and potentially execute malicious code. When this unsanitized input is displayed on a web page, this creates a Cross-Site Scripting (XSS) vulnerability.

XSS though was elatively low-isk vulnerability, but today as in the future is both high-risk and prevalent, allowing attackers to inject client side scripts as JavaScipt into web pages viewed by other users.

Cross-Site Scripting got few types as e.g. Non-persistent (reflected), Persistent (or stored) and DOM-based (in client-side code).

- Stored XSS attacks is another name as Persistent XSS, occurs when the exploit payload is stored in a database or else cached by a server. The web application will retrieves this payload and isplays it to anyone that views a vulnerable page(s).  A single Stored XSS vulnerability can therefore attack all users of the site. Stored XSS vulnerabilities often exist in forum software, especially in comment sections, or in product reviews.

- Reflected
- DOM-based


