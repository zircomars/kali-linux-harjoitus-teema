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

##########
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









##################################################
## Network Sweeping 












