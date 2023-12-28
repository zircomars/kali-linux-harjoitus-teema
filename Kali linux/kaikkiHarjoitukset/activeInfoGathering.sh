# passiivisien tiedon keräämiset ulkopuolelle ja tutkitaan tekniikoita, joihin liittyy suoraan vuorovaikutusta kohdepalvelujen kanssa (target services)
# Tarkistamisessa on lukemattomia palveluita, joihin voidaan kohdistaa

# tässä sisältyy Active Directory, ja erillisiä moduulia (module). Yleisimpiä aktiivisia tiedonkeräämisen tekniikassa on mm. lukien porttien skannaus ja DNS, SMB, NFS- SMTP JA SNMP -luettelot

################################
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

############################################################
# Interacting with a DNS server(s)
# jokaisessa domain:issa voi käyttää eri tyyppistä DNS record:ia. Yleisimpiä DNS-recordia ovat mm..

# - NS - nameserver records - sisältyvät toimialueen DNS record domain:ia valtuutettujen palvelimien nimiä
# - A -tunnettaan myös host record (record), sisältää hostname IP-osoitteen hostnimi (kuten www.megacorpone.com)
# - MX - mail exchange record, sisältyvät toimialueen sähköpostien käsittelystä vastaavien palvelimien domaini. Domain voi sisältää useita MX-record:ia.
# - PTR - pointer records , joka käytetään käänteishaun (lookup zones) ja niitä käytetään IP-osoitteeseen liittyviä record:in etsimistä.
# - CNAME - canonical name records , joka käytetään aliaksen luomisessa toisen/muihin host record:iin
# - TXT - text records, voi sisältää mitä tahansa mielivaltaisia tietoja ja niitä voidaan käyttää eri tarkoituksiinsa, kuten domain (verkkotunnusten) omistajuuden vahvistamista.

# pieni demo (start here) ja kokeillaan esim. tätä linkkiä (host) www.megacorpone.com

# tätä voi testata ilman www 
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

########################################################
# Automating Lookups

# lisää DNS kysellyä ja löydetäkseen samoja hostname, ja IP-osoiteittaa, johon kuuluviin sama domain, ja seuraavaksi tarkistellaan domainin web server.
└─$ host www.megacorpone.com
www.megacorpone.com has address 149.56.244.87


# idontexist - tarkistellaan sen serveriä
┌──(kali㉿kali)-[~]
└─$ host idontexist.megacorpone.com
Host idontexist.megacorpone.com not found: 3(NXDOMAIN)


########################################################

# Forward Lookup Brute Force

# Brute force on trial-and-error tekniikka, joka pyrki löydetäkseen informaatiota, mukaan lukin webserver hakemistot, käyttäjätunnus ja salsayhdistelmiä tai kelvollisisa DNS-record:ia. Käyttämällä sanaluetteloa (wordlist), joka sisältyy yleisiä hostname, johon voidaan yrittää arvata DNS-record:in ja tarkistaa vastauksia kelvollisia hostname:ä varalta.















