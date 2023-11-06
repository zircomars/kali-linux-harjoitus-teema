# avoimien verkkojen resurssien ja muita passiivisien tiedon keruu tekniikkaa, jotta voidaan kerätä lisää oleellisia tietoja muista, tarkemmista palveluista.

# DNS on usein tuottoisin lähde (source) aktiivisiin tiedonkeruulle. DNS periaatteessa tarjoaa erilaisia tietoja julkisia ja miks ei yksityisissä, jossa organisaation palvelimista kuten on IP-osoite, palvelin serverin nimi ja palvelin funktionaali (toimintoja)

# DNS palvelin yleensä paljastavat DNS- ja sähköpostipalvelimien tietoja verkkotunnuksista (domain), johon sillä on valtanssa. Tämä on välttämätöntä, koska julkiset sähköposti- ja DNS-palvelinosoitteiden pyynnöt muodostavat Internetin peruskokemuksen. 

# Tarkastellaan esimerkiksi megacorpone.com-verkkotunnusta, väärennettyä Internet-näkyvyyttä, jonka rakensimme tätä harjoitusta varten. 

# Käytämme isäntäkomentoa yhdessä parametrin –t (type) kanssa löytääksemme sekä DNS- että sähköpostipalvelimet megacorpone.com-verkkotunnukselle

# Oletusarvoisesti jokaisessa määritetyssä toimialueessa on oltava vähintään toimialueesta vastaavat DNS- ja sähköpostipalvelimet.

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

# automating Lookups










