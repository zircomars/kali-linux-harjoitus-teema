# Cross-Site Scripting (XSS)
<!-- Offensive-Security-OSCP-by-Offensive-Security_2020 page: 297 - 312 -->

One of the important features of well-defended web application is a data sanitization ( the secure and permanent erasure of sensitive data from datasets and media to guarantee that no residual data can be recovered even through extensive forensic analysis). 

Which a process in which user input is process, removing or transfoming all dangerous characters or stings. Unsanitized  data allows an attack to inject and potentially execute malicious code. When this unsanitized input is displayed on a web page, this creates a Cross-Site Scripting (XSS) vulnerability.

XSS though was elatively low-isk vulnerability, but today as in the future is both high-risk and prevalent, allowing attackers to inject client side scripts as JavaScipt into web pages viewed by other users.

Cross-Site Scripting got few types as e.g. Non-persistent (reflected), Persistent (or stored) and DOM-based (in client-side code).

- Stored XSS attacks is another name as Persistent XSS, occurs when the exploit payload is stored in a database or else cached by a server. The web application will retrieves this payload and isplays it to anyone that views a vulnerable page(s).  A single Stored XSS vulnerability can therefore attack all users of the site. Stored XSS vulnerabilities often exist in forum software, especially in comment sections, or in product reviews.

- Reflected XSS attacks include the payload in a crafted request or link. The web application will takes this value and places it into the page content. This variant only attacks the person submitting the request or viewing the link. Reflected XSS vulnerabilities can often occur in search fields and results, as well as anywhere user input is included in error messages.
  
- DOM-based XSS attacks are similar to the other two types (Stored and Reflected XSS), but take place solely within the page’s Document Object Model (DOM).  The browser
parses a page’s HTML content and generates an internal DOM representation. JavaScript can programmatically interact with this DOM. In other words a DOM-based XSS attack, the malicious data does not touch the web server. Rather, it is being reflected by the JavaScript code, fully on the client side.

This variant occurs when a page’s DOM is modified with user-controlled values. DOM-based XSS can be stored or reflected. The key difference is that DOM-based XSS attacks occur when a browser parses the page’s content and inserted JavaScript is executed.

Regardless of how the XSS payload is delivered and executed, the injected scripts run under the context of the user viewing the affected page.

## Identifying XSS Vulnerabilities

Finding potential entry points for XSS by examining a web application and identifying input fields (such as search fields) that accept unsanitized input which is displayed as output in
subsequent pages.

When identify an entry point, it can input special characters, and observe the output to see if any of the special characters return unfiltered.

The most common special characters used for purpose include; `< > ' " { } ;` as special characters for HTML and JavaScript

## Basic XSS

This is like former when practices/demonstrate within Badstore (small repeat) what this XSS is meaning and although of course there is other tools practices with Kali Linux, not just Badstore.






