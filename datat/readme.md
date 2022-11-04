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

TCP toimittaa tiedonsiirron PAR (Positive Acknowledgement with Re-transmission) kanssa. PDU (Protocol Data Unit) kutsutaan segmentiksi, ja PAR:ia käyttävä laite lähettää datayksikön uudelleen, kunnes se vastaanottaa kuittauksen. Jos vastaanottimen päässä vastanotettu tietoyksikkö on varioittunut niin se hylkää segmentimen. Koska tarkistamisen ajalla tarkistaa tiedon virheentunnustuksen käytetyn siirtokeskustaa tarkistus summa toiminnan. Lähettäjä on periatteessa lähettävä uudelleen tietoyksikkön, jolle ei saada positiivista kuittausta.

<img src="images/data-tcp-3.PNG" width="375">

Ylemässä kuvassa tulostuu kolme vaihdetta, että kuin lähettäjä lähettää datan vastaanottajalle/palvelimelle.

1. Ensimmäisenä lähettäjä lähettää datan/viestin kohti yhteyden palvelimeen, josta tämä muodostuu segmenti SYN (Synchronize Sequence Number), joka ilmoittaa palvelimelle, ja asiakas/käyttäjä on mahdollista aloittanut viestinnän ja millä järjesteysnumerolla se alkaa.
2. SYN + ACK , tarkoittaa palvelin vastaa lähettäjälle/käytäjälle pyyntä asettamalla SYN-ACK-signaali bittit. Acknowledgement (ACK) tarkoitaa sen vastaanottaman segmentin vastausta ja SYN tarkoitaa millä järjestysnumerolla se todennäköisesti aloittaa segmentin.
3. ACK - viimeisessä osassa käyttäjä/asiakas kuittaa palvelimen vastauksen ja molemmat ovat muodostanneet luotettavan yhteyeden ja ne aloittavat lähettää varsinaisia tiedonsiirtoja.

## UDP

User Datagram Protocol (UDP)

UDP:ssä ei ole  mitään TCP:n virheiden käsittleyä, sekvensointia tai luotettavuutta. UDP:ssa lähettää jatkuvasti dataa eteenpäin kohti serverille/vastaanottajalle ikään kuin toistuvasti ettei välitä niiden sisäisen datojen luotettavuutta, ja joskus saattaa olla epäluotettava. TCP tarjoaa eriomaisen yhteyden ja lutettavuuden, kaikeall on resurssien ja viiveen hintaa. Tämä esim. sopisi verkojen selailuun, tiedostojen siirtoon ja jne, joissa ei välitä viiveongelmasta vastineeksi vakaasta yhteydestä. UDP:stä on hyötyä tilanteissa, jossa tarvitaa reaaliaikaisen yhteyden kuten ääni- tai videpuhelut, suoratoistot tai muu suora pelaamiset reaaliaikaisen yhteyden. Näissä ei ole varaa latenssiin näihin tilassa, josta ei voi käsitellä äänidatan katoamista kuten äänipuhelun tärinä. 

UDP on erillinen/yhteydetön protokolla, koska se ei muodosta tiedonsiirron yhteytttä lähettäjän ja vastaanottajan välillä, ja siksi data ei välttämättä saavu perille ja UDP:ssa data liikkuu nopeammin kuin TCP:n käytettäessä.

<img src="images/data-udp-1.PNG" width="350">

### NTP
Network Time Protocol (NTP) , joka on UDP pohjainenn protokolla täsmällisen aikatiedon välittämisen tietokoneiden välillä. Protokolla on suunniteltu ottamaan huomioon verkojen muuttuvia viiveitä, että toimivuudessa ja useiden palvelimen kellojen aikojen tahtia, että asiakas-palvelin käytöä.  

<img src="images/data-ntp-1.PNG" width="450">

## UDP ja TCP erot

UDP ja TCP ovat protokollia, mutta mikä niiden erossa on? TCP on yhteyspohjainen ja UDP yhteydetön, sekä molemmissa on hyvät ja huonot puolensa. TCP on turvallisempi ja UDP on nopeampi.

Virheiden prosessien havaitsemisessa, jossa TCP lähettää ja järjestää lähetettyjen paketti tiedostoja uudestaan, myös saappuvia paketteja, ja voi tuoda TCP latenssia. Esim. UDP ympärissä reaaliaikaisen sovelluksen Voice over IP (VoIP), suorantoisto ja pelit, missä käyttävät siirtoprosessia, koska se vähentää latenssia ja värinää jättämällä järjestelmättä paketteja tai lähettämällä uudestaan puuttuvia tietoja. 

UDP luokitellaan datagrammi protokollaksi tai yhteydettömäksi protokollaksi, koska sillä ei ole mitään keinoa havaita, ovatko molemmat sovellukset lopettaneet edestakaisen viestinnän. Virheellisten datapakettien korjaamisen sijaan, kuten TCP tekee, UDP hylkää nämä paketit ja siirtää sovelluskerrokseen yksityiskohtaisempaa virheiden havaitsemista varten.

UDP-datagrammin otsikko sisältää paljon vähemmän tietoa kuin TCP-segmentin otsikko. UDP-otsikko käy läpi myös paljon vähemmän käsittelyä kuljetuskerroksessa pienennetyn latenssin vuoksi. Datan lähettyksessä hoitaa ilman ainutlaatuisia tunnuksia tai numero järjestyksiä. UDP ei tarjoa mitään virheiden korjausta, eikä kadonneita paketeita, ja käytettäessä sattuu helpommin virheitä, mutta se lähettää nopeammin kuin TCP.

Molemmissa jakautuvat datat pienempiin yksikköihin eli datapaketi, missä sisältävät lähettäjän ja vastaanottajan IP-osoite, erilaisia konfiguraatiota, sisäisen lähettämän tiedon ja ilmiottaa mihin paketti päättyy (A--->B:lle)

Turvallisuudessa UDP:tä on mahdototna pysyttää palomuuria, joka mahdollistaisi vain tietyn UDP-viestinnän ja estää loput, eli eivät suojaa täysin verrattuna TCP on helpompi suojata. Käyttäjä voi hyödyntää välityspalvelinta eli proxy:ä tiettyjen sovellusten käyttöä tai luoda tunneliyhteyden (tunneloiva yhteys) etäkäyttäjän ja yrityksen sisäisen verkon välille.

<img src="images/data-tcp-upd-1.PNG" width="650">

<img src="images/data-tcp-udp-2.PNG" width="500">

Käyttöstä riippuu mihin käyttö tarkoitukseen olla käytössä, että jos tarvitsee nopea ja sujuvaa tiedonsiirtoa, joten käyttämä sovellus tai palvelu toimii kunnoolla joten UDP. Sama TCP on staatinen/muuttumaton ja luotettava protokolla, jota käytteässä data saapuu perille vastaanottajan luokse.

# DNS

Domain Name System (DNS), mikä tunnetaan parhaiten nimipalvleujärjestelmä, mikä muuntaa verkotunnusta IP-osoitteeksi esim. Google DNS IP-osoite ovat 8.8.8.8 ja 8.8.4.4




