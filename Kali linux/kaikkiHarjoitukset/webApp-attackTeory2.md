# Web Application Assessment Tools
Offensive-Security-OSCP-by-Offensive-Security_2020 (PAGE; 248 - 274, part 2) << on this chapter got many picture of Burpsuite tools, but start at 273 got another tools

- [Web Application Assessment Tools](#Web-Application-Assessment-Tools)
- [DIRB](#DIRB)
- [Burp Suite](#Burp-Suite)

# Web Application Assessment Tools
Long chapter demostrate tools be using to automate the search the console and demostrate exploitation techniques. Consider using a web application assessments tools to enumerate more information about the target.

There are a variety of tools that can aid in discovering and exploiting web application vulnerabilities, many of which come pre-installed in Kali. Browser extensions and focus to manual vulnerability enumeration and exploitations.

<b> Small note; </b> Automated tools can increase our productivity as penetration testers, but we must also understand manual exploitation techniques since tools will not always 
be available in every situation and manual techniques offer greater flexibility and 
customization

## DIRB

DIRB a a web content scanner, which uses a wordlist to find directories and pages by issuing requests to the server. DIRB can identify valid web pages on a web server even e.g. if the main index page is missing.

DIRB will identify some interesting directories on the server but it can be customized to search for specific directories, use a custom dirctionaires for a set custom cookies or header on each request and ect much more.

```
┌──(kali㉿kali)-[~]
└─$ dirb ?       

-----------------
DIRB v2.22    
By The Dark Raver
-----------------


(!) FATAL: Invalid URL format: ?
    (Use: "http://host/" or "https://host/" for SSL)
```

This command searching the web sites www.megacorpone.com will supply arguments as the URL to scan, -r to scan non-recursively, and -z 10 to add 10 a millisecond delay to each requests.

```
┌──(kali㉿kali)-[~]
└─$ dirb http://www.megacorpone.com -r -z 10 

-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Sun Jan  7 20:01:10 2024
URL_BASE: http://www.megacorpone.com/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt
OPTION: Not Recursive
SPEED_DELAY: 10 milliseconds

-----------------

GENERATED WORDS: 4612                                                          

---- Scanning URL: http://www.megacorpone.com/ ----
+ http://www.megacorpone.com/admin (CODE:403|SIZE:284)                                                                                                
==> DIRECTORY: http://www.megacorpone.com/assets/                                                                                                     
+ http://www.megacorpone.com/index.html (CODE:200|SIZE:14603)                                                                                         
==> DIRECTORY: http://www.megacorpone.com/old-site/                                                                                                   
+ http://www.megacorpone.com/robots.txt (CODE:200|SIZE:43)                                                                                            
+ http://www.megacorpone.com/server-status (CODE:403|SIZE:284)                                                                                        
                                                                                                                                                      
-----------------
END_TIME: Sun Jan  7 20:14:07 2024
DOWNLOADED: 4612 - FOUND: 4

```

At the result DIRB made 4612 requests and reported the URL, status, code and size of nine distinct resources. As the default, the tool will recurse into newly-discovered directories, but for example in this case is non-recursive (-r) scan simply reports directories without descending into them.

At begin with non-recursive scan against a large target and recursively search directories or begin within a ful recursive scan depending on needs.

<b>SMALL NOTE;</b> DirBuster is a Java application similar to DIRB that offers multi-threading and a GUI-based interface.

## Burp Suite

Burp Suite is a GUI(graphical user interface) software collection of tools geared towards web application security testing, arguably best-known as powerful proxy tool. It is free Community Edition ( an open source license) mainly contains tools used in manual testing, the commercial versions include additional features and a formidable web application vulnerability scanner. 

Burp Suite has an extensive feature list and is worth investigation. Small note Burp Suite Professional is prohibited during the OSCP exam, and it is also not necesary.

At the Kali Linux open-source operating system inside got already this Bur Suite GUI software so no need to install or anything. It can be found under "Application > 03 Web Application Analysis > Burpsuite". Although just enough go at "applications" > and search by name "burp suite", or just launch and open command line with burpsuite.

```
kali@kali:~$ burpsuite
```

<!-- Offensive-Security-OSCP-by-Offensive-Security_2020 PAGE: 250 - 273 -->

## Nikto

Nikto is a highly configurable Open Source web server scanner it tests for thousands of dangerous files and programs, vulnerable server versiona nd many various server configurations.

It is not for designed for stealth as it will send many requests and embed information about itself in the User-Agents headers.

Nikto can scan multiple servers and ports and it can scans as many pages as it can find out. On sites (pages) with heavy content, such as an ecommerce site (like online store), so a Nikto scan can take several hours to complete it. So there got two options to control the scan duration. The simplest option is to set the "-maxtime" option, it will halt the scan after the specified time limit. This does not optimize the scan in any way.

Nikto will simply stop the scanning. The second option is to tune the scan with the "-T" option. It can use this feature to control which types of the tests we want to run. There are times when we do not want to run all the tests result built in to Nikto, like as verifying if the certain class of vulnerabilities is present. Tuning a scan is invaluable in these situations.

Small command example using by Nikto against host www.megacorpone.com. Using host we want to scan (-host=http://www.megacorpone.com) and for the sake this example will use "-maxtime=30s" to limit the scan duration to scan 30 seconds.

`$nikto -host=<URL-SITE/IP-add> -maxtime=<value by seconds>`

```
┌──(kali㉿kali)-[~]
└─$  nikto -host=http://www.megacorpone.com -maxtime=30s
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Target IP:          149.56.244.87
+ Target Hostname:    www.megacorpone.com
+ Target Port:        80
+ Start Time:         2024-01-19 21:21:52 (GMT2)
---------------------------------------------------------------------------
+ Server: Apache/2.4.38 (Debian)
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ ERROR: Host maximum execution time of 30 seconds reached
+ Scan terminated: 0 error(s) and 2 item(s) reported on remote host
+ End Time:           2024-01-19 21:22:23 (GMT2) (31 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested
```









