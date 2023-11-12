#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu START HERE: 130

# samat harjoitukset, lyhyet ja ytimekäs kuvaus ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 

#######################################################################################################
##### SMTP Enumeration #####

# SMTP = Simple Mail Transfer Protocol
# tietyissä haavoittuvuuksissa kokoonpanoissa sähköpostipalvelimissa voidaan käyttää myös tieotjen keräämistä host tai verkosossa.
# SMTP tukee useita tärkeitä komentoja kuten "VRFY" ja "EXPN"
  # - VRFY pyyntö pyytää palvelinta vahvistamaan sähköpostiosoitteen
  # - EXPN kysyy palvelimelta postituslistan jäsenyyttää (membership of a mailing list)

# näitä voidaaan usein käyttää vääriin todentamisiin olemassa oleviin käyttäjiä sähköpostipalvelimella, mikä voi myöhemin auttaa hyökkääjää.
# SMPT oletus portti on 25, se on TCP protokolla. Jotkut verkkovalvojat (network admin) saattavat päättää määrittää toisen portin SMTP palvelun suorittamista.
# Jos SMTP palvelussa on virheitä tai palvelimessa on haavoittuvuus, siinä tapauksessa voidaan saavutta useita asioita mm:
  # - Voimme luetella ja kerätä käyttäjätilejä
  # - Voimme ohittaa todennuksen ja lähettää sähköposteja, jos meillä on avoin välitys.

# esim. komento scripti & nc = netcat
root@kali:~# nc -nv 10.11.1.215 25
(UNKNOWN) [10.11.1.215] 25 (smtp) open
220 redhat.acme.com ESMTP Sendmail 8.12.8/8.12.8; Wed, 12 Jun 2013 07:47:14 +0300
VRFY root
250 2.1.5 root <root@redhat.acme.com>
VRFY idontexist
550 5.1.1 idontexist... User unknown
^C
root@kali:~# 

# This procedure can be used to help guess valid usernames.
> nc -nv 192.168.11.215 25

# seuraava joku python scripti, joka avaa TCP socketin, muodostaen yhteytä SMTP palvelimeen ja antaa VRFY komennon tietylle käyttäjätunnuksille
# en tiedä toimiiko tämä, mutta joku scripti komento 

# !/usr/bin/python
import socket
import sys

if len(sys.argv) != 2:
  print "Usage: vrfy.py <username>"
  sys.exit(0)

# Create a Socket
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the Server
connect=s.connect(('192.168.11.215',25))

# Receive the banner
banner=s.recv(1024)
print banner

# VRFY a user
s.send('VRFY' - sys.argv[1] - '\r\n')
result=s.recv(1024)
print result

# Close the socket
s.close()

#######################################################################################################
###### SNMP Enumeration ######

# SNMP = simple network management , protocol

# Tätä protokolalan usein SNMP-virheitä (misconfigurations), joka voi johtaa dramaattisen tietovuotoa

# SNMP perustuu UDP:hen, yksinkertaisen, tilattomaan protkollaan ja siksi alttiina IP-huijauksiin (IP-spoofing) ja toistohyökkäystä.
# SNMP protokollan versioita on mm. 1,2 ja 2c jotka eivät tarjoa tietoliikenteen salausta, joten SNMP-tiedot ja valtuustiedot voiat helposti siepatta paikallisen verkon kautta.

# SNMP protkolla on myös heikot todennusjärjestelmät (authentication schemes) ja ne jätetään yleensä oletusarvoisesti julkisiin aj yksityisiin yhteisön merkkijonoihin.


#################
#### MIB Tree (SNMP Management Information Base) ######
# MIB tree , on tietokanta, joka sisältää yleensä verkonhallinnan liittyviä tietoja. Tietokanta on järjestetty kuin tree muodossa, missä sivuliikkeet edustavat erilaisia organisaatioita tai verkoston toimistoja. 

# Tree, tai se puu, jossa on puu lehdet joka edustaa loppulliset päätepisteet, vastaavat tiettyjä muuttuja arvoja, joita ulkopuolinen käyttäjä voi sitten käyttää ja tutkia. 

# Lisää lukemista linkistä; http://publib.boulder.ibm.com/infocenter/pseries/v5r3/index.jsp?topic=/com.ibm

########################
## scanning for SNMP
# jos skannaa avoimen SNMP portin, josta voidaan hyödyntää nmap syntaksin scriptin komennon;

root@kali:~# nmap -sU --open -p 161 10.11.1.1-254 -oG mega-snmp.txt

## oma skannaus osoite
┌──(root㉿kali)-[/home/kali]
└─# nmap -sU --open -p 161 192.168.240.120-135 -oG mega-snmp.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-12 14:49 EET
Nmap done: 16 IP addresses (2 hosts up) scanned in 2.15 seconds

# ylemmän komenon tulokset menee mega-snmp txt tiedoston sisäään
┌──(kali㉿kali)-[~]
└─$ cat mega-snmp.txt 
# Nmap 7.93 scan initiated Sun Nov 12 14:49:51 2023 as: nmap -sU --open -p 161 -oG mega-snmp.txt 192.168.240.120-135
# Nmap done at Sun Nov 12 14:49:53 2023 -- 16 IP addresses (2 hosts up) scanned in 2.15 seconds

## toinen työkalua voidaan käyttää kuten 161 (onesixtyone), joka tarkistaa tietyn yhteisön merkkijonot IP-luettelosta, jolloin voidaan pakottaa erilisia yhteisön stringiä

┌──(kali㉿kali)-[~]
└─$ echo public > community     
                                                                                             
┌──(kali㉿kali)-[~]
└─$ echo private >> community 
                                                                                             
┌──(kali㉿kali)-[~]
└─$ echo manager >> community 
                                                                                             
┌──(kali㉿kali)-[~]
└─$ for ip in $(seq 1 254);do echo 192.168.240.$ip;done > ips              
                                                                                             
┌──(kali㉿kali)-[~]
└─$ onesixtyone -c community -i ips
Scanning 254 hosts, 3 communities
                                                                                             
┌──(kali㉿kali)-[~]
└─$ cat community    
public
private
manager
 
# kun tätä komentoa eli for loop scripti on suoritettu, niin se löytää SNMP palvelut josta voidaan kysellä nittä tiettyjä MIB-tietoja jotta hakkeri/penetraatio testaaja kiinnostaa

########################
## Windows SNMP Enumeration Example

# Voidaan tutkia SNMP-arvoja (query) ja SNMP lukemia stringiä, käyttämällä työkalua "snmpwalk" , joka  on useimmissa keisissä "public"

# käyttämällä jotaikin annetuista MIB-arvoa voidaan yrittää luetella vastaavia arvoja. Esim. kokeilee tällä scriptiä ja katsoa mitä tuloksia se antaa 

# Enumerating the Entire MIB Tree
root@kali:~# snmpwalk -c public -v1 10.11.1.219
iso.3.6.1.2.1.1.1.0 = STRING: "Linux ubuntu 3.2.0-23-generic #36-Ubuntu SMP "
iso.3.6.1.2.1.1.2.0 = OID: iso.3.6.1.4.1.8072.3.2.10
iso.3.6.1.2.1.1.3.0 = Timeticks: (66160) 0:11:01.60
...

# Enumerating Windows Users:
root@kali:~# snmpwalk -c public -v1 10.11.1.204 1.3.6.1.4.1.77.1.2.25

# Enumerating Running Windows Processes:
root@kali:~# snmpwalk -c public -v1 10.11.1.204 1.3.6.1.2.1.25.4.2.1.2

# Enumerating Open TCP Ports:
root@kali:~# snmpwalk -c public -v1 10.11.1.204 1.3.6.1.2.1.6.13.1.3

# Enumerating Installed Software:
root@kali:~# snmpwalk -c public -v1 10.11.1.204 1.3.6.1.2.1.25.6.3.1.2 






