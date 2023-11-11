#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu START HERE: 122

# samat harjoitukset ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 

########################################################################################
##### The server message block (SMB) protokollan turvallisuudessa muinoin historiassa on ollut heikko prosessi n. yli kymmenen vuoden ajalta ja sen monimutkaisen toteutuksen ja avoimien luonteen vuooksi (open nature)

# todentamisessa (unauthenticated) SMB-nolla istunnoissa Windows 2000 ja XP:ssä lukuisiin SMB-virheitä (buggia) ja haavoittuvuuksia vuosien varrella, ja SMB on nähnyt useita kohtuulisia osuutensa toimintoja

# SMB protokolla on kuitenkin myös päivitetty versio ja parantanut samanaikaisesti Windows- käyttöjärjestelmien julkaisujen kanssa ja muutamista luettelosta SMB-versioidenn ja Windows käyttöjärjestelminen versioiden selventämistä

# o SMB1 – Windows 2000, XP and Windows 2003.
# o SMB2 – Windows Vista SP1 and Windows 2008
# o SMB2.1 – Windows 7 and Windows 2008 R2
# o SMB3 – Windows 8 and Windows 2012

############################
#### Scanning for the NetBIOS Service ######

# SMB NetBIOS palvelu kuuntelee TCP portteja 139 ja 445, sekä useita UDP portteja. Ne voidaan skannata työkaluilla just kuten nmap
# port 139 - netbios-ss
# port 445 - microsoft-ds

root@kali:~# nmap -v -p 139,445 -oG smb.txt 10.11.1.1-254

# eli tässä komennossa skannaa portit 139 ja 445, sekä tulostuksesta tulostuu tiedostoon (smb.txt)lle ja skannattavia IP-osoite rajoja
└─$ nmap -v -p 139,445 -oG smb.txt 140.238.50.120-135       
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 16:12 EET
Initiating Ping Scan at 16:12
Scanning 16 hosts [2 ports/host]
Completed Ping Scan at 16:12, 1.51s elapsed (16 total hosts)
Initiating Parallel DNS resolution of 2 hosts. at 16:12
Completed Parallel DNS resolution of 2 hosts. at 16:12, 0.03s elapsed
Nmap scan report for 140.238.50.120 [host down]
Nmap scan report for 140.238.50.121 [host down]
Nmap scan report for 140.238.50.122 [host down]
Nmap scan report for 140.238.50.123 [host down]
Nmap scan report for 140.238.50.124 [host down]
Nmap scan report for 140.238.50.125 [host down]
Nmap scan report for 140.238.50.126 [host down]
Nmap scan report for 140.238.50.127 [host down]
Nmap scan report for 140.238.50.128 [host down]
Nmap scan report for 140.238.50.131 [host down]
Nmap scan report for 140.238.50.132 [host down]
Nmap scan report for 140.238.50.133 [host down]
Nmap scan report for 140.238.50.134 [host down]
Nmap scan report for 140.238.50.135 [host down]
Initiating Connect Scan at 16:12
Scanning 2 hosts [2 ports/host]
Completed Connect Scan at 16:12, 0.00s elapsed (4 total ports)
Nmap scan report for 140.238.50.129
Host is up (0.00066s latency).

PORT    STATE  SERVICE
139/tcp closed netbios-ssn
445/tcp closed microsoft-ds

Nmap scan report for 140.238.50.130
Host is up (0.00033s latency).

PORT    STATE  SERVICE
139/tcp closed netbios-ssn
445/tcp closed microsoft-ds

Read data files from: /usr/bin/../share/nmap
Nmap done: 16 IP addresses (2 hosts up) scanned in 1.60 seconds
  
┌──(kali㉿kali)-[~]
└─$ cat smb.txt           
# Nmap 7.93 scan initiated Sat Nov 11 16:12:05 2023 as: nmap -v -p 139,445 -oG smb.txt 140.238.50.120-135
# Ports scanned: TCP(2;139,445) UDP(0;) SCTP(0;) PROTOCOLS(0;)
Host: 140.238.50.120 ()        Status: Down
Host: 140.238.50.121 ()        Status: Down
Host: 140.238.50.122 ()        Status: Down
Host: 140.238.50.123 ()        Status: Down
Host: 140.238.50.124 ()        Status: Down
Host: 140.238.50.125 ()        Status: Down
Host: 140.238.50.126 ()        Status: Down
Host: 140.238.50.127 ()        Status: Down
Host: 140.238.50.128 ()        Status: Down
Host: 140.238.50.131 ()        Status: Down
Host: 140.238.50.132 ()        Status: Down
Host: 140.238.50.133 ()        Status: Down
Host: 140.238.50.134 ()        Status: Down
Host: 140.238.50.135 ()        Status: Down
Host: 140.238.50.129 ()        Status: Up
Host: 140.238.50.129 ()        Ports: 139/closed/tcp//netbios-ssn///, 445/closed/tcp//microsoft-ds///
Host: 140.238.50.130 ()        Status: Up
Host: 140.238.50.130 ()        Ports: 139/closed/tcp//netbios-ssn///, 445/closed/tcp//microsoft-ds///
# Nmap done at Sat Nov 11 16:12:06 2023 -- 16 IP addresses (2 hosts up) scanned in 1.60 seconds

## toinen esim.
# jossa NetBIOS:tietojen tunnistamista on muita erikoistuneita työkaluja kuten "nbtscan" komentos sciprit

root@kali:~# nbtscan -r 10.11.1.0/24
Doing NBT name scan for addresses from 10.11.1.0/24
IP address NetBIOS Name Server User MAC address
------------------------------------------------------------------------------
10.11.1.255 Sendto failed: Permission denied
10.11.1.201 ALICE <server> ALICE 00:50:56:af:41:cf
10.11.1.205 IS~ORACLE <server> ORACLE 00:50:56:af:1f:f6
10.11.1.206 IS~ORACLE2 <unknown> 00:50:56:af:7a:2e
10.11.1.221 SLAVE <server> <unknown> 00:50:56:af:1d:ac
...
10.11.1.229 THINCMAIL <server> <unknown> 00:50:56:af:20:21
10.11.1.231 RALPH <unknown> 00:50:56:af:36:69
10.11.1.224 UBUNTU05 <server> UBUNTU05 00:00:00:00:00:00
10.11.1.236 SUFFERENCE <server> SUFFERENCE 00:00:00:00:00:00
10.11.1.245 HELPDESK <server> <unknown> 00:50:56:af:6b:b3
root@kali:~# 

## oma harj.
┌──(kali㉿kali)-[~]
└─$ nbtscan -r 140.238.50.0/24         
Doing NBT name scan for addresses from 140.238.50.0/24

IP address       NetBIOS Name     Server    User             MAC address      
------------------------------------------------------------------------------
140.238.50.1    LAPTOP-M61U9PNQ  <server>  <unknown>        b4:be:89:ef:85:02
140.238.50.130  <unknown>                  <unknown>        
140.238.50.255 Sendto failed: Permission denied

############################
## Null Session Enumeration ####

# Null session (istunto) viittaa todentamattomia (unauthenticated) NetBIOS-istuntoa kahden tietokoneen välillä. Tämän ominaisuus on olemassa, joten todenttamatomat koneet voivat saada selausluetteloita muilta Microsoft palvelimilta

# Nolla istunto antaa myös todentamattomille hakkereillle mahdollisuuden saada suuria määriä tietoja koneesta, kuten salasanankäytäntöjä (password policies), käyttäjtunnus , ryhmien nimiä, koneiden nimiä, käyttäjien ja host tunnusten tunnisteita (hosts SIDSs)
# tämä Microsoft ominaisuus oli oletuksena SMB1 versiossa, ja sitä rajoitettiin myöhemmin SMB:N myöhemmissä versioissa

> enum4linux -a 192.168.11.227

# jos käyttää tai tarkistaa millaisia tietoja voidaan poimia Windows tietokoneesta SMB-nollaistunnolla niin yksi hyödyllinen työkalu kali Linux:sessa on "enum4linux", joka on työkalultaan Windows- ja samba järjestelmien tietojen luetteloimista
# se on kirjoitettu PerL:issä ja pohjimmiltaan kääre Samba-työkalujen scriptiä mm. "smbclient", "rpcclient", "net", ja "nmblookup".

# seuraavaksi esim. osassa tulostuksen tietoja ja voidaan poimia jotakin SMB-protokollan tietyihin edellytyksiinsä
root@kali:~# enum4linux -a 10.11.1.227
========================================
| OS information on 10.11.1.227 |
========================================
[+] Got OS info for 10.11.1.227 from smbclient: Domain=[WORKGROUP] OS=[Windows 5.0]
Server=[Windows 2000 LAN Manager]
...
user:[admin] rid:[0x3ef]
user:[Administrator] rid:[0x1f4]
user:[alice] rid:[0x3f0]
user:[backup] rid:[0x3ee]
user:[david] rid:[0x3f1]
user:[Guest] rid:[0x1f5]
user:[IUSR_SRV2] rid:[0x3ea]
user:[IWAM_SRV2] rid:[0x3eb]
user:[john] rid:[0x3f2]
user:[lisa] rid:[0x3f3]
user:[mark] rid:[0x3f4]
user:[sqlusr] rid:[0x3ed]
user:[TsInternetUser] rid:[0x3e8]
...

[+] Password Info for Domain: SRV2
[+] Minimum password length: None
[+] Password history length: None
[+] Maximum password age: 42 days 22 hours 47 minutes
[+] Password Complexity Flags: 000000
[+] Domain Refuse Password Change: 0
[+] Domain Password Store Cleartext: 0
[+] Domain Password Lockout Admins: 0
[+] Domain Password No Clear Change: 0
[+] Domain Password No Anon Change: 0
[+] Domain Password Complex: 0
[+] Minimum password age: None
[+] Reset Account Lockout Counter: 30 minutes
[+] Locked Account Duration: 30 minutes
[+] Account Lockout Threshold: None
[+] Forced Log off Time: Not Set
[+] Retieved partial password policy with rpcclient:
Password Complexity: Disabled
Minimum Password Length: 0

## oma harj. mutta en tiedä mitä tämä tarkoittaa.. mutta jokinlainen ero verrattuna kirjaan.
┌──(kali㉿kali)-[~]
└─$ enum4linux -a 140.238.50.129
Starting enum4linux v0.9.1 ( http://labs.portcullis.co.uk/application/enum4linux/ ) on Sat Nov 11 17:47:15 2023

 =========================================( Target Information )=========================================                                                             
                                                                                   
Target ........... 140.238.50.129                                                 
RID Range ........ 500-550,1000-1050
Username ......... ''
Password ......... ''
Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none


 ==========================( Enumerating Workgroup/Domain on 140.238.50.129 )==========================                                                              
                                                                                   
                                                                                   
[E] Can't find workgroup/domain                                                    
                                                                                   
                                                                                   

 ==============================( Nbtstat Information for 140.238.50.129 )==============================                                                              
                                                                                   
Looking up status of 140.238.50.129                                               
No reply from 140.238.50.129

 ==================================( Session Check on 140.238.50.129 )==================================                                                             
                                                                                   
                                                                                   
[E] Server doesn't allow session using username '', password ''.  Aborting remainder of tests.                                                                        

##########################################
## Nmap SMB NSE Scripts ####

# Nmap sisältää monia hyödyllisiä NSE-komento tiedostoja, joihin voidaan käyttää SMB-palvelua löytämiseen ja luetteloimiseen
# tätä scripti luetteloa/hakemistoa löytyy polusta kuin; /usr/share/nmap/scripts
> ls -l /usr/share/nmap/scripts/smb-

┌──(kali㉿kali)-[~]
└─$  ls -l /usr/share/nmap/scripts/smb*
-rw-r--r-- 1 root root  3753 Jan 10  2023 /usr/share/nmap/scripts/smb2-capabilities.nse
-rw-r--r-- 1 root root  2689 Jan 10  2023 /usr/share/nmap/scripts/smb2-security-mode.nse
-rw-r--r-- 1 root root  1408 Jan 10  2023 /usr/share/nmap/scripts/smb2-time.nse
-rw-r--r-- 1 root root  5269 Jan 10  2023 /usr/share/nmap/scripts/smb2-vuln-uptime.nse
-rw-r--r-- 1 root root 45061 Jan 10  2023 /usr/share/nmap/scripts/smb-brute.nse
-rw-r--r-- 1 root root  5289 Jan 10  2023 /usr/share/nmap/scripts/smb-double-pulsar-backdoor.nse
-rw-r--r-- 1 root root  4840 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-domains.nse
-rw-r--r-- 1 root root  5971 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-groups.nse
-rw-r--r-- 1 root root  8043 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-processes.nse
-rw-r--r-- 1 root root 27274 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-services.nse
-rw-r--r-- 1 root root 12017 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-sessions.nse
-rw-r--r-- 1 root root  6923 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-shares.nse
-rw-r--r-- 1 root root 12527 Jan 10  2023 /usr/share/nmap/scripts/smb-enum-users.nse
-rw-r--r-- 1 root root  1706 Jan 10  2023 /usr/share/nmap/scripts/smb-flood.nse
-rw-r--r-- 1 root root  7471 Jan 10  2023 /usr/share/nmap/scripts/smb-ls.nse
-rw-r--r-- 1 root root  8758 Jan 10  2023 /usr/share/nmap/scripts/smb-mbenum.nse
-rw-r--r-- 1 root root  8220 Jan 10  2023 /usr/share/nmap/scripts/smb-os-discovery.nse
-rw-r--r-- 1 root root  4982 Jan 10  2023 /usr/share/nmap/scripts/smb-print-text.nse
-rw-r--r-- 1 root root  1833 Jan 10  2023 /usr/share/nmap/scripts/smb-protocols.nse
-rw-r--r-- 1 root root 63596 Jan 10  2023 /usr/share/nmap/scripts/smb-psexec.nse
-rw-r--r-- 1 root root  5190 Jan 10  2023 /usr/share/nmap/scripts/smb-security-mode.nse
-rw-r--r-- 1 root root  2424 Jan 10  2023 /usr/share/nmap/scripts/smb-server-stats.nse
-rw-r--r-- 1 root root 14159 Jan 10  2023 /usr/share/nmap/scripts/smb-system-info.nse
-rw-r--r-- 1 root root  7524 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-conficker.nse
-rw-r--r-- 1 root root  6402 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-cve2009-3103.nse
-rw-r--r-- 1 root root 23154 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-cve-2017-7494.nse
-rw-r--r-- 1 root root  6545 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-ms06-025.nse
-rw-r--r-- 1 root root  5386 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-ms07-029.nse
-rw-r--r-- 1 root root  5688 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-ms08-067.nse
-rw-r--r-- 1 root root  5647 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-ms10-054.nse
-rw-r--r-- 1 root root  7214 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-ms10-061.nse
-rw-r--r-- 1 root root  7344 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-ms17-010.nse
-rw-r--r-- 1 root root  4400 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-regsvc-dos.nse
-rw-r--r-- 1 root root  6586 Jan 10  2023 /usr/share/nmap/scripts/smb-vuln-webexec.nse
-rw-r--r-- 1 root root  5084 Jan 10  2023 /usr/share/nmap/scripts/smb-webexec-exploit.nse
                                                                                             
┌──(kali㉿kali)-[~]

##############
# sitten voidaan nähdä, että onko olemassa useita muita mielenkiintoisia Nmap SMB NSE-komento scriptissä, kuten käyttöjärjestelmien etsinässä ja erilisten tietojen luettelointia protokollassa 

# We can see that several interesting Nmap SMB NSE scripts exist,, such as OS discovery
# and enumeration of various pieces of information from the protocol
> nmap -v -p 139, 445 --script=smb-os-discovery 192.168.11.227

root@kali:~# nmap -v -p 139, 445 --script=smb-os-discovery 10.11.1.227
...
Nmap scan report for 10.11.1.227
Host is up (0.57s latency).
PORT STATE SERVICE
139/tcp open netbios-ssn
Host script results:
| smb-os-discovery:
| OS: Windows 2000 (Windows 2000 LAN Manager)
| OS CPE: cpe:/o:microsoft:windows_2000::-
| Computer name: srv2
| NetBIOS computer name: SRV2
| Workgroup: WORKGROUP
...
root@kali:~# 

## oma badstore skannaus
┌──(kali㉿kali)-[~]
└─$  nmap -v -p 139, 445 --script=smb-os-discovery 140.238.50.129
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 17:57 EET
NSE: Loaded 1 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 17:57
Completed NSE at 17:57, 0.00s elapsed
Initiating Ping Scan at 17:57
Scanning 2 hosts [2 ports/host]
Completed Ping Scan at 17:57, 1.21s elapsed (2 total hosts)
Initiating Parallel DNS resolution of 1 host. at 17:57
Completed Parallel DNS resolution of 1 host. at 17:57, 0.03s elapsed
Nmap scan report for 445 (0.0.1.189) [host down]
Initiating Connect Scan at 17:57
Scanning 140.238.50.129 [1 port]
Completed Connect Scan at 17:57, 0.00s elapsed (1 total ports)
NSE: Script scanning 140.238.50.129.
Initiating NSE at 17:57
Completed NSE at 17:57, 0.00s elapsed
Nmap scan report for 140.238.50.129
Host is up (0.0016s latency).

PORT    STATE  SERVICE
139/tcp closed netbios-ssn

NSE: Script Post-scanning.
Initiating NSE at 17:57
Completed NSE at 17:57, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Nmap done: 2 IP addresses (1 host up) scanned in 1.61 seconds
                                                                                             
┌──(kali㉿kali)-[~]


#######
# seuraavaksi voidaan tarkistaa tunnetut SMB-protokollan haavoittuvuudet käynnistämällä jokin "nmap smb-vuln" scriptin
# To check for known SMB protocol vulnerabilities,
# you can invoke the nmap smb-check-vulns script

> nmap -v -p 139,445 --script=smb-check-vulns --script-args=unsafe=1 192.168.11.201

root@kali:~# nmap -v -p 139,445 --script=smb-vuln-ms08-067 --script-args=unsafe=1 10.11.1.201
Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-20 00:04 EDT
NSE: Loaded 1 scripts for scanning.
NSE: Script Pre-scanning.
...
Scanning 10.11.1.201 [2 ports]
...
Completed NSE at 00:04, 17.39s elapsed
Nmap scan report for 10.11.1.201
Host is up (0.17s latency).
PORT STATE SERVICE
139/tcp open netbios-ssn
445/tcp open microsoft-ds
MAC Address: 00:50:56:AF:02:91 (VMware)
Host script results:
| smb-vuln-ms08-067:
| VULNERABLE:
| Microsoft Windows system vulnerable to remote code execution (MS08-067)
| State: VULNERABLE
| IDs: CVE:CVE-2008-4250
| The Server service in Microsoft Windows 2000 SP4, XP SP2 and SP3, Server 2003 SP1
and SP2,
| Vista Gold and SP1, Server 2008, and 7 Pre-Beta allows remote attackers to execute
arbitrary
| code via a crafted RPC request that triggers the overflow during path
canonicalization.
|
| Disclosure date: 2008-10-23
| References:
| https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-4250
|_ https://technet.microsoft.com/en-us/library/security/ms08-067.aspx
...
root@kali:~# 


## oma badstore skannaus
┌──(kali㉿kali)-[~]
└─$ nmap -v -p 139,445 --script=smb-vuln-ms08-067 --script-args=unsafe=1 140.238.50.129
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-11 18:05 EET
NSE: Loaded 1 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 18:05
Completed NSE at 18:05, 0.00s elapsed
Initiating Ping Scan at 18:05
Scanning 140.238.50.129 [2 ports]
Completed Ping Scan at 18:05, 0.00s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 18:05
Completed Parallel DNS resolution of 1 host. at 18:05, 0.07s elapsed
Initiating Connect Scan at 18:05
Scanning 140.238.50.129 [2 ports]
Completed Connect Scan at 18:05, 0.00s elapsed (2 total ports)
NSE: Script scanning 140.238.50.129.
Initiating NSE at 18:05
Completed NSE at 18:05, 0.00s elapsed
Nmap scan report for 140.238.50.129
Host is up (0.0010s latency).

PORT    STATE  SERVICE
139/tcp closed netbios-ssn
445/tcp closed microsoft-ds

NSE: Script Post-scanning.
Initiating NSE at 18:05
Completed NSE at 18:05, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 0.46 seconds











