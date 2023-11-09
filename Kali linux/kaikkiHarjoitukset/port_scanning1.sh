#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu start here: 109 - 

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
└─$  nc -nvv -w 1 -z 192.168.240.129 3000-3390
(UNKNOWN) [192.168.240.129] 3390 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3389 (ms-wbt-server) : Connection refused
(UNKNOWN) [192.168.240.129] 3388 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3387 (?) : Connection refused
.
..
...
(UNKNOWN) [192.168.240.129] 3308 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3307 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3306 (mysql) open
(UNKNOWN) [192.168.240.129] 3305 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3304 (?) : Connection refused
.
..
...
(UNKNOWN) [192.168.240.129] 3262 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3261 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3260 (iscsi-target) : Connection refused
(UNKNOWN) [192.168.240.129] 3259 (?) : Connection refused
(UNKNOWN) [192.168.240.129] 3258 (?) : Connection refused

# tässä badstoressa saattaa olla muita portteja, mutta rajoitin itse ton komenon scriptin mukaan, mitä oikein tulostaa ja löytääkään mm. 3000 - 3390  väliltä

# seuraavasti tässä ei tulostunut mitään, mahtako olla jokin muu udp porttit käytössä
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 192.168.240.129 160-162 
                                                                              
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 192.168.240.129 100-150
                                                                              
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 192.168.240.129 100-150
^[[A^[[A^[[A^C
                                                                              
┌──(kali㉿kali)-[~]
└─$ nc -nv -u -z -w 1 192.168.240.129 3390-3392


┌──(kali㉿kali)-[~]
└─$ sudo su                      
[sudo] password for kali: 
┌──(root㉿kali)-[/home/kali]
└─# iptables -I INPUT 1 -s 192.168.240.129 -j ACCEPT
                                                                              
┌──(root㉿kali)-[/home/kali]
└─# iptables -I INPUT 1 -d 192.168.240.129 -j ACCEPT
                                                                              
┌──(root㉿kali)-[/home/kali]
└─# iptables -Z                                     


#### nmap iptables scanning START HERE

┌──(root㉿kali)-[/home/kali]
└─# nmap -sT 192.168.240.129                  
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-09 20:05 EET
Nmap scan report for 192.168.240.129
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
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            192.168.240.129     
 1000 40060 ACCEPT     0    --  *      *       192.168.240.129      0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

                                                                                                                       
┌──(root㉿kali)-[/home/kali]
└─# iptables -Z    

┌──(root㉿kali)-[/home/kali]
└─# nmap -sT -p 1-65635 192.168.240.129
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-09 20:07 EET
Ports specified must be between 0 and 65535 inclusive
QUITTING!
                                                                                                                        
┌──(root㉿kali)-[/home/kali]
└─# iptables -vn -L
Chain INPUT (policy ACCEPT 50 packets, 2519 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            192.168.240.129     
    0     0 ACCEPT     0    --  *      *       192.168.240.129      0.0.0.0/0           

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



# toinen esim. josta skannaa kaikki 254 porttia, jotka ovat ylhäällä
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












