# passiivisien tiedon keräämiset ulkopuolelle ja tutkitaan tekniikoita, joihin liittyy suoraan vuorovaikutusta kohdepalvelujen kanssa (target services)
# Tarkistamisessa on lukemattomia palveluita, joihin voidaan kohdistaa

# tässä sisältyy Active Directory, ja erillisiä moduulia (module). Yleisimpiä aktiivisia tiedonkeräämisen tekniikassa on mm. lukien porttien skannaus ja DNS, SMB, NFS- SMTP JA SNMP -luettelot

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

┌──(kali㉿kali)-[~]
└─$  for ip in $(seq 50 100); do host 38.100.193.$ip; done | grep -v "not fou
nd"
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


# some former command notice maybe couple or multiple DNS server serve the megacorpone.com domains ns1, ns2, and ns3 (for loop command). Let's try a zone transfer again each one of the megacorpone.com 














