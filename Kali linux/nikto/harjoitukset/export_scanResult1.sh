# How to Export Scan Results
# Nikto skannaus vie jokin aikaa, mutta jos on ammattimainen penetraaatio testaaja, niin käyttäjä ei halua toistaa skannausta kovin usein, ellei poikkeuksellisesti verkkosovelluksessa ole suurta muutosta.

# eli skannauksen tulokset tiedostoon esim. (teksti.txt) sisään, ja johon lisätään "-o" scripti perään

┌──(kali㉿kali)-[~]
└─$ nikto -h scanme.nmap.org -o scan.txt
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Multiple IPs found: 45.33.32.156, 2600:3c01::f03c:91ff:fe18:bb2f
---------------------------------------------------------------------------
+ 0 host(s) tested
 

# loppu peleissä se tulee Kali Linux tähän virtuaalikoneen ympäristön tiedosto kansioon, eli pitää metsästää 

┌──(kali㉿kali)-[~]
└─$ pwd
/home/kali

# se on ainakin tuolla alhaalla (scan.txt)
┌──(kali㉿kali)-[~]
└─$ ll
total 36
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Desktop
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Documents
drwxr-xr-x 2 kali kali 4096 Oct 31 11:13 Downloads
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Music
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Pictures
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Public
-rw-r--r-- 1 kali kali   16 Nov  7 14:17 scan.txt
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Templates
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Videos

# wtf ai noin vähän? ton skannaus meni ehkä minuutti?! kuitenkin jokinalinen tulos tuli..
┌──(kali㉿kali)-[~]
└─$ cat scan.txt 
- Nikto v2.5.0/


###########################################################

# toinen esim. mutta käytetään toisella verko sivustolla

┌──(kali㉿kali)-[~]
└─$ nikto -h http://testhtml5.vulnweb.com -o scanweb.txt
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Target IP:          44.228.249.3
+ Target Hostname:    testhtml5.vulnweb.com
+ Target Port:        80
+ Start Time:         2023-11-07 14:57:31 (GMT2)
---------------------------------------------------------------------------
+ Server: nginx/1.19.0
+ /: Retrieved access-control-allow-origin header: *.
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ ERROR: Error limit (20) reached for host, giving up. Last error: error reading HTTP response
+ Scan terminated: 19 error(s) and 3 item(s) reported on remote host
+ End Time:           2023-11-07 14:58:56 (GMT2) (85 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested
 
# se on siellä ja joko komennolla $ll tai $ls (eli lista)
┌──(kali㉿kali)-[~]
└─$ ll    
total 36
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Desktop
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Documents
drwxr-xr-x 2 kali kali 4096 Oct 31 11:13 Downloads
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Music
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Pictures
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Public
-rw-r--r-- 1 kali kali  547 Nov  7 14:58 scanweb.txt
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Templates
drwxr-xr-x 2 kali kali 4096 Oct 31 10:59 Videos
                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ cat scanweb.txt 
- Nikto v2.5.0/
+ Target Host: testhtml5.vulnweb.com
+ Target Port: 80
+ GET /: Retrieved access-control-allow-origin header: *.
+ GET /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options: 
+ GET /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/: 
                                                                                                                                                            


