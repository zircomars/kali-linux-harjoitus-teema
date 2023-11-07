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

