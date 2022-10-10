# Wireshark

Wireshark on tämmöinen verkkoanalysaattori, joka voi analysoida ja tarkastella verkkon tietoja, mikä mahdollistaa kunkin paketin sisälllön poraamista ja lukemista - ja suodataa vastaamaan erityistarpeita. Wireshark käytettään yleisen verkon ongelmien vianmäärityksiin, että lisäksi ohjelmiston kehittämistä ja testaamista. Sovellus näyttää tietojen protokollia eli OSI-malli ja TCP/IP mallin protokollia kaikien tärkemmistä verkkotyypeistä. Datapakettia voi tarkastella reaaliaikaiseksi tai analysoida offline-tilassa, ja tuhansia kaappaus- / jäjitystiedostomuotoja kuten CAP tiedosto ja ERF (Extensible Record Format). 

<img src="images/wireshark-software1.PNG" width="625">

# capture

Suom. kaappaus / analysoida tiettyä ominaisuuksia esim. kuten yhteystyypit Bluetooth - verkkoyhteys, Ethernet, Virtualbox Host , Wi-Fi, että riippuu mitä aktivoituu koneella niin ylemmän kuvan mukaan kuvaruutuun ponnahtaa kyseinen yhteys laite.

# Värikoodit

Käyttäjä voi nähdä kaapatut paketit korostettuna värillä. Wireshark käyttää näitä värejä auttamaan käyttäjää tunnistamaan yhdellä silmäyksellä kaapatun liikenteen tyypin. Sovelluksessa voi nähdä tarkalleen, mitä värikoodit tarkoittavat ja vähä tarkentaa värikoodien ja teknisen kuvauksen, sekä voi myös tarvittaess muokata värisääntöjä jos haluaa.

| väri | kuvaus | 
| ----- | ----- |
| $\textcolor{ #e7e6ff}{Vaaleanvioletti}$ | TCP - liikenne |
| $\textcolor{ #e7e6ff}{harmaa}$ | TCP-paketti SYN- tai FIN-lipulla |
| $\textcolor{ #a40000}{punainen}$ | TCP-paketti RST-lipulla |
| $\textcolor{ #12272e}{musta}$ | TCP-paketit, joissa on ongelma (yleensä paketteja, joissa on sekava järjestysnumero) |
| $\textcolor{ #e4ffc7}{vaaleanvihreä}$ | HTTP liikenne |
| $\textcolor{ #daeeff}{vaaleansininen }$ | DNS ja UDP liikenne |

<img src="images/wireshark-colorrules.PNG" width="750">

# ubuntu

$sudo wireshark 
käynnistää varsinaisen wireshark sovelluksen käyntii, ja jos laitaa kommentoon vaan $wireshark , niin aktivoituu sovellus, mutta sisäisen varsinaisen verkkojen seurata datat ei

$apt show wireshark <br>
tulostaa wireshark sovelluksen version esim. 3.2.1.0

# icmp (Internet Control Message Protocol)

# ohje kuinka ladataan wireshark ubuntun kautta & ja kuinka aktivoidaan se sovellus <br>
https://linuxhint.com/install_wireshark_ubuntu/<br>

https://www.youtube.com/watch?v=rtm_Bofv4-8 <br>

https://fi.frwiki.wiki/wiki/Wireshark <br>
