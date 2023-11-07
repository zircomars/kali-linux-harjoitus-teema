# Verkkotunnuksissa, joissa HTTPS on käytössä, sinun on määritettävä -ssl-lippu portin 443 tarkistamiseksi:
# Esim. skannattaisi Domain nimeä (verkkotunnusta) jossa on HTTPS käytössä (portti 443) ja siihen on määritettävä -ssl (flag) johon se tarkistaa sen porttin 443 tarkistuksen

┌──(kali㉿kali)-[~]
└─$ nikto -h https://nmap.org -ssl
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Multiple IPs found: 45.33.49.119, 2600:3c01:e000:3e6::6d4e:7061
+ Target IP:          45.33.49.119
+ Target Hostname:    nmap.org
+ Target Port:        443
---------------------------------------------------------------------------
+ SSL Info:        Subject:  /CN=insecure.com
                   Ciphers:  ECDHE-RSA-AES128-GCM-SHA256
                   Issuer:   /C=US/O=Let's Encrypt/CN=R3
+ Start Time:         2023-11-07 14:10:14 (GMT2)
---------------------------------------------------------------------------
+ Server: Apache/2.4.6 (CentOS)
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
^C                                                                                                                       
┌──(kali㉿kali)-[~]
└─$ 






