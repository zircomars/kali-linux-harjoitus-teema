# another example scanning a secure website and an IP-address on local network.
# this is just example an unsecured web domain using port 80.. let's try and check what it show up

# at result it show up the it's using server "AkamaiGhost"
$ nikto -h www.afl.com.au

┌──(kali㉿kali)-[~]
└─$ nikto -h www.afl.com.au
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Multiple IPs found: 193.229.113.155, 193.229.113.105, 2001:998:12:74::c1e5:7169, 2001:998:12:74::c1e5:719b
+ Target IP:          193.229.113.155
+ Target Hostname:    www.afl.com.au
+ Target Port:        80
+ Start Time:         2024-01-20 11:39:49 (GMT2)
---------------------------------------------------------------------------
+ Server: AkamaiGHost
+ /: Uncommon header 'x-instart-country-code' found, with contents: FI.
+ /: Uncommon header 'server-timing' found, with multiple values: (cdn-cache; desc=HIT,edge; dur=1,ak_p; desc="1705743589706_3253039511_129406179_6_1352_31_0_-";dur=1,).
+ /: Uncommon header 'akamai-grn' found, with contents: 0.9771e5c1.1705743589.7b694e3.
+ Root page / redirects to: https://www.afl.com.au/
+ No CGI Directories found (use '-C all' to force check all possible dirs)
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ 8158 requests: 0 error(s) and 4 item(s) reported on remote host
+ End Time:           2024-01-20 11:46:42 (GMT2) (413 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested


# this reality command example did not show any interesting, but at least show it server name (AkamaiGhost) and some uncommon header that help indicate how the website is configured. If there some something interesting on list and may will tell to penetration tester there are some vulnerabilities reported as like OSVDB (open source vulnerability database) or some CVE reference tools.

# scanning some result will popup small line "this might be interesting" it will tell penetration tester is might be target some of vulnerabilities. 

# another example for the VMware "Badstore" (practice software)

┌──(kali㉿kali)-[~]
└─$ nikto -h 183.567.49.132
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Target IP:          183.567.49.132
+ Target Hostname:    183.567.49.132
+ Target Port:        80
+ Start Time:         2024-01-20 11:51:44 (GMT2)
---------------------------------------------------------------------------
+ Server: Apache/1.3.28 (Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c
+ /: Server may leak inodes via ETags, header found with file /, inode: 331, size: 3583, mtime: Mon May 15 00:16:23 2006. See: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-1418
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ /supplier/: Directory indexing found.
+ /robots.txt: Entry '/supplier/' is returned a non-forbidden or redirect HTTP code (200). See: https://portswigger.net/kb/issues/00600600_robots-txt-file
+ /backup/: Directory indexing found.
+ /robots.txt: Entry '/backup/' is returned a non-forbidden or redirect HTTP code (200). See: https://portswigger.net/kb/issues/00600600_robots-txt-file
+ /robots.txt: contains 6 entries which should be manually viewed. See: https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt
+ mod_ssl/2.8.15 appears to be outdated (current is at least 2.9.6) (may depend on server version).
+ OpenSSL/0.9.7c appears to be outdated (current is at least 3.0.7). OpenSSL 1.1.1s is current for the 1.x branch and will be supported until Nov 11 2023.
+ Apache/1.3.28 appears to be outdated (current is at least Apache/2.4.54). Apache 2.2.34 is the EOL for the 2.x branch.
+ /: Apache is vulnerable to XSS via the Expect header. See: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3918
+ /index: Uncommon header 'tcn' found, with contents: list.
+ /index: Apache mod_negotiation is enabled with MultiViews, which allows attackers to easily brute force file names. The following alternatives for 'index' were found: index.html. See: http://www.wisec.it/sectou.php?id=4698ebdc59d15,https://exchange.xforce.ibmcloud.com/vulnerabilities/8275
+ OPTIONS: Allowed HTTP Methods: GET, HEAD, OPTIONS, TRACE .
+ /: HTTP TRACE method is active which suggests the host is vulnerable to XST. See: https://owasp.org/www-community/attacks/Cross_Site_Tracing
+ Apache/1.3.28 - Apache 1.3 below 1.3.29 are vulnerable to overflows in mod_rewrite and mod_cgi.
+ /backup/: This might be interesting.
+ /cgi-bin/test.cgi: This might be interesting.
+ /icons/: Directory indexing found.
+ /images/: Directory indexing found.
+ /#wp-config.php#: #wp-config.php# file found. This file contains the credentials.
+ 8913 requests: 0 error(s) and 22 item(s) reported on remote host
+ End Time:           2024-01-20 11:52:23 (GMT2) (39 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested















