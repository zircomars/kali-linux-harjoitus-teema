# passiivisien tiedon keräämiset ulkopuolelle ja tutkitaan tekniikoita, joihin liittyy suoraan vuorovaikutusta kohdepalvelujen kanssa (target services)
# Tarkistamisessa on lukemattomia palveluita, joihin voidaan kohdistaa

# tässä sisältyy Active Directory, ja erillisiä moduulia (module). Yleisimpiä aktiivisia tiedonkeräämisen tekniikassa on mm. lukien porttien skannaus ja DNS, SMB, NFS- SMTP JA SNMP -luettelot
# Offensive-Security-OSCP-by-Offensive-Security 2020- the book of the tutorial (page 170-177)
###########################################################
# DNS Enumeration
# DNS = (domain name system), on yksi internetin kriittisimmistä järjestelmistä, ja se on hajautettu tietokantaanm joka vastaa käyttäjäystävällisten verkkotunnusten kääntämisestä IP-osoitteeksi.

# esim. https://www.megacorpone.com - jos otettaan sitä esim. ja tarkistellaan sitä hierarkkin rakennetta.
# Hostname , johon syötettään usein selaimeen ja/tai muuhun sovellukseen. Selain välittää hostname käyttöjärjestelmän DNS-asiakkaalle ja käyttöjärjestelmä lähettää sen eteenpäin pyynnöstä ulkoiselle DNS-palvelimelle, joihin se on määritetty käyttämään. Joten tämä on se ketjun ensimmäinen palvelin tunnettun nimellä DNS-recursor , ja se vastaa vuorovaikutusta DNS-infrastruktuurin kanssa ja tulosten palauttamisesta DNS-asiakkaalle.

# DNS recursors - ottaa yhteytä yksi DNS root zone yhtyetä palvelimista. Root Server vastaa sitten sen palvelimen osoitteella, johon vastaa zone:sta, joka sisältää TLD (Top Level Domain), ja se on just tämä .com & TLD on just pääte ko. org , com , fi ja jne.
# (https://www.apps.megacorpone.com) https  = protocol, www/apps = subdomain , megacorpone = domain name, com = TLD

# Kun DNS recursor - vastaanottaa TLD DNS-serverin osoitteen, niin se kysyy siltä "megacorpone.com" domain:ia arvovaltaisen nimipalvelimen (authoritative nameserer)
# Authoritative nameserver - on viimeinen vaihe DNS-hakuprosessissa (DNS lookup) ja tietuessa (DNS record) paikallisen tietokannassa, joka tunnetaan nimellä zone file. Se host tyyppillisesti kahta zone:a kullakin domainia, ja lähettää eteenpäin lookup zone:a, joten käytetään tietyn hostname ja tietyn lookup zone IP-osoitetta etsimiseen ja käänteisen haun zone:lle. 

# Kun kerran DNS recursors antaa DNS client:in IP-osoitetta www.megacorpone.com , niin selain voi ottaa yhteytä oikeaan web serverin IP-osoitettaan ja siihen latautuu se sivusto.

# DNS:n suorituskyvyn ja luettavuuden (performance and reability) parantamisessa DNS välimuisti (DNS cache) käytetään DNS-tietueiden (DNS records) paikallisten kopioiden talllentamista hakuprosessine eri vaiheissa. Siksi nykyään ja tulevaisuudessakin useissa sovelluksissa kuten selaimissa pitävät erillisiä DNS-välimuistia (DNS cache)

# Paikallisen DNS-client voi myös operoida oma DNS-välimuistia (DNS-cache) jokaiseen hakuprosessiin DNS-palvelimen kanssa (DNS-server). Domain omistaja voi hallinoida kuinka pitkään palvelin tai asiakas säilytää DNS-tietuetta välimuistissa (DNS-record) kulkemalla TTL (time-to-live) kautta.

###########################################################
# Interacting with a DNS server(s)
# jokaisessa domain:issa voi käyttää eri tyyppistä DNS record:ia. Yleisimpiä DNS-recordia ovat mm..

# - NS - nameserver records - sisältyvät toimialueen DNS record domain:ia valtuutettujen palvelimien nimiä
# - A -tunnettaan myös host record (record), sisältää hostname IP-osoitteen hostnimi (kuten www.megacorpone.com)
# - MX - mail exchange record, sisältyvät toimialueen sähköpostien käsittelystä vastaavien palvelimien domaini. Domain voi sisältää useita MX-record:ia.
# - PTR - pointer records , joka käytetään käänteishaun (lookup zones) ja niitä käytetään IP-osoitteeseen liittyviä record:in etsimistä.
# - CNAME - canonical name records , joka käytetään aliaksen luomisessa toisen/muihin host record:iin
# - TXT - text records, voi sisältää mitä tahansa mielivaltaisia tietoja ja niitä voidaan käyttää eri tarkoituksiinsa, kuten domain (verkkotunnusten) omistajuuden vahvistamista.

########
# maybe easy way understand, but these can find by google

#A Host A record (IPv4)
# AAAA Host A record (IPv6)
# MX Mailserver record
# NS Nameserver record
# CNAME Alias record
# PTR Pointer record
# SOA Authority record

# pieni demo (start here) ja kokeillaan esim. tätä linkkiä (host) www.megacorpone.com

# tätä voi testata ilman www & huom tässä on eri IP-osoite verrattuna kirjaan (kirjassa IP-osoite; 38.100.193 )
└─$ host www.megacorpone.com
www.megacorpone.com has address 149.56.244.87

──(kali㉿kali)-[~]
└─$ host megacorpone.com 
megacorpone.com mail is handled by 10 fb.mail.gandi.net.
megacorpone.com mail is handled by 50 mail.megacorpone.com.
megacorpone.com mail is handled by 60 mail2.megacorpone.com.
megacorpone.com mail is handled by 20 spool.mail.gandi.net.

# oletuksena host komentoa etsii A-record:in, mutta voidaan tarkistella ja kysellä muita kentiä mm. MX tai TXT-record:ia. Tätä voidaan periaatteessa käyttää ja lisätä -t vaihtoehdon määrittäkseen etsimällä tyyppin
──(kali㉿kali)-[~]
└─$ host -t mx megacorpone.com
megacorpone.com mail is handled by 60 mail2.megacorpone.com.
megacorpone.com mail is handled by 50 mail.megacorpone.com.
megacorpone.com mail is handled by 20 spool.mail.gandi.net.
megacorpone.com mail is handled by 10 fb.mail.gandi.net.


┌──(kali㉿kali)-[~]
└─$ host -t txt  megacorpone.com
megacorpone.com descriptive text "Try Harder"
megacorpone.com descriptive text "google-site-verification=U7B_b0HNeBtY4qYGQZNsEYXfCJ32hMNV3GtC0wWq5pA"

###########################################################
# Automating Lookups

# lisää DNS kysellyä ja löydetäkseen samoja hostname, ja IP-osoiteittaa, johon kuuluviin sama domain, ja seuraavaksi tarkistellaan domainin web server.
└─$ host www.megacorpone.com
www.megacorpone.com has address 149.56.244.87


# idontexist - tarkistellaan sen serveriä
┌──(kali㉿kali)-[~]
└─$ host idontexist.megacorpone.com
Host idontexist.megacorpone.com not found: 3(NXDOMAIN)


###########################################################
# Forward Lookup Brute Force

# Brute force on trial-and-error tekniikka, joka pyrki löydetäkseen informaatiota, mukaan lukin webserver hakemistot, käyttäjätunnus ja salsayhdistelmiä tai kelvollisisa DNS-record:ia. Käyttämällä sanaluetteloa (wordlist), joka sisältyy yleisiä hostname, johon voidaan yrittää arvata DNS-record:in ja tarkistaa vastauksia kelvollisia hostname:ä varalta.

# eli esim. tarkistaa mm. olevai "forward lookups", which request the IP address of a hostname, to query both a valid and an invalid hostname. If host successfully resolves a name to an IP, this could be an indication of a functional server.

# automate the forward DNS loookup of the common hostnames using by the host commands, this work basic linux and bash lines
# tähän voisi mm. lisätä muita tcp/upd protokollia eli nimeämisiä listan alle
┌──(kali㉿kali)-[~/Downloads]
└─$ cat list.txt
www
ftp
mail
owa
proxy
router


┌──(kali㉿kali)-[~/Downloads]
└─$ for ip in $(cat list.txt); do host $ip.megacorpone.com; done
www.megacorpone.com has address 149.56.244.87
Host ftp.megacorpone.com not found: 3(NXDOMAIN)
mail.megacorpone.com has address 51.222.169.212
Host owa.megacorpone.com not found: 3(NXDOMAIN)
Host proxy.megacorpone.com not found: 3(NXDOMAIN)
router.megacorpone.com has address 51.222.169.214

###########################################################
# Reverse Lookup Brute Force

# DNS  forward brute force enumeration revealed a set of scattered IP addresses same the approximate range (149.56.244.X) something. If the DNS administrator of megacorpone.com configured PTR191 records for the domain, then can scan the approximate range with reverse lookups to request the hostname for each IP.

# so, let's use loop scan IP-addressses 149.56.244.87 to 149.56.244.100 (some IP-range). This will filter out invalid results by showing only entries that do not contain "not found" within (grep-v)
# if for loop commnad change host ip-address to (149.56.244.87) it will may give other dns records , so check the book (Offensive-Security-OSCP-by-Offensive-Security_2020.pdf)
┌──(kali㉿kali)-[~]
└─$  for ip in $(seq 50 100); do host 38.100.193.$ip; done | grep -v "not found"

66.193.100.38.in-addr.arpa domain name pointer syslog.megacorpone.com.
69.193.100.38.in-addr.arpa domain name pointer beta.megacorpone.com.
70.193.100.38.in-addr.arpa domain name pointer ns1.megacorpone.com.
72.193.100.38.in-addr.arpa domain name pointer admin.megacorpone.com.
73.193.100.38.in-addr.arpa domain name pointer mail2.megacorpone.com.
76.193.100.38.in-addr.arpa domain name pointer www.megacorpone.com.
77.193.100.38.in-addr.arpa domain name pointer vpn.megacorpone.com.
80.193.100.38.in-addr.arpa domain name pointer ns2.megacorpone.com.
84.193.100.38.in-addr.arpa domain name pointer mail.megacorpone.com.
85.193.100.38.in-addr.arpa domain name pointer snmp.megacorpone.com.
89.193.100.38.in-addr.arpa domain name pointer siem.megacorpone.com.
90.193.100.38.in-addr.arpa domain name pointer ns3.megacorpone.com.
91.193.100.38.in-addr.arpa domain name pointer router.megacorpone.com.


# The result is successfully managed to the resolve of a number of IP-address to valid hosts using reverse  DNS lookups. If continue the perfoming an assessments, could further extrapolate the these results, and might get the scan for "email1", "email3" and ect, reverse lookup positive results.
# These types of the scan are often cyclical, for search based on any information can receive at every round.


###########################################################
# DNS Zone Transfers

# A zone transfer is a database replication between related DNS servers in which the zone file is copied from a master DNS server to a slave or ther servers. The zone file contians a list of all the DNS names configured for that zone. Zone transfer should be allowed to authrozied slave or other DNS server, but most many administrators misconfigured their DNS servers, if anyone asking for a copy the DNS server zone will usually receive one.

# A successful zone transfer does not directly result in a network breach, although it does facilitate the process.

# The host command syntax for performing a zone transfer
$host -l <domain name> <dns-server-address>


# some former command notice maybe couple or multiple DNS server serve the megacorpone.com domains ns1, ns2, and ns3 (for loop command). 
# Let's try a zone transfer again each one of the megacorpone.com 

# this nameserver ns1 does not allow DNS zone transfer so this is why it gave failed results 
┌──(kali㉿kali)-[~]
└─$  host -l megacorpone.com ns1.megacorpone.com
Using domain server:
Name: ns1.megacorpone.com
Address: 51.79.37.18#53
Aliases: 

Host megacorpone.com not found: 5(REFUSED)
; Transfer failed.

# let's try other nameserver like sn2 and sn3
┌──(kali㉿kali)-[~]
└─$  host -l megacorpone.com ns2.megacorpone.com
Using domain server:
Name: ns2.megacorpone.com
Address: 51.222.39.63#53
Aliases: 

megacorpone.com name server ns1.megacorpone.com.
megacorpone.com name server ns2.megacorpone.com.
megacorpone.com name server ns3.megacorpone.com.
admin.megacorpone.com has address 51.222.169.208
beta.megacorpone.com has address 51.222.169.209
fs1.megacorpone.com has address 51.222.169.210
intranet.megacorpone.com has address 51.222.169.211
mail.megacorpone.com has address 51.222.169.212
mail2.megacorpone.com has address 51.222.169.213
ns1.megacorpone.com has address 51.79.37.18
ns2.megacorpone.com has address 51.222.39.63
ns3.megacorpone.com has address 66.70.207.180
router.megacorpone.com has address 51.222.169.214
siem.megacorpone.com has address 51.222.169.215
snmp.megacorpone.com has address 51.222.169.216
support.megacorpone.com has address 51.222.169.218
syslog.megacorpone.com has address 51.222.169.217
test.megacorpone.com has address 51.222.169.219
vpn.megacorpone.com has address 51.222.169.220
www.megacorpone.com has address 149.56.244.87
www2.megacorpone.com has address 149.56.244.87

# ns3 gave the failed of the results
┌──(kali㉿kali)-[~]
└─$  host -l megacorpone.com ns3.megacorpone.com
Using domain server:
Name: ns3.megacorpone.com
Address: 66.70.207.180#53
Aliases: 

Host megacorpone.com not found: 5(REFUSED)
; Transfer failed.

# some pratice ends here because sort of did already once, but it's written some where on txt files
###########################################################

# DNS recon
┌──(kali㉿kali)-[~]
└─$ dnsrecon -d megacorpone.com -t axfr
[*] Checking for Zone Transfer for megacorpone.com name servers
[*] Resolving SOA Record
[+]      SOA ns1.megacorpone.com 51.79.37.18
[*] Resolving NS Records
[*] NS Servers found:
[+]      NS ns2.megacorpone.com 51.222.39.63
[+]      NS ns1.megacorpone.com 51.79.37.18
[+]      NS ns3.megacorpone.com 66.70.207.180
[*] Removing any duplicate NS server IP Addresses...
[*]  
[*] Trying NS server 66.70.207.180
[+] 66.70.207.180 Has port 53 TCP Open
[-] Zone Transfer Failed (Zone transfer error: REFUSED)
[*]  
[*] Trying NS server 51.79.37.18
[+] 51.79.37.18 Has port 53 TCP Open
[-] Zone Transfer Failed (Zone transfer error: REFUSED)
[*]  
[*] Trying NS server 51.222.39.63
[+] 51.222.39.63 Has port 53 TCP Open
[+] Zone Transfer was successful!!
[*]      NS ns1.megacorpone.com 51.79.37.18
[*]      NS ns2.megacorpone.com 51.222.39.63
[*]      NS ns3.megacorpone.com 66.70.207.180
[*]      TXT Try Harder
[*]      TXT google-site-verification=U7B_b0HNeBtY4qYGQZNsEYXfCJ32hMNV3GtC0wWq5pA
[*]      MX @.megacorpone.com fb.mail.gandi.net 217.70.178.216
[*]      MX @.megacorpone.com fb.mail.gandi.net 217.70.178.215
[*]      MX @.megacorpone.com fb.mail.gandi.net 217.70.178.217
[*]      MX @.megacorpone.com fb.mail.gandi.net 2001:4b98:dc4:8::217
[*]      MX @.megacorpone.com fb.mail.gandi.net 2001:4b98:dc4:8::216
[*]      MX @.megacorpone.com fb.mail.gandi.net 2001:4b98:dc4:8::215
[*]      MX @.megacorpone.com spool.mail.gandi.net 217.70.178.1
[*]      MX @.megacorpone.com spool.mail.gandi.net 2001:4b98:e00::1
[*]      A admin.megacorpone.com 51.222.169.208
[*]      A beta.megacorpone.com 51.222.169.209
[*]      A fs1.megacorpone.com 51.222.169.210
[*]      A intranet.megacorpone.com 51.222.169.211
[*]      A mail.megacorpone.com 51.222.169.212
[*]      A mail2.megacorpone.com 51.222.169.213
[*]      A ns1.megacorpone.com 51.79.37.18
[*]      A ns2.megacorpone.com 51.222.39.63
[*]      A ns3.megacorpone.com 66.70.207.180
[*]      A router.megacorpone.com 51.222.169.214
[*]      A siem.megacorpone.com 51.222.169.215
[*]      A snmp.megacorpone.com 51.222.169.216
[*]      A support.megacorpone.com 51.222.169.218
[*]      A syslog.megacorpone.com 51.222.169.217
[*]      A test.megacorpone.com 51.222.169.219
[*]      A vpn.megacorpone.com 51.222.169.220
[*]      A www.megacorpone.com 149.56.244.87
[*]      A www2.megacorpone.com 149.56.244.87

###########################################################
# DNSenum
# DNSEnum is DNS enumaration tool and it will show a diffrent output and let's try against the domain "zonetransfer.me" & this dnsenum is owned by Digininja194 and specifially allows zone transfers
──(kali㉿kali)-[~]
└─$ dnsenum zonetransfer.me
dnsenum VERSION:1.2.6

-----   zonetransfer.me   -----


Host's addresses:
__________________

zonetransfer.me.                         5        IN    A        5.196.105.14


Name Servers:
______________

nsztm2.digi.ninja.                       5        IN    A        34.225.33.2
nsztm1.digi.ninja.                       5        IN    A        81.4.108.41


Mail (MX) Servers:
___________________

ALT1.ASPMX.L.GOOGLE.COM.                 5        IN    A        142.250.157.26
ASPMX.L.GOOGLE.COM.                      5        IN    A        173.194.73.26
ASPMX3.GOOGLEMAIL.COM.                   5        IN    A        173.194.202.26
ASPMX4.GOOGLEMAIL.COM.                   5        IN    A        142.250.141.26
ASPMX2.GOOGLEMAIL.COM.                   5        IN    A        142.250.157.27
ASPMX5.GOOGLEMAIL.COM.                   5        IN    A        142.250.115.26
ALT2.ASPMX.L.GOOGLE.COM.                 5        IN    A        173.194.202.26

                                                                              
Trying Zone Transfers and getting Bind Versions:                              
_________________________________________________                             
                                                                              
                                                                              
Trying Zone Transfer for zonetransfer.me on nsztm2.digi.ninja ... 
zonetransfer.me.                         7200     IN    SOA               (
zonetransfer.me.                         300      IN    HINFO        "Casio
zonetransfer.me.                         301      IN    TXT               (
zonetransfer.me.                         7200     IN    MX                0
zonetransfer.me.                         7200     IN    MX               10
zonetransfer.me.                         7200     IN    MX               10
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    A        5.196.105.14
zonetransfer.me.                         7200     IN    NS       nsztm1.digi.ninja.
zonetransfer.me.                         7200     IN    NS       nsztm2.digi.ninja.
_acme-challenge.zonetransfer.me.         301      IN    TXT               (
_acme-challenge.zonetransfer.me.         301      IN    TXT               (
_sip._tcp.zonetransfer.me.               14000    IN    SRV               0
14.105.196.5.IN-ADDR.ARPA.zonetransfer.me. 7200     IN    PTR      www.zonetransfer.me.
asfdbauthdns.zonetransfer.me.            7900     IN    AFSDB             1
asfdbbox.zonetransfer.me.                7200     IN    A         127.0.0.1
asfdbvolume.zonetransfer.me.             7800     IN    AFSDB             1
canberra-office.zonetransfer.me.         7200     IN    A        202.14.81.230
cmdexec.zonetransfer.me.                 300      IN    TXT              ";
contact.zonetransfer.me.                 2592000  IN    TXT               (
dc-office.zonetransfer.me.               7200     IN    A        143.228.181.132
deadbeef.zonetransfer.me.                7201     IN    AAAA     dead:beaf::
dr.zonetransfer.me.                      300      IN    LOC              53
DZC.zonetransfer.me.                     7200     IN    TXT         AbCdEfG
email.zonetransfer.me.                   2222     IN    NAPTR             (
email.zonetransfer.me.                   7200     IN    A        74.125.206.26
Hello.zonetransfer.me.                   7200     IN    TXT             "Hi
home.zonetransfer.me.                    7200     IN    A         127.0.0.1
Info.zonetransfer.me.                    7200     IN    TXT               (
internal.zonetransfer.me.                300      IN    NS       intns1.zonetransfer.me.
internal.zonetransfer.me.                300      IN    NS       intns2.zonetransfer.me.
intns1.zonetransfer.me.                  300      IN    A        81.4.108.41
intns2.zonetransfer.me.                  300      IN    A        52.91.28.78
office.zonetransfer.me.                  7200     IN    A        4.23.39.254
ipv6actnow.org.zonetransfer.me.          7200     IN    AAAA     2001:67c:2e8:11::c100:1332
owa.zonetransfer.me.                     7200     IN    A        207.46.197.32
robinwood.zonetransfer.me.               302      IN    TXT          "Robin
rp.zonetransfer.me.                      321      IN    RP                (
sip.zonetransfer.me.                     3333     IN    NAPTR             (
sqli.zonetransfer.me.                    300      IN    TXT              "'
sshock.zonetransfer.me.                  7200     IN    TXT             "()
staging.zonetransfer.me.                 7200     IN    CNAME    www.sydneyoperahouse.com.
alltcpportsopen.firewall.test.zonetransfer.me. 301      IN    A         127.0.0.1
testing.zonetransfer.me.                 301      IN    CNAME    www.zonetransfer.me.
vpn.zonetransfer.me.                     4000     IN    A        174.36.59.154
www.zonetransfer.me.                     7200     IN    A        5.196.105.14
xss.zonetransfer.me.                     300      IN    TXT      "'><script>alert('Boo')</script>"

Trying Zone Transfer for zonetransfer.me on nsztm1.digi.ninja ... 
zonetransfer.me.                         7200     IN    SOA               (
zonetransfer.me.                         300      IN    HINFO        "Casio
zonetransfer.me.                         301      IN    TXT               (
zonetransfer.me.                         7200     IN    MX                0
zonetransfer.me.                         7200     IN    MX               10
zonetransfer.me.                         7200     IN    MX               10
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    MX               20
zonetransfer.me.                         7200     IN    A        5.196.105.14
zonetransfer.me.                         7200     IN    NS       nsztm1.digi.ninja.
zonetransfer.me.                         7200     IN    NS       nsztm2.digi.ninja.
_acme-challenge.zonetransfer.me.         301      IN    TXT               (
_sip._tcp.zonetransfer.me.               14000    IN    SRV               0
14.105.196.5.IN-ADDR.ARPA.zonetransfer.me. 7200     IN    PTR      www.zonetransfer.me.
asfdbauthdns.zonetransfer.me.            7900     IN    AFSDB             1
asfdbbox.zonetransfer.me.                7200     IN    A         127.0.0.1
asfdbvolume.zonetransfer.me.             7800     IN    AFSDB             1
canberra-office.zonetransfer.me.         7200     IN    A        202.14.81.230
cmdexec.zonetransfer.me.                 300      IN    TXT              ";
contact.zonetransfer.me.                 2592000  IN    TXT               (
dc-office.zonetransfer.me.               7200     IN    A        143.228.181.132
deadbeef.zonetransfer.me.                7201     IN    AAAA     dead:beaf::
dr.zonetransfer.me.                      300      IN    LOC              53
DZC.zonetransfer.me.                     7200     IN    TXT         AbCdEfG
email.zonetransfer.me.                   2222     IN    NAPTR             (
email.zonetransfer.me.                   7200     IN    A        74.125.206.26
Hello.zonetransfer.me.                   7200     IN    TXT             "Hi
home.zonetransfer.me.                    7200     IN    A         127.0.0.1
Info.zonetransfer.me.                    7200     IN    TXT               (
internal.zonetransfer.me.                300      IN    NS       intns1.zonetransfer.me.
internal.zonetransfer.me.                300      IN    NS       intns2.zonetransfer.me.
intns1.zonetransfer.me.                  300      IN    A        81.4.108.41
intns2.zonetransfer.me.                  300      IN    A        167.88.42.94
office.zonetransfer.me.                  7200     IN    A        4.23.39.254
ipv6actnow.org.zonetransfer.me.          7200     IN    AAAA     2001:67c:2e8:11::c100:1332
owa.zonetransfer.me.                     7200     IN    A        207.46.197.32
robinwood.zonetransfer.me.               302      IN    TXT          "Robin
rp.zonetransfer.me.                      321      IN    RP                (
sip.zonetransfer.me.                     3333     IN    NAPTR             (
sqli.zonetransfer.me.                    300      IN    TXT              "'
sshock.zonetransfer.me.                  7200     IN    TXT             "()
staging.zonetransfer.me.                 7200     IN    CNAME    www.sydneyoperahouse.com.
alltcpportsopen.firewall.test.zonetransfer.me. 301      IN    A         127.0.0.1
testing.zonetransfer.me.                 301      IN    CNAME    www.zonetransfer.me.
vpn.zonetransfer.me.                     4000     IN    A        174.36.59.154
www.zonetransfer.me.                     7200     IN    A        5.196.105.14
xss.zonetransfer.me.                     300      IN    TXT      "'><script>alert('Boo')</script>"

                                                                              
Brute forcing with /usr/share/dnsenum/dns.txt:                                
_______________________________________________                               
                                                                              
Brute forcing with /usr/share/dnsenum/dns.txt:                                
_______________________________________________                               
                                                                              
                                                                                                                              
zonetransfer.me class C netranges:                                            
___________________________________                                           
                                                                              
 4.23.39.0/24                                                                 
 5.196.105.0/24
 52.91.28.0/24
 74.125.206.0/24
 81.4.108.0/24
 143.228.181.0/24
 167.88.42.0/24
 174.36.59.0/24
 202.14.81.0/24
 207.46.197.0/24

                                                                              
Performing reverse lookup on 2560 ip addresses:                               
________________________________________________                              
                                                                            
                                                                              
^C                                                                            
                                                                              
# DNS record and nameserver both is different thing.

#####################################################################
### some exercises , small repeat ###

# Find the DNS servers for the megacorpone.com domain.
# this may "dnsrecon" easy way find out the megacorpone.com dns server (ns1, ns2 and 3), but if going to step by step as beginner, it will be complicated and at the result can not find the megacorpone(s) dns server. there is options like `$dig <domain_name>` or third options is kali linux tools `$dnsenum <domain-name>`
# like former command where already did so; $dnsrecon -d <domainName> -t axfr

┌──(kali㉿kali)-[~]
└─$ dnsrecon -d megacorpone.com        
[*] std: Performing General Enumeration against: megacorpone.com...
[-] DNSSEC is not configured for megacorpone.com
[*]      SOA ns1.megacorpone.com 51.79.37.18
[*]      NS ns3.megacorpone.com 66.70.207.180
[*]      Bind Version for 66.70.207.180 "9.11.5-P4-5.1+deb10u2-Debian"
[*]      NS ns2.megacorpone.com 51.222.39.63
[*]      Bind Version for 51.222.39.63 "9.11.5-P4-5.1+deb10u2-Debian"
[*]      NS ns1.megacorpone.com 51.79.37.18
[*]      Bind Version for 51.79.37.18 "9.11.5-P4-5.1+deb10u2-Debian"
[*]      MX spool.mail.gandi.net 217.70.178.1
[*]      MX mail2.megacorpone.com 51.222.169.213
[*]      MX fb.mail.gandi.net 217.70.178.216
[*]      MX fb.mail.gandi.net 217.70.178.217
[*]      MX fb.mail.gandi.net 217.70.178.215
[*]      MX mail.megacorpone.com 51.222.169.212
[*]      MX spool.mail.gandi.net 2001:4b98:e00::1
[*]      MX fb.mail.gandi.net 2001:4b98:dc4:8::217
[*]      MX fb.mail.gandi.net 2001:4b98:dc4:8::215
[*]      MX fb.mail.gandi.net 2001:4b98:dc4:8::216
[*]      TXT megacorpone.com google-site-verification=U7B_b0HNeBtY4qYGQZNsEYXfCJ32hMNV3GtC0wWq5pA
[*]      TXT megacorpone.com Try Harder
[*] Enumerating SRV Records
[+] 0 Records Found

##############
┌──(kali㉿kali)-[~/Downloads]
└─$ dnsrecon -d megacorpone.com -D ~/list.txt -t brt 
[*] Using the dictionary file: /home/kali/list.txt (provided by user)
[*] brt: Performing host and subdomain brute force against megacorpone.com...
[+]      A www.megacorpone.com 149.56.244.87
[+]      A mail.megacorpone.com 51.222.169.212
[+]      A router.megacorpone.com 51.222.169.214
[+] 3 Records Found
                    
