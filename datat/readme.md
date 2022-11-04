# Erilliset datat

Tähän tulee erilliset datat, josta tiedetään kuinka yhteys toimii ja mitä protokollia on olemassa, että mitä niiden eroja ja yhteis tekijöitä on olemassa. Osat näiden protokollista kirjoitettaan luetaan monipuoliisiin teorioihin/kirjojen mukaan, mutta mahdollista on samoja tekijöitä ja tekstin kirjoitus on melko sama methodi.

- [TCP](#TCP)
- [UDP](#UDP)
  * [NTP](#NTP)
- [UDP ja TCP erot](#UDP-ja-TCP-erot)
- [DNS](#DNS)

## TCP

Transmission Control Protocol (TCP) - tietoliikenneprotokolla, mikä tunnettaan parhaiten tietokoneiden välisen tiedonsiirtoa. Tiedostoja voi olla monipuolisia kuten dokumentti, data tai muu tiedosto, että käytetään sovellusta tai muu tiedonsiirto työkalua kuten sähköposti, pilvipalvelua, teams tai muu yhteys väline, jotta saadaan lähettäjä lähetettyä paketin vastaanottajalle. 

<img src="images/data-tcp-1.PNG" width="475">

Protokolla huolehtii, että kyseinen tiedosto paketti pääse perille vastanottajalle, mutta mikäli jos tiedosto hävii voidaan lähettää uudestaan tai mahdollista olla vioittunut tiedosto. Luottamisen ja vakaan toteutuu kolmella tavalla (acknowledgements, sequencing, checksum) , mikä ikään kuin luoo luotettavan yhteyden. TCP tekee käyttämällä ns. kolmisuuntaisen kättelyn.

Esim. alemman kuvan mukaan, jossa lähettäjä tietokne lähettää viestin mikä on nimeltään <ins> SYN </ins>, lyhennestä synchronize. Myös vastaavasi kone/serveri vastaanottaa <ins> ack </ins> tai <ins> syn+ack </ins> palvelin vastaa lähetäjän pyynnön viestin tai kuin kuittaa lähettäjälle.

<img src="images/data-tcp-2.PNG" width="400">

<img src="images/data-tcp-3.PNG" width="375">


## UDP

User Datagram Protocol (UDP)

UDP:ssä ei ole  mitään TCP:n virheiden käsittelystä, sekvensointia tai luotettavuutta. UDP:ssa lähettää jatkuvasti dataa kohti serverille/vastaanottajalle ikään kuin toistuvasti ettei välitä niiden sisäisen datojen luotettavuutta, ja joskus saattaa olla epäluotettava. TCP tarjoaa eriomaisen yhteyden ja lutettavuuden, kaikeall on resurssien ja viiveen hintaa. Tämä esim. sopisi verkojen selailuun, tiedostojen siirtoon ja jne, joissa ei välitä viiveongelmasta vastineeksi vakaasta yhteydestä. UDP:stä on hyötyä tilanteissa, jossa tarvitaa reaaliaikaisen yhteyden kuten ääni- tai videpuhelut, suoratoistot tai muu suora pelaamiset reaaliaikaisen yhteyden. Näissä ei ole varaa latenssiin näihin tilassa, josta ei voi käsitellä äänidatan katoamista kuten äänipuhelun tärinä. 

<img src="images/data-udp-1.PNG" width="350">

### NTP
Network Time Protocol (NTP) , joka on UDP pohjainenn protokolla täsmällisen aikatiedon välittämisen tietokoneiden välillä. Protokolla on suunniteltu ottamaan huomioon verkojen muuttuvia viiveitä, että toimivuudessa ja useiden palvelimen kellojen aikojen tahtia, että asiakas-palvelin käytöä.  

<img src="images/data-ntp-1.PNG" width="450">

## UDP ja TCP erot

<img src="images/data-tcp-upd-1.PNG" width="650">

<img src="images/data-tcp-udp-2.PNG" width="500">


# DNS

Domain Name System (DNS), mikä tunnetaan parhaiten nimipalvleujärjestelmä, mikä muuntaa verkotunnusta IP-osoitteeksi esim. Google DNS IP-osoite ovat 8.8.8.8 ja 8.8.4.4








