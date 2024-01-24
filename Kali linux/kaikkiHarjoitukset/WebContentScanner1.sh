<# DIRB is a Web Content Scanner. It looks for existing (and/or hidden) Web Objects. It basically works by launching a dictionary based attack against a web server and analyzing the responses.

#>

┌──(kali㉿kali)-[~]
└─$ dirb ?       

-----------------
DIRB v2.22    
By The Dark Raver
-----------------


(!) FATAL: Invalid URL format: ?
    (Use: "http://host/" or "https://host/" for SSL)

########################################
# example dirb command check Badstore
┌──(kali㉿kali)-[~]
└─$ dirb http://147.93.120.43 -r

-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Wed Jan 24 19:37:53 2024
URL_BASE: http://147.93.120.43/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt
OPTION: Not Recursive

-----------------

GENERATED WORDS: 4612                                                          

---- Scanning URL: http://147.93.120.43/ ----
==> DIRECTORY: http://147.93.120.43/backup/                                                                                  
+ http://147.93.120.43/cgi-bin/ (CODE:403|SIZE:278)                                                                          
+ http://147.93.120.43/favicon.ico (CODE:200|SIZE:1334)                                                                      
==> DIRECTORY: http://147.93.120.43/images/                                                                                  
+ http://147.93.120.43/index (CODE:200|SIZE:3583)                                                                            
+ http://147.93.120.43/index.html (CODE:200|SIZE:3583)                                                                       
+ http://147.93.120.43/robots (CODE:200|SIZE:316)                                                                            
+ http://147.93.120.43/robots.txt (CODE:200|SIZE:316)                                                                        
==> DIRECTORY: http://147.93.120.43/supplier/                                                                                
                                                                                                                               
-----------------
END_TIME: Wed Jan 24 19:37:56 2024
DOWNLOADED: 4612 - FOUND: 6
                                                                                                                                

########################################

# another example






