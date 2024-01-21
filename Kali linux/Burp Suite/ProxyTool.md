# Burp Suite proxy tool

Just click on navigation bar "Proxy" tool, whit this tool can interecpt any request send from the browser before it is passed on to the server. It can change almost anything abou the request such as parameter names, form values or adding new headers. With this let penetration tester how an application handles unexpected arbitrary input. E.g. an input field might have a size limit of 20 characters, but with Burp Suite to modify a request to submit 30 characters.

To order to set up a proxy, and disable the "interecpt tool", check under the Interecpt tab. When "Intercept" is enabled, so it manually click on "Forward" to send each request onward to its destination. When click "Drop" to not send the request. There are times when want to intercept traffic and modify it, but are just for browsing a site, have to click "Forward" on each request to becomes veri tedious.

Basically button "Intercept" is like on/off toggle to displays the current situation current state of the tool and it will can be used to enable or disabled it as required. So, for set this to "Intercept" is off to allow the target browser traffic to flow normally.

![Alt text](BurpSuite_images/burpsuiteProxy-1.png)

![Alt text](BurpSuite_images/burpsuiteProxy-2.png)


## First check

Small practices so review the proxy listener settings. The "proxy settings" sub-tab show what ports are listening for proxy requests.

![Alt text](BurpSuite_images/burpsuiteProxy-3.png)

This is just default view, is enables a proxy listener on "localhost:8080". This is just the host and port the browser must connect to in order to proxy traffic through Burp Suite. Let the default setting alone (leave it).

![Alt text](BurpSuite_images/burpsuiteProxy-4.png)


## Another check
<!-- Offensive-Security-OSCP-by-Offensive-Security_2020.pdf PAGE; 255 - --> 

Check the revivew is at "proxy" -> "Http history" at as default it's empty and blank until traffic has been sent through Burp Suite.

![Alt text](BurpSuite_images/burpsuit-scan-1.png)















