# harjoitus linkki;; https://www.freecodecamp.org/news/an-introduction-to-web-server-scanning-with-nikto/


# ensimmäisessä skannauksessa tapahtuu Nikto suorittaa perusskannauksen portissa 80 tietylle toimialueelle ja antaa täydellisen raportin suoritettujen tarkistusten perusteella ja siksi peruuttin eli CTRL + C

┌──(kali㉿kali)-[~]
└─$ nikto -h scanme.nmap.org
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Multiple IPs found: 45.33.32.156, 2600:3c01::f03c:91ff:fe18:bb2f
+ Target IP:          45.33.32.156
+ Target Hostname:    scanme.nmap.org
+ Target Port:        80
+ Start Time:         2023-11-07 13:41:31 (GMT2)
---------------------------------------------------------------------------
+ Server: Apache/2.4.7 (Ubuntu)
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ No CGI Directories found (use '-C all' to force check all possible dirs)
+ Apache/2.4.7 appears to be outdated (current is at least Apache/2.4.54). Apache 2.2.34 is the EOL for the 2.x branch.
+ /index: Uncommon header 'tcn' found, with contents: list.
+ /index: Apache mod_negotiation is enabled with MultiViews, which allows attackers to easily brute force file names. The following alternatives for 'index' were found: index.html. See: http://www.wisec.it/sectou.php?id=4698ebdc59d15,https://exchange.xforce.ibmcloud.com/vulnerabilities/8275
+ OPTIONS: Allowed HTTP Methods: GET, HEAD, POST, OPTIONS .
^
┌──(kali㉿kali)-[~]
└─$ nikto -h <IP-add | host name>

# anoher try example, if known there is SSL, SSL site that is target

$ nikto -h <IP or hostname> -ssl

# example target SSL, scanning host "pbs.org" it will gave of the types of information that a Nikto scan will show up. After it connects to port 443, and there is some useful information about the cipher a list of other details like that server is a "openresty", and there is not whole a lot interesting data here show up. This command scanning may take few minutes or even forever, but at this command will added "-maxtime" and at scannning takes 30seconds

┌──(kali㉿kali)-[~]
└─$ nikto -h pbs.org -ssl -maxtime=30s
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Multiple IPs found: 54.225.206.152, 54.225.198.196
+ Target IP:          54.225.206.152
+ Target Hostname:    pbs.org
+ Target Port:        443
---------------------------------------------------------------------------
+ SSL Info:        Subject:  /CN=www.pbs.org
                   Ciphers:  ECDHE-ECDSA-AES128-GCM-SHA256
                   Issuer:   /C=US/O=Let's Encrypt/CN=R3
+ Start Time:         2024-01-20 11:35:24 (GMT2)
---------------------------------------------------------------------------
+ Server: openresty
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: Uncommon header 'x-pbs-fwsrvname' found, with contents: ip-10-193-189-42.ec2.internal.
+ /: The site uses TLS and the Strict-Transport-Security HTTP header is not defined. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ Root page / redirects to: https://www.pbs.org/
+ ERROR: Host maximum execution time of 30 seconds reached
+ Scan terminated: 0 error(s) and 4 item(s) reported on remote host                                                                                    
+ End Time:           2024-01-20 11:35:56 (GMT2) (32 seconds)                                                                                          
---------------------------------------------------------------------------                                                                            
+ 1 host(s) tested 









