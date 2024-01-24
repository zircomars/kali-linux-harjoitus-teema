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

















 
