# avoimien verkkojen resurssien ja muita passiivisien tiedon keruu tekniikkaa, jotta voidaan kerätä lisää oleellisia tietoja muista, tarkemmista palveluista.

# DNS on usein tuottoisin lähde (source) aktiivisiin tiedonkeruulle. DNS periaatteessa tarjoaa erilaisia tietoja julkisia ja miks ei yksityisissä, jossa organisaation palvelimista kuten on IP-osoite, palvelin serverin nimi ja palvelin funktionaali (toimintoja)

# DNS palvelin yleensä paljastavat DNS- ja sähköpostipalvelimien tietoja verkkotunnuksista (domain), johon sillä on valtanssa. Tämä on välttämätöntä, koska julkiset sähköposti- ja DNS-palvelinosoitteiden pyynnöt muodostavat Internetin peruskokemuksen. 

# Tarkastellaan esimerkiksi megacorpone.com-verkkotunnusta, väärennettyä Internet-näkyvyyttä, jonka rakensimme tätä harjoitusta varten. 

# Käytämme isäntäkomentoa yhdessä parametrin –t (type) kanssa löytääksemme sekä DNS- että sähköpostipalvelimet megacorpone.com-verkkotunnukselle

# Oletusarvoisesti jokaisessa määritetyssä toimialueessa on oltava vähintään toimialueesta vastaavat DNS- ja sähköpostipalvelimet.

########################################################################
┌──(kali㉿kali)-[~]
└─$ host -t ns megacorpone.com
megacorpone.com name server ns3.megacorpone.com.
megacorpone.com name server ns1.megacorpone.com.
megacorpone.com name server ns2.megacorpone.com.
                                                                                                                                        
┌──(kali㉿kali)-[~]
└─$ 
                                                                                                                                        
┌──(kali㉿kali)-[~]
└─$ host -t mx megacorpone.com
megacorpone.com mail is handled by 60 mail2.megacorpone.com.
megacorpone.com mail is handled by 50 mail.megacorpone.com.
megacorpone.com mail is handled by 20 spool.mail.gandi.net.
megacorpone.com mail is handled by 10 fb.mail.gandi.net.

########################################################################
# automating Lookups

# kun on tiedossa jokin alustava tieto vaikappa megacorpone.com - domain (verkkotunnus) nimi, niin voidaan jatkaa DNS - requestiä (lisäkyselyä) käyttöön löydetäkseen sen tämän sivuston megacorpone - domain tunnus kuuluviin host:in nimi ja IP-osoite. 

# periaatteessa: For example, we can assume that the megacorpone.com domain has a web server, probably with the hostname www. We can test this theory using the host command once again:

┌──(kali㉿kali)-[~]
└─$ host www.megacorpone.com  
www.megacorpone.com has address 149.56.244.87
                                                                                                                                                            
##########
# seuraavaksi, jos tarkistellaan onko tällä domain (megacorpone.com) sillä on myös palvelin, jonka isäntänimi on idontexist.
# Huomaa ero kyselytulosteiden välillä

┌──(kali㉿kali)-[~]
└─$ host idontexist.megacorpone.com
Host idontexist.megacorpone.com not found: 3(NXDOMAIN)


########################################################################
# forward lookup brute force

# edellisessä harjoituksessa eli (automating lookups), ja nyt tähän lisätään yleisiä host nimejä, johon suoritettaan Bash scriptaus. 

# Tämän tekniikan ideana on arvata palvelimien kelvollisen nimet yrittämällä ratkaista annettu nimi. Jos arvaamasi nimi ratkaisee, tulokset saattavat viitata palvelimen olemassaoloon ja jopa toimivuuteen. Voimme luoda lyhyen (tai pitkän) luettelon mahdollisista isäntänimistä ja kokeilla kutakin host:in komentoa.

# ensimmäisenä toistettaan "www" tonne list.txt sisään , ja sitten sama noi muutkin tulee 
──(kali㉿kali)-[~]
└─$ echo www > list.txt
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo ftp >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo mail >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo owa >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo proxy >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo router >> list.txt 

# jos tarkistettaan list.txt                                                                                   
┌──(kali㉿kali)-[~]
└─$ cat list.txt
www
ftp
mail
owa
proxy
router

# lisäksi tuohon listaan voisi lisätä kaikki protokollat eli tärkeimmistä TCP/UDP protokollat, ja ehkä mahdollista toimiakin mm. lisäisi http 80, https 443, ja jne, mutta tietty protokollat kuitenkin pitää tarkista mitä lisätään list.txt alle, google ja wikipedia on paras haku työkalu & ja ottaa muilta github tekijältä vähä esimerkkiä mallia

#### step 2
# In this simplified example, we notice that the hostnames www, router, and mail have been discovered through this brute-force attack. The hostnames owa, ftp and proxy, however, were not found.

# tässä periaatteessa for looppin kautta, että käytettän list.txt sisäisiä objektia, että tarkistellaan tämän domain.com (megacorpone.com) verkkotunnus prosessi
# eli tässä tarkistettiin host nimi, www, routeri ja sähköposti, jotka löydettiin näiden raa'an voiman hyökkäyksen avulla, joten host nimet owa, ftp ja proxy, niistä ei löytynyt mitään tietoa
# NXDOMAIN - saattaa tarkoittaa ettei sillä löydy mitään jos tarkistellaan muita esimerkkejä
┌──(kali㉿kali)-[~]
└─$ for ip in $(cat list.txt);do host $ip.megacorpone.com;done
www.megacorpone.com has address 149.56.244.87
;; communications error to 192.168.153.2#53: timed out
Host ftp.megacorpone.com not found: 3(NXDOMAIN)
mail.megacorpone.com has address 51.222.169.212
Host owa.megacorpone.com not found: 3(NXDOMAIN)
Host proxy.megacorpone.com not found: 3(NXDOMAIN)
router.megacorpone.com has address 51.222.169.214






