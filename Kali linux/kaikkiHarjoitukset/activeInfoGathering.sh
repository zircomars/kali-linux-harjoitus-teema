# passiivisien tiedon keräämiset ulkopuolelle ja tutkitaan tekniikoita, joihin liittyy suoraan vuorovaikutusta kohdepalvelujen kanssa (target services)
# Tarkistamisessa on lukemattomia palveluita, joihin voidaan kohdistaa

# tässä sisältyy Active Directory, ja erillisiä moduulia (module). Yleisimpiä aktiivisia tiedonkeräämisen tekniikassa on mm. lukien porttien skannaus ja DNS, SMB, NFS- SMTP JA SNMP -luettelot

##############
# DNS Enumeration
# DNS = (domain name system), on yksi internetin kriittisimmistä järjestelmistä, ja se on hajautettu tietokantaanm joka vastaa käyttäjäystävällisten verkkotunnusten kääntämisestä IP-osoitteeksi.

# esim. www.megacorpone.com - jos otettaan sitä esim. ja tarkistellaan sitä hierarkkin rakennetta.
# Hostname , johon syötettään usein selaimeen ja/tai muuhun sovellukseen. Selain välittää hostname käyttöjärjestelmän DNS-asiakkaalle ja käyttöjärjestelmä lähettää sen eteenpäin pyynnöstä ulkoiselle DNS-palvelimelle, joihin se on määritetty käyttämään. Joten tämä on se ketjun ensimmäinen palvelin tunnettun nimellä DNS-recursor , ja se vastaa vuorovaikutusta DNS-infrastruktuurin kanssa ja tulosten palauttamisesta DNS-asiakkaalle.


