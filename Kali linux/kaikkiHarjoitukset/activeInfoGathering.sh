# passiivisien tiedon keräämiset ulkopuolelle ja tutkitaan tekniikoita, joihin liittyy suoraan vuorovaikutusta kohdepalvelujen kanssa (target services)
# Tarkistamisessa on lukemattomia palveluita, joihin voidaan kohdistaa

# tässä sisältyy Active Directory, ja erillisiä moduulia (module). Yleisimpiä aktiivisia tiedonkeräämisen tekniikassa on mm. lukien porttien skannaus ja DNS, SMB, NFS- SMTP JA SNMP -luettelot

##############
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












