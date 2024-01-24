# DIRB 
# DIRB is a command line tool you can use to fuzz web sites or web apps. It  finds files and directories on your target site that are not directly linked from a publicly accessible page on the site or from the Internet.

######################################################
# few examples and some help and directionaries commands

┌──(kali㉿kali)-[~]
└─$ man dirb

DIRB(1)                                            General Commands Manual                                           DIRB(1)

NAME
       dirb - Web Content Scanner

SYNOPSIS
       dirb <url_base> <url_base> [<wordlist_file(s)>] [options]

DESCRIPTION
       DIRB  IS  a Web Content Scanner. It looks for existing (and/or hidden) Web Objects. It basically works by launching a
       dictionary basesd attack against a web server and analizing the response.

OPTIONS
       -a <agent_string>
               Specify your custom USER_AGENT.  (Default is: "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)")

       -b      Don't squash or merge sequences of /../ or /./ in the given URL.

       -c <cookie_string>
               Set a cookie for the HTTP request.

       -E <certificate>
               Use the specified client certificate file.

       -f      Fine tunning of NOT_FOUND (404) detection.

       -H <header_string>
               Add a custom header to the HTTP request.

       -i      Use case-insensitive Search.

       -l      Print "Location" header when found.

       -N <nf_code>
               Ignore responses with this HTTP code.

 Manual page dirb(1) line 1 (press h for help or q to quit)

######################################################

# another example using hostname "www.megacorpone.com" , it supply several arguments: the URL to scan, -r to scan non-recursively, and -z 10 to add a 10 millisecond delay to each request

#  By default, the tool will recurse into newly-discovered directories, but in this case, our non-recursive (-r) scan simply reports directories without descending into them

┌──(kali㉿kali)-[~]
└─$ dirb http://www.megacorpone.com -r -z 10

-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Wed Jan 24 20:09:29 2024
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
END_TIME: Wed Jan 24 20:22:18 2024
DOWNLOADED: 4612 - FOUND: 4

####################################

┌──(kali㉿kali)-[~]
└─$  dirb-gendict -h
Usage: dirb-gendict -type pattern
  type: -n numeric [0-9]
        -c character [a-z]
        -C uppercase character [A-Z]
        -h hexa [0-f]
        -a alfanumeric [0-9a-z]
        -s case sensitive alfanumeric [0-9a-zA-Z]
  pattern: Must be an ascii string in which every 'X' character wildcard
           will be replaced with the incremental value.

Example: dirb-gendict -n thisword_X
  thisword_0
  thisword_1
  [...]
  thisword_9













 
