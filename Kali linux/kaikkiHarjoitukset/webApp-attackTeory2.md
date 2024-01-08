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




















