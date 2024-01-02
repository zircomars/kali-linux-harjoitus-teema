# harjoitus skannaus
esim. harjoitus skannattaan perus verkon skannaus (basic network scan), joka skannaa koko järjestelmän skannattujen haavoittuvuutta koko host:ista 

Ensimmäisen oletus sivusto ja näkymä <br>
![Alt text](Screenshots/scan1.png)

New scan - suoritettaan uutta skannausta mm. webbi sivuston haavoittuvuutta, haittaohjelman skannausta, mobiililaitteiden skannausta, webbi sovelluksien testausta ja jnne, periaatteessa valitaan uusi template skannaus pohja. <br>
![Alt text](Screenshots/scan2.png) <br>
![Alt text](Screenshots/scan3.png) <br>

Harjoituksessa valitiin (Basic network scan), josta skannattaan kohdetta eli targets kentään (www.domain.com) & sekä valinnaisena saa määrittää tiettyjä asetuksia ja ominaisuuttta ja muita raporttia. <br>
![Alt text](Screenshots/scan4.png) <br>
![Alt text](Screenshots/scan5.png) <br>
![Alt text](Screenshots/scan6.png) <br>

![Alt text](Screenshots/scan7.png) <br>
![Alt text](Screenshots/scan8.png) <br>
![Alt text](Screenshots/scan9.png) <br>

![Alt text](Screenshots/scan10.png) <br>
![Alt text](Screenshots/scan11.png) <br>

Mikäli on valmis eli asetukset on ok ja jne, niin muista tallentaa, jonka jälkeen automaattisesti viee tonne "My Scans" alle, josta näkee kaikki omat skannaukset (historiat). 
Ihan oikealla on aktivointi ja stop nappi, eli joko aloitettaa/jatkaa skannauksen kyseisen kohteen ja/tai keskeytettään suorituskyky. <br>
![Alt text](Screenshots/scan12.png)

Historian skannauksesta voi nähdä koska ja milloin suoritettu se skannauksen toiminta esim. ma skannattu, sitten myöhemmin skannaa taas, ja skannauksen tarkempaa lisätietoa esim. status jossa lukee suorittaa sen suorituskyvynsä. Seuraavassa kuvassa alhaalla näkyy erillisenä (donitsi) kuviona, että löytyi haavoittuvuutta (vulnerabilities), ja minkä tasoisia. <br>
![Alt text](Screenshots/scan13.png) <br>
![Alt text](Screenshots/scan14.png) <br>

Sama kuin edellinen kuva, jossa on donitsi kuva, ja tähän kategoriaan tulokseen tulee kaikki suorituskyvyn löydetyt ja skannatut haavoittuvuudet. Tuloksena tulostuu aivan kaikki eli priorisoitu matalasta korkeampaan tasoon että info. <br>
![Alt text](Screenshots/scan15.png) <br>

Odota joko pari-muutama minuutti, niin sieltä tulee jokin pieni matala priorisoitu haavoittuvuus tulos (donitsi rengas) tulostuksesta. Haavoittuvuuden kategoriasta voi tarkistella ja nähdä, mitä skannauksien tulostuksia se on löytänyt. Skannauksesta saattaa mennä useampi minuutti, koska skannauksessa tuottaa viivettä ja aikaa, että löytää sen haavoittuvuuden. <br>
![Alt text](Screenshots/scan16.png) <br> 
![Alt text](Screenshots/scan17.png) <br>

Oranssi värinen haavoittuvuus ja priorisoitu "medium" tasoksi. <br>
![Alt text](Screenshots/scan18.png) <br>

![Alt text](Screenshots/scan19.png) <br>

Keskeytin itse ton skannaukse (oikea toiseksi) nappista, koska katsellaan viimeisimpien tulosta ja mitä skannauksen tulostusta on löytynyt. <br>
![Alt text](Screenshots/scan20.png) <br>

Pieni yhteenveto, että mitä skannausta on löydetty tähän menessä (sen muutaman minuuttin aikana). Tuloksena löytyi 4 medium ja muut ovat info tyyppejä. Jos tarkennettaan vähä lisää.. <br>
![Alt text](Screenshots/scan21.png) <br><br>

Valitaan se ensimmäinen vaihtoehto (violetti "mixed") <br>
![Alt text](Screenshots/scan22.png) <br>
![Alt text](Screenshots/scan23.png) <br>

Haavoittuvuudesta löytyi tämmöinen tekijä eli HSTS mising From HTTPS Server <br>
![Alt text](Screenshots/scan24.png) <br>

