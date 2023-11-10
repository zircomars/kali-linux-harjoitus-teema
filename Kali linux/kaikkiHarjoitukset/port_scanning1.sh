#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu start here: 109 - 117

# samat harjoitukset ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 

##############################################################################
# PORT SCANNING (start here)
# Porttien skannaus on prosessi, jossa tarkistetaan etäkoneen avoimet TCP- tai UDP-portit. Huomaa, että porttien skannaus on laitonta monissa maissa, eikä sitä tule suorittaa laboratorioiden ulkopuolella. Olemme kuitenkin siirtyneet passiivisesta vaiheesta aktiiviseen vaiheeseen, joka sisältää suorempaa vuorovaikutusta kohdepalvelimien kanssa.

# On erittäin tärkeää, että ymmärrämme porttitarkistuksen vaikutukset sekä vaikutukset, joita tietyillä porttitarkistuksilla voi olla verkkoon.


##########################################################################
# connect scanning

# Yksinkertaisin TCP-portin skannaustekniikka, jota yleensä kutsutaan CONNECT-skannaukseksi, perustuu kolmisuuntaiseen TCP-kättelymekanismiin28 (handshake28). 
# Tämä mekanismi on suunniteltu siten, että kaksi viestiä yrittävää host konetta voivat neuvotella verkon TCP-socket-yhteyden parametreista ennen tiedon lähettämistä.

# Yhdistä portin skannaus käsittää kolmisuuntaisen kättelyn (handsake) yrittämisen kohde host:issa kanssa määritetyissä porteissa. 
# Jos kättely on valmis, tämä osoittaa, että portti on auki. Alla olevassa kuvakaappauksessa näkyy Wireshark-kaappaus TCP Netcat -portin skannauksesta porteissa 3388-3390.

# esimerkki portti skannaus;
# -n :: numeric only ip adressess no DNS
# -v :: verboose use twice to be more verboose
# -w :: (secs) timeout for connects and final net reads
# -z :: zero I/O mode (used for scanning)

root@kali:~# nc -nvv -w 1 -z 10.0.0.19 3388-3390
(UNKNOWN) [10.0.0.19] 3390 (?) : Connection refused
(UNKNOWN) [10.0.0.19] 3389 (?) open
(UNKNOWN) [10.0.0.19] 3388 (?) : Connection refused
sent 0, rcvd 0

########################
#####  Stealth / SYN Scanning 

# SYN skannaus tai stealth skannaus on TCP-portien tarkistus menetelmä, joka sisältää SYN-pakettien lähetätmisen kohdekoneen eri portteihin suorittamista TCP-kättelyyn (handshake).
# Jos TCP-portti on auki, kohteen kone tulee lähettää takaisin SYN-ACK (vähä kuin vastaanottanut viestin ja lähettää takaisin viesttinsä), joka ilmoittaa portin olevan auki ilman, että lopullista kuittausta takaisin kohdekoneelle tarvittaessa lähettää

# Varhaisten ja primitiivisten palomuurien kanssa täsä menetelmässä toimisi usein ohitaa palomuurilokit (firewall logging), koska tämä kirjaus rajoittuisi valmiisiin TCP-istuntoihin. 
# Tämä ei enään pidä paikkaansa nykyisessä palomuurien kanssa, ja termi "stealth" on harhausjohtava (misleading). Käyttäjät saattavat uskoa, että sen skannauksista ei joten havaita, vaikka ne itse asiassa havaitsee


## UDP Scanning

# Koska UDP on valtioton, eikä siihen liity kolmisuuntaista kättelyä, UDP-portin skannauksen takana oleva mekanismi on erilainen. 
# Kokeile Wiresharkia, kun UDP skannaa laboratoriolaitetta netcatilla, jotta ymmärrät, kuinka UDP-porttitarkistukset toimivat.

# -u :: UDP mode
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 10.0.0.19 160-162
(UNKNOWN) [10.0.0.19] 162 (snmp-trap) open
(UNKNOWN) [10.0.0.19] 161 (snmp) open
(UNKNOWN) [10.0.0.19] 160 (?) open

##### Common Port Scanning Pitfalls

# UDP-porttien tarkistuksessa on usein epäluotettavaa (unreliable), koska palomuurit ja reitittimet voivat pudottaa ICMP-pakettia. 
# Tämä voi johtaa vääriin positiivisiin tarkistuksiinsa, ja näkee säännöllisesti UDP-porttitakirstuksia, joissa kaikki UDP-portit ovat avoinna skannatussa koneessa

# Useimmat porttinskannerit eivät tarkista kaikkia saatavilla olevia portteja, ja niillä on yleensä esiasetettu luettelo "kiinnostava portti tulos", jotka tarkistettaan 
# Ihmiset tai käyttäjät saattavat unohtaa usein etsiä UDP-palveluita (UDP-services) ja pysyvät vain TCP-skannauksessa, jolloin he näkevät vain puolet yhtälöstä. 



##### Port Scanning with Nmap 
# nmap TCP-skannaus skannaa tietyn koneen 1000 suosituinta porttia.
# yksi suosituimmista, monipuolisimmista ja kestävistä porttiskannereista tähän mennessä. Sitä on kehitetty aktiivisesti yli vuosikymmenen ajan, ja siinä on useita ominaisuuksia portin skannausta.

## Accountability for Your Traffic
# ennen kuin alaa suorittaa mitään NMAP-tarkistusta sokeasti, kantsii tarkistaa tällaisia tarkistuksen lähettämän liikenteen määärää.
# tässä esim/realistisessa tarkistuksessa on yksi paikallisisten koneista ja tarkkastellaan tiettyyn host iptables:in avulal lähetettyn liikenteen määrää

#########
# esim. skannaus
# We’ll scan one of my local machines while monitoring the amount
# of traffic sent to the specific host using iptables.
> iptables -I INPUT 1 -s 10.0.0.19 -j ACCEPT
> iptables -I OUTPUT 1 -d 10.0.0.19 -j ACCEPT
> iptables -Z
# -I :: insert in chain as rulenum ( default 1=first)
# -s :: source (address)
# -j :: jump target for the rulw
# -Z :: ??

> nmpap -sT 10.0.0.9
> iptables -vn -L
> iptables -Z
# -sT :: TCP Connect Scan
# -v :: Display more information in the output
# -L :: List the current filter rules.

> nmap -sT -p 1-65635 10.0.0.19
> iptables -vn -L
# -p :: port range

## esim. ensimmäinen skananus (kirja)
root@kali:~# iptables -I INPUT 1 -s 10.0.0.19 -j ACCEPT
root@kali:~# iptables -I OUTPUT 1 -d 10.0.0.19 -j ACCEPT
root@kali:~# iptables -Z

root@kali:~# nmap -sT 10.0.0.19
Starting Nmap 6.25 ( http://nmap.org ) at 2013-04-20 06:36 EDT
Nmap scan report for 10.0.0.19
Host is up (0.00048s latency).
Not shown: 986 closed ports
PORT STATE SERVICE
21/tcp open ftp
23/tcp open telnet
25/tcp open smtp
135/tcp open msrpc
139/tcp open netbios-ssn
445/tcp open microsoft-ds
515/tcp open printer
3389/tcp open ms-wbt-server
49152/tcp open unknown
49153/tcp open unknown
49154/tcp open unknown
49155/tcp open unknown
49156/tcp open unknown
49157/tcp open unknown
MAC Address: 00:0C:29:3B:C8:DE (VMware)

Nmap done: 1 IP address (1 host up) scanned in 1.91 seconds
root@kali:~# iptables -vn -L
Chain INPUT (policy ACCEPT 10 packets, 464 bytes)
  pkts bytes target prot opt in out source destination
  1002 40400 ACCEPT all -- * * 10.0.0.19 0.0.0.0/0
   0 0 ACCEPT all -- * * 10.0.0.19 0.0.0.0/0
 
Chain OUTPUT (policy ACCEPT 4 packets, 1052 bytes)
pkts bytes target prot opt in out source destination
1201 71796 ACCEPT all -- * * 0.0.0.0/0 10.0.0.19
root@kali:~# 

# esim. on oletusarvoinen 1000 portin tarkistus on tuottanut n. 72 kt liikennettä (71796 ACCEPT all) kohdalla.

#######
# esim. toinen skannaus (kirja)
root@kali:~# iptables -Z
root@kali:~# nmap -sT -p 1-65535 10.0.0.19
Starting Nmap 6.25 ( http://nmap.org ) at 2013-04-20 06:19 EDT
Nmap scan report for 10.0.0.19
Host is up (0.00067s latency).
Not shown: 65519 closed ports
PORT STATE SERVICE
21/tcp open ftp
23/tcp open telnet
25/tcp open smtp
135/tcp open msrpc
139/tcp open netbios-ssn
180/tcp open ris
445/tcp open microsoft-ds
515/tcp open printer
3389/tcp open ms-wbt-server
25017/tcp open unknown
49152/tcp open unknown
49153/tcp open unknown
49154/tcp open unknown
49155/tcp open unknown
49156/tcp open unknown
49157/tcp open unknown
MAC Address: 00:0C:29:3B:C8:DE (VMware)

Nmap done: 1 IP address (1 host up) scanned in 80.42 seconds
root@kali:~# iptables -vn -L
Chain INPUT (policy ACCEPT 54 packets, 2412 bytes)
    pkts bytes target prot opt in out source destination
    65540 2622K ACCEPT all -- * * 10.0.0.19 0.0.0.0/0
     0 0 ACCEPT all -- * * 10.0.0.19 0.0.0.0/0
Chain OUTPUT (policy ACCEPT 12 packets, 3120 bytes)
    pkts bytes target prot opt in out source destination
    76206 4572K ACCEPT all -- * * 0.0.0.0/0 10.0.0.19

root@kali:~# 

# samanlainen paikallisen porttiskannaus, joka tutkii nimenomaisesti kaikki 65 535 porttia (kaikki TCP/UDP portit), joka tuottaa 4,5 Mt liikennettä (4572K ACCEPT all), mikä on suurempi määrä.

# tämä seuraavassa esim. porttitarkistuksessa on kuitenkin löytänyt kaksi uutta porttia, joita on TCP-oletustarkistus ei löytynyt  kuin portti 180 ja portti 25 017

## tässä parissa esimerkissä pitäisi antaa tulostuksena käsitys tarpeesta tasapainoituksesta liikennerajoituksesta (kuten slow uplink), ja tarveta löytää lisää arvoimia portteja ja palveliuta käyttämällä kattavia skannauksia
## Verkon luokka C-class (254 host) täydellisen nmap-skannausta johtaisi yli 1000 Mt liikenteen lähettämistä verkkoon 

#####
##### oma skannaus (badastore) vmware

┌──(kali㉿kali)-[~]
└─$  nc -nvv -w 1 -z 138.46.185.29 3000-3390
(UNKNOWN) [138.46.185.29] 3390 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3389 (ms-wbt-server) : Connection refused
(UNKNOWN) [138.46.185.29] 3388 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3387 (?) : Connection refused
.
..
...
(UNKNOWN) [138.46.185.29] 3308 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3307 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3306 (mysql) open
(UNKNOWN) [138.46.185.29] 3305 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3304 (?) : Connection refused
.
..
...
(UNKNOWN) [138.46.185.29] 3262 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3261 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3260 (iscsi-target) : Connection refused
(UNKNOWN) [138.46.185.29] 3259 (?) : Connection refused
(UNKNOWN) [138.46.185.29] 3258 (?) : Connection refused

# tässä badstoressa saattaa olla muita portteja, mutta rajoitin itse ton komenon scriptin mukaan, mitä oikein tulostaa ja löytääkään mm. 3000 - 3390  väliltä

# seuraavasti tässä ei tulostunut mitään, mahtako olla jokin muu udp porttit käytössä
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 138.46.185.29 160-162 
                                                                              
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 138.46.185.29 100-150
                                                                              
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 138.46.185.29 100-150
^[[A^[[A^[[A^C
                                                                              
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 138.46.185.29 3390-3392


┌──(kali㉿kali)-[~]
└─$ sudo su                      
[sudo] password for kali: 
┌──(root㉿kali)-[/home/kali]
└─# iptables -I INPUT 1 -s 138.46.185.29 -j ACCEPT
                                                                              
┌──(root㉿kali)-[/home/kali]
└─# iptables -I INPUT 1 -d 138.46.185.29 -j ACCEPT
                                                                              
┌──(root㉿kali)-[/home/kali]
└─# iptables -Z                                     


#### nmap iptables scanning START HERE

┌──(root㉿kali)-[/home/kali]
└─# nmap -sT 138.46.185.29                  
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-09 20:05 EET
Nmap scan report for 138.46.185.29
Host is up (0.0018s latency).
Not shown: 997 closed tcp ports (conn-refused)
PORT     STATE SERVICE
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql
MAC Address: 00:0C:29:33:A0:BB (VMware)

Nmap done: 1 IP address (1 host up) scanned in 0.37 seconds

┌──(root㉿kali)-[/home/kali]
└─# iptables -vn -L
Chain INPUT (policy ACCEPT 69 packets, 4452 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            138.46.185.29     
 1000 40060 ACCEPT     0    --  *      *       138.46.185.29      0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

                                                                                                                       
┌──(root㉿kali)-[/home/kali]
└─# iptables -Z    

┌──(root㉿kali)-[/home/kali]
└─# nmap -sT -p 1-65635 138.46.185.29
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-09 20:07 EET
Ports specified must be between 0 and 65535 inclusive
QUITTING!
                                                                                                                        
┌──(root㉿kali)-[/home/kali]
└─# iptables -vn -L
Chain INPUT (policy ACCEPT 50 packets, 2519 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            138.46.185.29     
    0     0 ACCEPT     0    --  *      *       138.46.185.29      0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
                                                                                                                        
┌──(root㉿kali)-[/home/kali]

#### nmap iptables scanning ENDS HERE





##################################################
## Network Sweeping 

# tätä voidaakseen käsitellä suuria host:in koneiden määriä tai muuten yrittää säästää verkkoliikennettä, ja voidaan tutkia näitä koneiden käyttämälllä network sweeping-tekniikkaa
# koneet, jotka suodattavat (filter) tai estävät ICMP-pyyntöä, johon voivat vaikuttaa ping:in sweep:iin ja se ei ole lopullinen tapa tunnistaa, mitkä koneet ovat up tai down
# se tarjoaa hyvän vertailunkohteen kohdeverkosta ymmärtämisellä ja mahdollisten pakettien suodatus laitteiden tunnistamalla olemalla olevassa oloa (eli jos laite on olemassa)

┌──(root㉿kali)-[/home/kali]
└─# nmap -sn 193.16.18.1-254
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-09 20:20 EET
Nmap scan report for 193.16.18.1
Host is up (0.00073s latency).
MAC Address: A0:FE:FC:CE:62:7A (VMware)
Nmap scan report for 193.16.18.2
Host is up (0.00060s latency).
MAC Address: E7:41:63:AA:FE:92 (VMware)
Nmap scan report for 193.16.18.129
Host is up (0.00098s latency).
MAC Address: D7:4D:D3:C4:EB:4D (VMware)
Nmap scan report for 193.16.18.254
Host is up (0.00076s latency).
MAC Address: 4A:8B:AC:97:B4:9F (VMware)
Nmap scan report for 193.16.18.130
Host is up.
Nmap done: 254 IP addresses (5 hosts up) scanned in 2.14 seconds



# toinen esim. josta skannaa kaikki 254 porttia, jotka ovat ylhäällä, huomiona, tässä voi välissä on muutama piste (....) turha lisätä kaikki portit mitkä ovat ylhäällä.
# mutta tällä methodilal voidaan leikkisti niin kuin rajoittaa ja nähdä mitkä portit ovat ylhäällä, toki se jos kaikki portit on ylhäällä niin se tulostaa koko listan portin
──(root㉿kali)-[/home/kali]
└─# nmap -sn 193.170.10.1-254  
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-09 20:22 EET
Nmap scan report for 193.170.10.1
Host is up (0.067s latency).
Nmap scan report for 193.170.10.2
Host is up (0.0018s latency).
Nmap scan report for 193.170.10.3
....
Host is up (0.0018s latency).
Nmap scan report for 193.170.10.254

## seuraavat esim.
# Live-koneiden etsimisen grep-komennolla voi antaa käyttäjälle vaikeasti hallittavan tuloksensa.
# Komennolla Nmap:in "greppable" tulostusparametri (-oG) näiden tulosten tallentamisten muotoa, jota on helpompi hallita.

┌──(kali㉿kali)-[~]
└─$ nmap -sn 194.17.34.1-254 
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 12:45 EET
Nmap scan report for 194.17.34.171
Host is up (0.013s latency).
Nmap done: 254 IP addresses (1 host up) scanned in 44.11 seconds

# periaatteessa tämä komento tulostuksesta kirjoitettaan ping-sweep.txt tiedoston sisään
┌──(kali㉿kali)-[~]
└─$ nmap -sn 194.17.34.1-254 -oG ping-sweep.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 12:47 EET
Nmap scan report for 194.17.34.1
Host is up (0.0033s latency).
Nmap scan report for 194.17.34.171
Host is up (0.0031s latency).
Nmap done: 254 IP addresses (2 hosts up) scanned in 64.80 seconds
                                                                                                               

# ja specialsempi komento, josta katsotaan se toiminnan tulostus                                                                            
┌──(kali㉿kali)-[~]
└─$ grep Up ping-sweep.txt | cut -d " " -f 2
194.17.34.1
194.17.34.171

# cat luetaan toi ping-sweep.txt tiedosto sisältö tausta
┌──(kali㉿kali)-[~]
└─$ cat ping-sweep.txt 
# Nmap 7.93 scan initiated Fri Nov 10 12:47:14 2023 as: nmap -sn -oG ping-sweep.txt 194.17.34.1-254
Host: 194.17.34.1 ()   Status: Up
Host: 194.17.34.171 () Status: Up
# Nmap done at Fri Nov 10 12:48:19 2023 -- 254 IP addresses (2 hosts up) scanned in 64.80 seconds

##################
## jos mennään eteenpäin, voidaan pyyhkäistä tiettyjä TCP ja/tai UDP-portteja (-p) komennon verkon ylitse
# HUOM. tuossa päättyessä on eri tiedosto
└─$ nmap -p 80 194.17.34.1-254 -oG web-sweep.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 13:02 EET
Nmap scan report for 194.17.34.1
Host is up (0.0048s latency).

PORT   STATE SERVICE
80/tcp open  http

Nmap scan report for 194.17.34.171
Host is up (0.0031s latency).

PORT   STATE SERVICE
80/tcp open  http

Nmap done: 254 IP addresses (2 hosts up) scanned in 25.55 seconds
                                                                                          
┌──(kali㉿kali)-[~]
└─$ grep open web-sweep.txt | cut -d " " -f 2 
194.17.34.1
194.17.34.171
                                                                                          
# cat luetaan toi web-sweep.txt tiedosto sisältö tausta
┌──(kali㉿kali)-[~]
└─$ cat web-sweep.txt 
# Nmap 7.93 scan initiated Fri Nov 10 13:02:39 2023 as: nmap -p 80 -oG web-sweep.txt 194.17.34.1-254
Host: 194.17.34.1 ()   Status: Up
Host: 194.17.34.1 ()   Ports: 80/open/tcp//http///
Host: 194.17.34.171 () Status: Up
Host: 194.17.34.171 () Ports: 80/open/tcp//http///
# Nmap done at Fri Nov 10 13:03:05 2023 -- 254 IP addresses (2 hosts up) scanned in 25.55 seconds


### seuraavaksi, komennossa voidaan skannata useiden IP-osoiteiden välillä ja etsiä vain muutamista yleisiä portteja, johon komennossa suoritettaan 20 parhaan TCP-portin skannausta ja uutteen txt tiedostoon

┌──(kali㉿kali)-[~]
└─$ nmap -sT -A --top-ports=20 194.17.34.1-254 -oG top-port-sweep.txt   
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 13:15 EET
Nmap scan report for 194.17.34.1
Host is up (0.0040s latency).

PORT     STATE    SERVICE       VERSION
21/tcp   filtered ftp
22/tcp   open     ssh           OpenSSH 7.5 (protocol 2.0)
23/tcp   filtered telnet
25/tcp   filtered smtp
53/tcp   filtered domain
80/tcp   open     http          nginx
|_http-title: Did not follow redirect to https://194.17.34.1:8443/
110/tcp  filtered pop3
111/tcp  filtered rpcbind
135/tcp  filtered msrpc
139/tcp  filtered netbios-ssn
143/tcp  filtered imap
443/tcp  open     https?
445/tcp  filtered microsoft-ds
993/tcp  filtered imaps
995/tcp  filtered pop3s
1723/tcp filtered pptp
3306/tcp filtered mysql
3389/tcp filtered ms-wbt-server
5900/tcp filtered vnc
8080/tcp filtered http-proxy

Nmap scan report for 194.17.34.171
Host is up (0.15s latency).

PORT     STATE    SERVICE       VERSION
21/tcp   filtered ftp
22/tcp   filtered ssh
23/tcp   filtered telnet
25/tcp   filtered smtp
53/tcp   filtered domain
80/tcp   open     http          Apache httpd
|_ms-sql-info: ERROR: Script execution failed (use -d to debug)
|_http-server-header: Apache
|_http-title: TopAccess
|_ms-sql-ntlm-info: ERROR: Script execution failed (use -d to debug)
110/tcp  filtered pop3
111/tcp  filtered rpcbind
135/tcp  filtered msrpc
139/tcp  open     netbios-ssn?
|_ms-sql-info: ERROR: Script execution failed (use -d to debug)
|_ms-sql-ntlm-info: ERROR: Script execution failed (use -d to debug)
143/tcp  filtered imap
443/tcp  filtered https
445/tcp  open     microsoft-ds
|_ms-sql-ntlm-info: ERROR: Script execution failed (use -d to debug)
|_ms-sql-info: ERROR: Script execution failed (use -d to debug)
| fingerprint-strings: 
|   SMBProgNeg: 
|_    SMBr
993/tcp  filtered imaps
995/tcp  filtered pop3s
1723/tcp filtered pptp
3306/tcp filtered mysql
3389/tcp filtered ms-wbt-server
5900/tcp filtered vnc
8080/tcp open     http          Apache httpd
|_http-open-proxy: Proxy might be redirecting requests
|_http-server-header: Apache
|_http-title: TopAccess
|_ms-sql-info: ERROR: Script execution failed (use -d to debug)
|_ms-sql-ntlm-info: ERROR: Script execution failed (use -d to debug)
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port445-TCP:V=7.93%I=7%D=11/10%Time=654E111C%P=x86_64-pc-linux-gnu%r(SM
SF:BProgNeg,51,"\0\0\0M\xffSMBr\0\0\0\0\x88\x01H\0\0\0\0\0\0\0\0\0\0\0\0\0
SF:\0@\x06\0\0\x01\0\x11\x07\0\x07\n\0\x01\0\0\0\x01\0\0\0\x01\0\0\0\0\0\|
SF:\xe0\0\0P\xf9\xef\x0c\xca\x13\xda\x01\x88\xff\x08\x08\0\xf7\xb0\x8f\xe8
SF:\x87\|\0a");

Host script results:
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: supported
|_nbstat: NetBIOS name: MFP12339215, NetBIOS user: <unknown>, NetBIOS MAC: 000000000000 (Xerox)
| smb2-security-mode: 
|   311: 
|_    Message signing enabled but not required
|_clock-skew: mean: 19m07s, deviation: 0s, median: 19m07s
|_ms-sql-info: ERROR: Script execution failed (use -d to debug)
| smb2-time: 
|   date: 2023-11-10T11:36:14
|_  start_date: 2023-11-03T20:51:28

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 254 IP addresses (2 hosts up) scanned in 174.20 seconds
                                                                   
# cat luetaan toi top-port-sweep.txt tiedosto sisältö tausta
┌──(kali㉿kali)-[~]
└─$ cat top-port-sweep.txt 
# Nmap 7.93 scan initiated Fri Nov 10 13:15:58 2023 as: nmap -sT -A --top-ports=20 -oG top-port-sweep.txt 194.17.34.1-254
Host: 194.17.34.1 ()   Status: Up
Host: 194.17.34.1 ()   Ports: 21/filtered/tcp//ftp///, 22/open/tcp//ssh//OpenSSH 7.5 (protocol 2.0)/, 23/filtered/tcp//telnet///, 25/filtered/tcp//smtp///, 53/filtered/tcp//domain///, 80/open/tcp//http//nginx/, 110/filtered/tcp//pop3///, 111/filtered/tcp//rpcbind///, 135/filtered/tcp//msrpc///, 139/filtered/tcp//netbios-ssn///, 143/filtered/tcp//imap///, 443/open/tcp//https?///, 445/filtered/tcp//microsoft-ds///, 993/filtered/tcp//imaps///, 995/filtered/tcp//pop3s///, 1723/filtered/tcp//pptp///, 3306/filtered/tcp//mysql///, 3389/filtered/tcp//ms-wbt-server///, 5900/filtered/tcp//vnc///, 8080/filtered/tcp//http-proxy///
Host: 194.17.34.171 () Status: Up
Host: 194.17.34.171 () Ports: 21/filtered/tcp//ftp///, 22/filtered/tcp//ssh///, 23/filtered/tcp//telnet///, 25/filtered/tcp//smtp///, 53/filtered/tcp//domain///, 80/open/tcp//http//Apache httpd/, 110/filtered/tcp//pop3///, 111/filtered/tcp//rpcbind///, 135/filtered/tcp//msrpc///, 139/open/tcp//netbios-ssn?///, 143/filtered/tcp//imap///, 443/filtered/tcp//https///, 445/open/tcp//microsoft-ds///, 993/filtered/tcp//imaps///, 995/filtered/tcp//pop3s///, 1723/filtered/tcp//pptp///, 3306/filtered/tcp//mysql///, 3389/filtered/tcp//ms-wbt-server///, 5900/filtered/tcp//vnc///, 8080/open/tcp//http//Apache httpd/
# Nmap done at Fri Nov 10 13:18:53 2023 -- 254 IP addresses (2 hosts up) scanned in 174.20 seconds
                                                                             
# koneita, jotka voidaaan osoittautua palvelurikkaaksi (rich in services) tai muuten vaan mielenkiintoiseksi, porttitarkistuksessa yksittelen käyttämällä kattavampaa porttiuluetteloa

####### vmware (badstore) sweeping (START HERE) ##########

┌──(kali㉿kali)-[~]
└─$ nmap -sn 138.46.185.29  
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 19:12 EET
Nmap scan report for 138.46.185.29
Host is up (0.0020s latency).
Nmap done: 1 IP address (1 host up) scanned in 0.05 seconds
############################### 
######## sweep tulostusparametri (-oG) 
┌──(kali㉿kali)-[~]
└─$ nmap -sn 138.46.185.30100-135 -oG ping-sweep.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 19:30 EET
Nmap scan report for 138.46.185.29
Host is up (0.0011s latency).
Nmap scan report for 138.46.185.30
Host is up (0.00055s latency).
Nmap done: 36 IP addresses (2 hosts up) scanned in 4.33 seconds
                                                                           # grep up the ping-sweep file        
┌──(kali㉿kali)-[~]
└─$ grep Up ping-sweep.txt | cut -d " " -f 2
138.46.185.29
138.46.185.30

┌──(kali㉿kali)-[~]
└─$ cat ping-sweep.txt
# Nmap 7.93 scan initiated Fri Nov 10 19:30:00 2023 as: nmap -sn -oG ping-sweep.txt 138.46.185.30100-135
Host: 138.46.185.29 ()        Status: Up
Host: 138.46.185.30 ()        Status: Up
# Nmap done at Fri Nov 10 19:30:05 2023 -- 36 IP addresses (2 hosts up) scanned in 4.33 seconds

###############################

# check TCP ja/tai UDP portteja (-p) portti 80 ja sama komentoa ja erilliseen tiedostoon

┌──(kali㉿kali)-[~]
└─$ nmap -p 80 138.46.185.30120-135 -oG web-sweep.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 19:44 EET
Nmap scan report for 138.46.185.29
Host is up (0.00070s latency).

PORT   STATE SERVICE
80/tcp open  http

Nmap scan report for 138.46.185.30
Host is up (0.00025s latency).

PORT   STATE  SERVICE
80/tcp closed http

Nmap done: 16 IP addresses (2 hosts up) scanned in 1.62 seconds

# grep the web-sweep file
┌──(kali㉿kali)-[~]
└─$ grep open web-sweep.txt | cut -d " " -f 2 
138.46.185.29


# check the web-sweep.txt

┌──(kali㉿kali)-[~]
└─$ cat web-sweep.txt 
# Nmap 7.93 scan initiated Fri Nov 10 19:44:22 2023 as: nmap -p 80 -oG web-sweep.txt 138.46.185.30120-135
Host: 138.46.185.29 ()        Status: Up
Host: 138.46.185.29 ()        Ports: 80/open/tcp//http///
Host: 138.46.185.30 ()        Status: Up
Host: 138.46.185.30 ()        Ports: 80/closed/tcp//http///
# Nmap done at Fri Nov 10 19:44:23 2023 -- 16 IP addresses (2 hosts up) scanned in 1.62 seconds

###############################

# scannataan ja tarkistellaan top 20 porttei ja tulostukset tonne toiseen tiedostoon

┌──(kali㉿kali)-[~]
└─$ nmap -sT -A --top-ports=20 138.46.185.30120-135 -oG top-port-sweep.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-10 19:50 EET
Nmap scan report for 138.46.185.29
Host is up (0.0012s latency).

PORT     STATE  SERVICE       VERSION
21/tcp   closed ftp
22/tcp   closed ssh
23/tcp   closed telnet
25/tcp   closed smtp
53/tcp   closed domain
80/tcp   open   http          Apache httpd 1.3.28 ((Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c)
| http-robots.txt: 5 disallowed entries 
|_/cgi-bin /scanbot /backup /supplier /upload
|_http-server-header: Apache/1.3.28 (Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c
| http-methods: 
|_  Potentially risky methods: TRACE
|_http-title: Welcome to BadStore.net v1.2.3s
110/tcp  closed pop3
111/tcp  closed rpcbind
135/tcp  closed msrpc
139/tcp  closed netbios-ssn
143/tcp  closed imap
443/tcp  open   ssl/http      Apache httpd 1.3.28 ((Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c)
|_ssl-date: 2023-11-09T03:04:47+00:00; -1d14h46m23s from scanner time.
|_http-server-header: Apache/1.3.28 (Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c
|_http-title: Welcome to BadStore.net v1.2.3s
| ssl-cert: Subject: commonName=www.badstore.net/organizationName=BadStore.net/stateOrProvinceName=Illinois/countryName=US
| Subject Alternative Name: email:root@badstore.net
| Not valid before: 2006-05-10T12:52:53
|_Not valid after:  2009-02-02T12:52:53
| http-robots.txt: 5 disallowed entries 
|_/cgi-bin /scanbot /backup /supplier /upload
| sslv2: 
|   SSLv2 supported
|   ciphers: 
|     SSL2_IDEA_128_CBC_WITH_MD5
|     SSL2_RC2_128_CBC_EXPORT40_WITH_MD5
|     SSL2_RC4_128_WITH_MD5
|     SSL2_RC2_128_CBC_WITH_MD5
|     SSL2_RC4_64_WITH_MD5
|     SSL2_RC4_128_EXPORT40_WITH_MD5
|     SSL2_DES_64_CBC_WITH_MD5
|_    SSL2_DES_192_EDE3_CBC_WITH_MD5
| http-methods: 
|_  Potentially risky methods: TRACE
445/tcp  closed microsoft-ds
993/tcp  closed imaps
995/tcp  closed pop3s
1723/tcp closed pptp
3306/tcp open   mysql         MySQL 4.1.7-standard
| mysql-info: 
|   Protocol: 10
|   Version: 4.1.7-standard
|   Thread ID: 10
|   Capabilities flags: 33324
|   Some Capabilities: ConnectWithDatabase, Support41Auth, SupportsCompression, Speaks41ProtocolNew, LongColumnFlag
|   Status: Autocommit
|_  Salt: _OKkZ_NKk[dgW\KDO@5'
3389/tcp closed ms-wbt-server
5900/tcp closed vnc
8080/tcp closed http-proxy

Host script results:
|_clock-skew: -1d14h46m23s

Nmap scan report for 138.46.185.30
Host is up (0.0013s latency).

PORT     STATE  SERVICE       VERSION
21/tcp   closed ftp
22/tcp   closed ssh
23/tcp   closed telnet
25/tcp   closed smtp
53/tcp   closed domain
80/tcp   closed http
110/tcp  closed pop3
111/tcp  closed rpcbind
135/tcp  closed msrpc
139/tcp  closed netbios-ssn
143/tcp  closed imap
443/tcp  closed https
445/tcp  closed microsoft-ds
993/tcp  closed imaps
995/tcp  closed pop3s
1723/tcp closed pptp
3306/tcp closed mysql
3389/tcp closed ms-wbt-server
5900/tcp closed vnc
8080/tcp closed http-proxy

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 16 IP addresses (2 hosts up) scanned in 16.46 seconds


┌──(kali㉿kali)-[~]
└─$ cat top-port-sweep.txt 
# Nmap 7.93 scan initiated Fri Nov 10 19:50:53 2023 as: nmap -sT -A --top-ports=20 -oG top-port-sweep.txt 138.46.185.30120-135
Host: 138.46.185.29 ()        Status: Up
Host: 138.46.185.29 ()        Ports: 21/closed/tcp//ftp///, 22/closed/tcp//ssh///, 23/closed/tcp//telnet///, 25/closed/tcp//smtp///, 53/closed/tcp//domain///, 80/open/tcp//http//Apache httpd 1.3.28 ((Unix) mod_ssl|2.8.15 OpenSSL|0.9.7c)/, 110/closed/tcp//pop3///, 111/closed/tcp//rpcbind///, 135/closed/tcp//msrpc///, 139/closed/tcp//netbios-ssn///, 143/closed/tcp//imap///, 443/open/tcp//ssl|http//Apache httpd 1.3.28 ((Unix) mod_ssl|2.8.15 OpenSSL|0.9.7c)/, 445/closed/tcp//microsoft-ds///, 993/closed/tcp//imaps///, 995/closed/tcp//pop3s///, 1723/closed/tcp//pptp///, 3306/open/tcp//mysql//MySQL 4.1.7-standard/, 3389/closed/tcp//ms-wbt-server///, 5900/closed/tcp//vnc///, 8080/closed/tcp//http-proxy///
Host: 138.46.185.30 ()        Status: Up
Host: 138.46.185.30 ()        Ports: 21/closed/tcp//ftp///, 22/closed/tcp//ssh///, 23/closed/tcp//telnet///, 25/closed/tcp//smtp///, 53/closed/tcp//domain///, 80/closed/tcp//http///, 110/closed/tcp//pop3///, 111/closed/tcp//rpcbind///, 135/closed/tcp//msrpc///, 139/closed/tcp//netbios-ssn///, 143/closed/tcp//imap///, 443/closed/tcp//https///, 445/closed/tcp//microsoft-ds///, 993/closed/tcp//imaps///, 995/closed/tcp//pop3s///, 1723/closed/tcp//pptp///, 3306/closed/tcp//mysql///, 3389/closed/tcp//ms-wbt-server///, 5900/closed/tcp//vnc///, 8080/closed/tcp//http-proxy///
# Nmap done at Fri Nov 10 19:51:10 2023 -- 16 IP addresses (2 hosts up) scanned in 16.46 seconds
                                                                         
┌──(kali㉿kali)-[~]

####### vmware (badstore) sweeping (ENDS HERE) ##########
