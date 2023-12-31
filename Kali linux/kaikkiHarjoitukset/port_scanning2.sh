#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu START HERE: 118 - 121

# samat harjoitukset ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 


###############################################################################################
####### OS Fingerprinting #########
#
# Nmap on sisään rakennettu ominaisuus kuin OS fingerprint (-O parametri). Tämä toiminta yrittää arvata taustalla olevan käyttöjärjestelmän tarkastamalla kohteelta vastaanotettui paketteja. 
# käyttöjärjestelmissä on usein erilaisia TCP/IP stack tyyppejä toteutuksella, mm. oletuksen TTL-arvot (time to live) ja TCP windows koko. Näiden pienten ero luovat fingerprint ja nmap voi usein tunnistaa sen

# nmap skanneri tarkistaa kohteenkoneelta lähetetyn ja vastaanotetun kiikenteen ja yrittää sovittaa fingerprint:in tunnettua luetteloa. Esim.nmap skannauksessa suorittaa kohteen koneen, ja josta taustalla on windows 7 käyttöjärjestelmä ja vuodelta Windows 2008

nmap -O <IP-add | domain-name.com>

root@kali:~# nmap -O 10.0.0.19
...
Device type: general purpose
Running: Microsoft Windows 7|2008
OS CPE: cpe:/o:microsoft:windows_7
OS details: Microsoft Windows 7 SP0 - SP1, Windows Server 2008 SP1, or Windows 8
Network Distance: 1 hop
...
root@kali:~#

###### pien huom näitä pitää suorittaa root käyttiksellä, koska se on super käyttis
## omat skannaukset esim.
┌──(root㉿kali)-[/home/kali]
└─# nmap -O 172.51.81.93
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 13:06 EET
Nmap scan report for 172.51.81.93
Host is up (0.0013s latency).
Not shown: 997 closed tcp ports (reset)
PORT     STATE SERVICE
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql
MAC Address: f5:49:c3:b0:8a:a5 (VMware)
Device type: general purpose
Running: Linux 2.4.X
OS CPE: cpe:/o:linux:linux_kernel:2.4
OS details: Linux 2.4.18 - 2.4.35 (likely embedded)
Network Distance: 1 hop

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 2.33 seconds

################################
## badstore ip add (vmware)

┌──(root㉿kali)-[/home/kali]
└─# nmap -O 172.51.81.130
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 13:06 EET
Nmap scan report for 172.51.81.130
Host is up (0.00013s latency).
All 1000 scanned ports on 172.51.81..130 are in ignored states.
Not shown: 1000 closed tcp ports (reset)
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.92 seconds


################################
## kali linux ip add (vmware)

┌──(root㉿kali)-[/home/kali]
└─# nmap -O 172.51.81..130
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 13:06 EET
Nmap scan report for 172.51.81..130
Host is up (0.00013s latency).
All 1000 scanned ports on 172.51.81..130 are in ignored states.
Not shown: 1000 closed tcp ports (reset)
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.92 seconds


################################
## oma kiinteä kone (ip add)

┌──(root㉿kali)-[/home/kali]
└─# nmap -O 133.223.217.104  
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 13:06 EET
Nmap scan report for 133.223.217.104
Host is up (0.0033s latency).
Not shown: 993 filtered tcp ports (no-response)
PORT     STATE SERVICE
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
443/tcp  open  https
445/tcp  open  microsoft-ds
902/tcp  open  iss-realsecure
912/tcp  open  apex-mesh
5357/tcp open  wsdapi
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Microsoft Windows XP|7|2012
OS CPE: cpe:/o:microsoft:windows_xp::sp3 cpe:/o:microsoft:windows_7 cpe:/o:microsoft:windows_server_2012
OS details: Microsoft Windows XP SP3, Microsoft Windows XP SP3 or Windows 7 or Windows Server 2012

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.24 seconds

#################
###  Banner Grabbing/service enumeration  ####
# nmap voi myös suorittaa tunnistamaan palveluita tietyissä portteissa bannereiden sieppaamista ja useiden luetteloiden komento scriptiä ("-sV" ja "-A" parametriä)

## esim.
# -sV :: probe open ports to determine service / version info

root@kali:~# nmap -sV -sT 10.0.0.19
Starting Nmap 6.25 ( http://nmap.org ) at 2013-04-20 07:35 EDT
Nmap scan report for 10.0.0.19
Host is up (0.00043s latency).
Not shown: 987 closed ports
PORT STATE SERVICE VERSION
21/tcp open ftp ActiveFax ftpd 4.31 build 0225
23/tcp open telnet ActiveFax telnetd
25/tcp open smtp SLmail smtpd 5.5.0.4433
135/tcp open msrpc Microsoft Windows RPC
139/tcp open netbios-ssn
445/tcp open netbios-ssn
515/tcp open printer ActiveFax lpd
49152/tcp open msrpc Microsoft Windows RPC
49153/tcp open msrpc Microsoft Windows RPC
49154/tcp open msrpc Microsoft Windows RPC
49155/tcp open msrpc Microsoft Windows RPC
49156/tcp open msrpc Microsoft Windows RPC
49157/tcp open msrpc Microsoft Windows RPC
MAC Address: 00:0C:29:3B:C8:DE (VMware)
Service Info: Host: lab; OS: Windows; CPE: cpe:/o:microsoft:windows
Nmap done: 1 IP address (1 host up) scanned in 55.67 seconds

root@kali:~#

###### oma badstore
$nmap -sV -sT <IP-add | domain.name>
┌──(root㉿kali)-[/home/kali]
└─# nmap -sV -sT 172.51.81.129
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 13:22 EET
Nmap scan report for 192.168.240.129
Host is up (0.0064s latency).
Not shown: 997 closed tcp ports (conn-refused)
PORT     STATE SERVICE  VERSION
80/tcp   open  http     Apache httpd 1.3.28 ((Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c)
443/tcp  open  ssl/http Apache httpd 1.3.28 ((Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c)
3306/tcp open  mysql    MySQL 4.1.7-standard
MAC Address: f5:49:c3:b0:8a:a5 (VMware)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 13.22 seconds
                                                                           
#################
###  Nmap scripting engine (NSE)  ####
# Nmap scripting engine (NSE) 

# scripti sisältyvät laajan valikoman apuohjelmia DNS-luettelo scriptiä (enumeration scripts), brute forece attacks, ja jopa haavoittuvuutta tunnistuskomento scriptiä
# Kaikki NSE scriptit sijaitse hakemistossa/polussa kuin; /usr/share/nmap/scripts


# pikaisella omalla haulla ja löytyi lista (huom, tässä on enemmänkin)
┌──(kali㉿kali)-[/usr/share/nmap/scripts]
└─$ ls
acarsd-info.nse                       hostmap-crtsh.nse                       ip-geolocation-map-bing.nse    rsync-brute.nse
address-info.nse                      hostmap-robtex.nse                      ip-geolocation-map-google.nse  rsync-list-modules.nse
afp-brute.nse                         http-adobe-coldfusion-apsa1301.nse      ip-geolocation-map-kml.nse     rtsp-methods.nse
afp-ls.nse                            http-affiliate-id.nse                   ip-geolocation-maxmind.nse     rtsp-url-brute.nse
afp-path-vuln.nse                     http-apache-negotiation.nse             ip-https-discover.nse          rusers.nse

# Yksi komento scripti kuin "smb-os-discovery" joka yrittää muodostaa yhteyden kohdejärjestelmän (target system) SMB-palveluun ja määrittää sen käyttöjärjestelmän version
# esim. komento scripti

root@kali:~# nmap 10.0.0.19 --script smb-os-discovery.nse
...
Host script results:
| smb-os-discovery:
| OS: Windows 7 Ultimate 7600 (Windows 7 Ultimate 6.1)
| OS CPE: cpe:/o:microsoft:windows_7::-
| Computer name: lab
| NetBIOS computer name: LAB
| Workgroup: WORKGROUP
|_ System time: 2013-04-20T04:41:43-07:00
Nmap done: 1 IP address (1 host up) scanned in 5.85 seconds
root@kali:~#

#### oma badstore

┌──(kali㉿kali)-[~]
└─$ nmap 172.51.81.129 --script smb-os-discovery.nse
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 15:29 EET
Nmap scan report for 172.51.81.129 
Host is up (0.0050s latency).
Not shown: 997 closed tcp ports (conn-refused)
PORT     STATE SERVICE
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql

Nmap done: 1 IP address (1 host up) scanned in 0.55 seconds


                                                                          
#### oma kiinteä kone (ip-osoite)

┌──(kali㉿kali)-[~]
└─$ nmap 133.223.217.104 --script smb-os-discovery.nse
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 15:33 EET
Nmap scan report for 133.223.217.104
Host is up (0.0074s latency).
Not shown: 993 filtered tcp ports (no-response)
PORT     STATE SERVICE
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
443/tcp  open  https
445/tcp  open  microsoft-ds
902/tcp  open  iss-realsecure
912/tcp  open  apex-mesh
5357/tcp open  wsdapi

Nmap done: 1 IP address (1 host up) scanned in 14.09 seconds

### toinen esim. josta voi hyödyllistää komento scriptin DNS zone transfer, NSE scriptin, joka voidaan kutsua seuraaville komennolla (megacorpone.com)
root@kali:~# nmap --script=dns-zone-transfer -p 53 ns2.megacorpone.com

┌──(kali㉿kali)-[~]
└─$ nmap --script=dns-zone-transfer -p 53 ns2.megacorpone.com
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 15:36 EET
Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
Nmap done: 1 IP address (0 hosts up) scanned in 3.53 seconds
                                                                           













