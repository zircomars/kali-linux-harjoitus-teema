# Erilliset datat

Tähän tulee erilliset datat, josta tiedetään kuinka yhteys toimii ja mitä protokollia on olemassa, että mitä niiden eroja ja yhteis tekijöitä on olemassa. Osat näiden protokollista kirjoitettaan luetaan monipuoliisiin teorioihin/kirjojen mukaan, mutta mahdollista on samoja tekijöitä ja tekstin kirjoitus on melko sama methodi.

- [TCP](#TCP)
- [UDP](#UDP)
  * [UDP ja TCP erot](#UDP-ja-TCP-erot)
  * [NTP](#NTP)
- [DNS](#DNS)

<!-- HUOM! noista datojen tekijöistä voisi kirjoittaa 
DATA X-nimi
- mikä se on
- mitä se tekee / mihin käyttö tarkoitukseen sitä käytettään - esimerkkiä sovelluksista tai laiteesta
- sitten jotakin fysiikkaa paskaa, lukuja ja jne.
- hyvät ja huonot puolet
- turvallisuus ja riskit
- muita tai yhteistä tekijöitä..
-->

<!-- TCP START HERE -->
# TCP

Transmission Control Protocol (TCP) - tietoliikenneprotokolla, mikä tunnettaan parhaiten tietokoneiden lähettäjän ja vastaanottajan välisen tiedonsiirto yhteys. Tiedostoja voi olla monipuolisia kuten dokumentti, data tai muu tiedosto, että käytetään sovellusta tai muu tiedonsiirto työkalua kuten sähköpostit, pilvipalvelua, teams tai muu yhteys väline, jotta saadaan lähettäjän lähetettyä viesti paketin vastaanottajalle. Myös koskee, kun käyttäjä käy luotettavan verkkosivulla.

Tiedostojen siirtämisessä käytettään ja varmistettaan turvallisuutta, kun tiedostojen siirto tapahtuu käyttäjien ja palvelimen väliltä. Se takaa verkon kautta, että lähetettävien tietojen eheyksiä niiden määrästä riippumatta. Tämän takia tietojen lähettämisestä pitää olla korkea tason protokolla, jotta edelyttävät kaiken lähetetyjen tiedon saapumista. Esim. korkeita protokollia on SSH (Secure Shell), FTP (File transfer protocol), SMTP (Simple main transfer protocol), POP (post office protocol) ja HTTP.

TCP header (kehys) taulukko <br>
| <img src="images/data-tcp-1.PNG" width="450"> | Tärkeät kohdat: <br> - <b>Source port:</b> lähteenprosessien käyttäm portin numero <br> - <b>Destination port: </b> kohdeprosessien käyttämä numeroportti<br> - <b>järjestysnumero: </b> nykyisen segementien sijainti viestissä <br> - <b>Kuittausnumero:</b> seuraava jäjrjestysnumero <br> - <b>ikkuna/window: </b> määrittää saapuville tiedoille käytettävissä oleva puskurin koon <br> - <b>checksum / tarkistussumma: </b> virheiden tarkistus <br>| 
| ------ | ----- |

Sovellustiedot kapseloituvat sovelluskerrokseen (application layer), ja tuloksena PDU (Protocol data unit) välittää TCP:lle, joka lisää oman kehyksen kerroksen luodakseen TCP-protokollan tietoyksikön, mitä kutsutaan <ins> segmentiksi. </ins> TCP:n kehys sisältää tarkistussummia (checksum), ja järjestysnumeroita (sequence number), jos viesti koostuu useammasta kuin yhdestä segmentistä. 

Kun yhteys muodostuu, TCP välittää jokaisen segmentin IP-protokolle, joka pakkaa niitä datagrammeiksi jatkolähetykseen varten. Lähde- ja kohdeosoite, protokolla tunniste ja segmentin pituus välitetään myös Internet-protokolalle parametreina 96-bittisenä pseudokehykseen (pseudoheader), ja pseudokehys ei itse osaa segemnttiä. Tarkistussumma lasketaan käyttämällä segmentin ja pseudokehyksen sisältöä yhteenvetona. Kohdelaitteessa TCP-ohjelmisto kokoaa alkuperäisen viestin uudelleen käyttämällä kutakin segmentin sisältämiä järjestysnumeroita ja mahdollista pyyttää puuttuvia tai vaurioituneita segmenttejä uudelleen lähetykseen. Minkä tahansa oikea vastaanoteu segmentit kuittavat, ja jokaisen kuittauksen jälkeen sisältää yhden tai useamman segmentin järjestysnumeron.

End-to-end principle <br>
<img src="images/data-tcp-04.PNG" width="525">

Protokolla huolehtii, että kyseinen tiedosto paketti pääse perille vastanottajalle, mutta mikäli jos tiedosto häviää niin voidaan lähettää uudestaan tai mahdollista olla vioittunut tiedosto. Uudelleen lähettämisessa TCP varmistaa luotettavan viestintäjärjestelmän. Paketin häviämisessä voi mahdollista olla verkon ruuhkaus, mitä aiheuttaa paketin tiedoston häviämistä. Luottamisen ja vakaan toteutuu kolmella tavalla (acknowledgements, sequencing, checksum), mikä ikään kuin luoo luotettavan yhteyden. TCP tekee käyttämällä ns. kolmisuuntaisen kättelyn.

Esim. alemman kuvan mukaan, jossa lähettäjä tietokoneesta lähettää viestin mikä siirto on nimeltään <ins> SYN </ins> synchronize. Myös vastaavasi kone/serveri vastaanottaa <ins> ack </ins> tai <ins> syn+ack </ins> palvelin vastaa lähetäjän pyynnön viestin tai kuin kuittaa lähettäjälle.

<img src="images/data-tcp-2.PNG" width="400">

TCP toimittaa tiedonsiirron PAR (Positive Acknowledgement with Re-transmission) kanssa. PDU (Protocol Data Unit) kutsutaan segmentiksi, ja PAR:ia käyttävä laite lähettää datayksikön uudelleen, kunnes se vastaanottaa kuittauksen. Jos vastaanottimen päässä vastanotettu tietoyksikkö on varioittunut niin se hylkää segmentimen. Koska tarkistamisen ajalla tarkistaa tiedon virheentunnustuksen käytetyn siirtokeskustaa tarkistus summa toiminnan. Lähettäjä on periatteessa lähettävä uudelleen tietoyksikkön, jolle ei saada positiivista kuittausta.

<img src="images/data-tcp-3.PNG" width="400">

Ylemässä kuvassa tulostuu kolme vaihdetta, että kuin lähettäjä lähettää datan vastaanottajalle/palvelimelle.

1. Ensimmäisenä lähettäjä lähettää datan/viestin kohti yhteyden palvelimeen, josta tämä muodostuu segmenti SYN (Synchronize Sequence Number), joka ilmoittaa palvelimelle, ja asiakas/käyttäjä on mahdollista aloittanut viestinnän ja millä järjesteysnumerolla se alkaa.
2. SYN + ACK , tarkoittaa palvelin vastaa lähettäjälle/käytäjälle pyyntä asettamalla SYN-ACK-signaali bittit. Acknowledgement (ACK) tarkoitaa sen vastaanottaman segmentin vastausta ja SYN tarkoitaa millä järjestysnumerolla se todennäköisesti aloittaa segmentin.
3. ACK - viimeisessä osassa käyttäjä/asiakas kuittaa palvelimen vastauksen ja molemmat ovat muodostanneet luotettavan yhteyeden ja ne aloittavat lähettää varsinaisia tiedonsiirtoja.

<!-- UDP START HERE -->
# UDP

User Datagram Protocol (UDP)

UDP:ssä ei ole mitään TCP:n virheiden käsittelyä, sekvensointia tai luotettavuutta. UDP:ssa lähettää dataa eteenpäin jatkuvasti kohti serverille/vastaanottajalle ikään kuin toistuvasti ettei välitä niiden sisäisen datojen luotettavuutta/turvallisuutta, ja joskus saattaa olla epäluotettava/epäilys. TCP tarjoaa eriomaisen yhteyden ja luotettavuuden, kaikealle on resurssien ja viiveen hintaan. Tämä esim. sopisi verkojen selailuun, tiedostojen siirtoon ja jne, joissa ei välitä viiveongelmasta vastineeksi vakaasta yhteydestä. 

UDP:stä on hyötyä tilanteesta, jossa tarvitaa reaaliaikaisen yhteyden kuten ääni- tai videopuhelut (palaverit / VoIP), suoratoistot kuten pelamisen (Twitch / Discord) yhteyden, suoratoistoiset mediat/lähetykset (uutiset, urheilut, muu kanavat esim. youtube live), jossa jokaisen millisekunnissa on tärkeitä infoja. Näissä ei ole varaa latenssiin (latency) näihin tilassa, josta ei voi käsitellä äänidatan katoamista kuten äänipuhelun tärinä, myös ei vaadi yhteyttä eikä se lähetä datapaketteja uudestaan.

UDP on erillinen/yhteydetön protokolla, koska se ei muodosta tiedonsiirron yhteytttä lähettäjän ja vastaanottajan välillä, ja siksi data ei välttämättä saavu perille, ja UDP:ssa data liikkuu nopeammin kuin TCP:n käytettäessä.

UDP header (kehys) taulukko <br>
<img src="images/data-udp-1.PNG" width="350">

<!-- UDP JA TCP EROT START HERE -->
## UDP ja TCP erot

UDP ja TCP ovat protokollia, mutta mikä niiden erossa on? TCP on yhteyspohjainen ja UDP yhteydetön, sekä molemmissa on hyvät ja huonot puolensa. TCP on turvallisempi ja UDP on nopeampi.

Virheiden prosessien havaitsemisessa, jossa TCP lähettää ja järjestää lähetettyjen paketti tiedostoja uudestaan, myös saappuvia paketteja, ja voi tuoda TCP latenssia. Esim. UDP ympärissä reaaliaikaisen sovelluksen Voice over IP (VoIP), suorantoisto ja pelit, missä käyttävät siirtoprosessia, koska se vähentää latenssia ja värinää jättämällä järjestelmättä paketteja tai lähettämällä uudestaan puuttuvia tietoja. 

UDP luokitellaan datagrammi protokollaksi tai yhteydettömäksi protokollaksi, koska sillä ei ole mitään keinoa havaita, ovatko molemmat sovellukset lopettaneet edestakaisen viestinnän. Virheellisten datapakettien korjaamisen sijaan, kuten TCP tekee, UDP hylkää nämä paketit ja siirtää sovelluskerrokseen yksityiskohtaisempaa virheiden havaitsemista varten.

UDP-datagrammin otsikko sisältää paljon vähemmän tietoa kuin TCP-segmentin otsikko. UDP-otsikko käy läpi myös paljon vähemmän käsittelyä kuljetuskerroksessa pienennetyn latenssin vuoksi. Datan lähettyksessä hoitaa ilman ainutlaatuisia tunnuksia tai numero järjestyksiä. UDP ei tarjoa mitään virheiden korjausta, eikä kadonneita paketeita, ja käytettäessä sattuu helpommin virheitä, mutta se lähettää nopeammin kuin TCP.

Molemmissa jakautuvat datat pienempiin yksikköihin eli datapaketi, missä sisältävät lähettäjän ja vastaanottajan IP-osoite, erilaisia konfiguraatiota, sisäisen lähettämän tiedon ja ilmiottaa mihin paketti päättyy (A--->B:lle)

Turvallisuudessa UDP:tä on mahdotonta pystyttää palomuuria, joka mahdollistaisi vain tietyn UDP-viestinnän ja estää loput, eli eivät suojaa täysin verrattuna TCP on helpompi suojata. Käyttäjä voi hyödyntää välityspalvelinta eli proxy:ä tiettyjen sovellusten käyttöä tai luoda tunneliyhteyden (tunneloiva yhteys) etäkäyttäjän ja yrityksen sisäisen verkon välille.

<img src="images/data-tcp-upd-1.PNG" width="650">

<img src="images/data-tcp-udp-2.PNG" width="500">

<h3>Kahden protokollien ero taulukko</h3>

| Tyyppit | TCP | UDP |
| --- | --- | --- |
| liitäntätyyppit | yhteyssuuntautunut - laitteen on muodostettava yhteys ennen tiedonsiirtoa ja suljettava yhteys lähetyksen jälkeen | yhteydentön - tietojen lähettäminen ei vaadi yhteyttä eikä käsittelyä |
| luotettavuus | luotettava - datapakettien toimitus on takaus | epäluotettava - Datagrammien toimitusta ei takausta |
| viestintä tietojen tyyppit | Tilallinen |  |
| Kehys (header) koko | Muuttuja: 20-60 tavua /bytes) pituudeltaan | Kiinteä - 8 tavua (bytes) |
| Nopeus | Hitaampi kuin UDP, mutta noudattaa monia vaihteiden tarkkuuuden varmistamista | Nopeampi kuin TCP, koska paljon yksinkertaisempi protokolla  |
| Järjestys | Paketit toimitetaan vastaanottajalle tietyissä järjestyksessä | Datagrammit toimitetaan ilman erityistä järjestystä. Jos se vaatii jonkilaisen tilauksen, se on sovelluksen hallinnoiva |
| Lähetystuki | ei mitään lähetystä (joukko-, moni- tai yleislähetystä) tueta | Yksittäisen tai muun monipuoliset lähetyksen tukeminen |
| Virheiden tunnistus mekanismit |  |  |
|  |  |  |

Käyttöstä riippuu mihin käyttö tarkoitukseen olla käytössä, että jos tarvitsee nopea ja sujuvaa tiedonsiirtoa, joten käyttämä sovellus tai palvelu toimii kunnoolla joten UDP. Sama TCP on staatinen/muuttumaton ja luotettava protokolla, jota käytteässä data saapuu perille vastaanottajan luokse.

<!-- NTP START HERE -->
## NTP
Network Time Protocol (NTP) , joka on UDP pohjainenn protokolla täsmällisen aikatiedon välittämisen tietokoneiden välillä. Protokolla on suunniteltu ottamaan huomioon verkojen muuttuvia viiveitä, että toimivuudessa ja useiden palvelimen kellojen aikojen tahtia, että asiakas-palvelin käytöä.  

<img src="images/data-ntp-1.PNG" width="450">

<!-- DNS START HERE -->
# DNS

Domain Name System (DNS), mikä tunnetaan parhaiten nimipalvleujärjestelmä, mikä muuntaa verkotunnusta IP-osoitteeksi esim. Google DNS IP-osoite ovat 8.8.8.8 ja 8.8.4.4




