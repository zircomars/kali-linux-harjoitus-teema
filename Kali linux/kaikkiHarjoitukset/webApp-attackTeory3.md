# Exploiting Web-based Vulnerabilities

At next important is to focus on vulnerability exploitation, about the web-based administration consoles and specific vulnerabilties as cross-site scripting, directory traversal, file inclusion, SQL injection and ect.

## Admin Consoles

At admin console enumeration and exploitation. When penetration tester located an admin console, the simples "exploit" is it just log into it. Often attempt default username/password use enumerated information to guess working credentials or attempt brute force. Like admin/admin (username/password)

Account lockouts will negatiely affect the penetration test, it will block legitimate administrators and may alert blue teams to presence. So must be carefully weight the risk of every atack vector and act carefully and in the best interest of the client. 

For the risk, a compromised administration console is a prime target and may will allow to deloy and run the code on the server, which mean can provide a quick path to a shell.

For example scanning <b>Badstore </b> vulnerabilities and outputs on the list "DIRECTORY" got something interesting so.. it might be login websites, images and ect something maybe hacker/attacker is interesting and or login page where input (username/password) got something for the capture.

```
└─$ dirb http://185.39.153.77 -r

-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Sat Jan 20 14:27:15 2024
URL_BASE: http://185.39.153.77/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt
OPTION: Not Recursive

-----------------

GENERATED WORDS: 4612                                                     

---- Scanning URL: http://185.39.153.77/ ----
==> DIRECTORY: http://185.39.153.77/backup/                             
+ http://185.39.153.77/cgi-bin/ (CODE:403|SIZE:278)                     
+ http://185.39.153.77/favicon.ico (CODE:200|SIZE:1334)                 
==> DIRECTORY: http://185.39.153.77/images/                             
+ http://185.39.153.77/index (CODE:200|SIZE:3583)                       
+ http://185.39.153.77/index.html (CODE:200|SIZE:3583)                  
+ http://185.39.153.77/robots (CODE:200|SIZE:316)                       
+ http://185.39.153.77/robots.txt (CODE:200|SIZE:316)                   
==> DIRECTORY: http://185.39.153.77/supplier/                           
                                                                          
-----------------
END_TIME: Sat Jan 20 14:27:19 2024
DOWNLOADED: 4612 - FOUND: 6

```



