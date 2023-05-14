# Kali Linux

On käyttöjärjestelmä OS (operating system), joka on suunniteltu tekniseen rikostutkintaan, penetraatiotestaamiseen ja paljon tietoturvaan ja sen testausta liittyviä ohjelmia, vähä mm. salapoliisi työtä, porttiskannausta ja myös suositeltava aloittavien hakkerointi väline. Paketti pohjaan on mm. ohjelmistona wireshark, metasploit, linux komentojen nmap, wfuzz, nikto, mysql ja jne, myös kali linux root itsensä.

Kali linux järjestelmässä on mukana mm. firefox selain, wireshark ja jne. että hyödyntää käyttäjän vaikappa tietoliikenteen yhteyden pelittämistä, skannausta tcp/udp protokollaan. Jos yhtäkkiä lataa tiettyä sovellusta, niin katsii ennen sitä tarkistaa esim. super hausta, että mahtaako olla tämmöinen tietty x sovellus jo olla mukana tässä järjestelmän paketin sisällä ennen kuin lataa sitä varsinaista versiota.

Kali linux:sta voi käyttää virtuaalikone pohjaista sovellusta mm. vmware, virtualbox tai fyysisen WSL (Windows Subsystem for Linux) eli microsoft pohjaan ja jos mac osaan tulee maksulliseksi. Suositeltavina lataa virtuaalikone pohjan, josta upottaa ladatun kali linux tiedoston ja josta sen jälkeen suorittaa/aktivoi sen kali linux ympäristön. Saa mm. usb tikullakin ladatua kali linux:sta, että esim. vähä rikollista ja riskiä käyttäjälle jos suorittaa selaisen prosessin.

  * [Penetraatiotestaus](#Penetraatiotestaus)
  * [](#)
- [muita harjoituksia ja hyviä vinkkejä hakkerointiin:](#muita-harjoituksia-ja-hyviä-vinkkejä-hakkerointiin)
  * [pdf kirjoja](#pdf-kirjoja)

![Alt text](images/kali_background.png)

jos suorittaa kali linuxsta vmware:a pohjaan niin siinä on n. joko 14 tai 30pv kokeilu versiota, että saa siitä fyysisen kiinteä ikuisuuden versio pohjanki itselle ja siihen pitää liittää se lisenssi koodi. Tätä lisenssi koodia löytyy usein github kanavista, että säästyy rahaa aika paljon ja riippuu aikooko päivittää sitä virtuaaliympäristön työkalua eli vmware:a.

Vaihtoehtona pyörittää virtualibox, että sekin toimii ilmaisena. Myös huomiona kali linux käyttöjärjestelmä paketti on n. 2.7Gb tilaa dataa jos suorittaa 64-bittisellä versiolla, että viee paljon tilaa..
 
<br>
Ladattavina kali linux; https://www.kali.org/get-kali/#kali-platforms <br>
Kali linux sisäiset työkalut; https://www.kali.org/tools/ <br><br>

ensimmäisenä kantsii muuttaa linux:sen näppäimistö asetukset eli riittää avaa komentorivin ja syöttää;; <br> 
┌──(kali㉿kali)-[~] <br> 
└─$ setxkbmap fi <br>  

<hr>

## Penetraatiotestaus

Penetraatiotestaus eng. penetration testing

Tarkoittaa tietotekniikan tietojen murtautumista, tunkeutumista tai läpäisyä. Tietojärjestelmien ympäristössä termi tarkoittaa tietojenmurtoa suojattuun tietojojärjestelmien ulkoverkon kautta (Blackbox). Testaamisesssaa ei voi yritetä todentaa, että voidaanko löydettyjä haavottoivuuden vuoksi käyttää ja testaamisessa kuuluu murtotestauksen piiriä.

Penetraatiotestauksessa käytetään tietojärjestelmien suojausmekanismia heikkouden ja haavoittuvuuden havaitsemista. Testauksessa tavoitteena on saada riittävä varmuus tietojärjestelmien suojausten asianmukaisia ja todennusta ulkoverkosta tulevia hyökkäyksiä vastaan. Testauksessa on eräänlaisia tietoturvatarkastuksia, jolla varmistellaan ohjelmiston suojausta joko ennen tuotannon siirtymistä tai osa jatkuvista yleisistä riskinarvioinnista.

Testin tarkoituksena on kertoa yrityksille/organisaatiolle nykyisen kyberturvallisuudenprotokollien vahvuuksia, jotta tuottaa esiin mahdollisia heikkouksia, joihin hyökkäyksiin voidaan käyttää hyväkseen heikentämällä ja tunkteutukanseen asiakkaan (yrityksen) tai käyttäjään IT-järjestelmiin. Yrityksen tulee tehdä penetraatiotestiä säännöllisesti varmistakseen, että infrastuktuuri pysyy vahvana ja hyvin suojattuna. Tietoturvanloukkaukseen voivat suerata ilkivaltaisia hyökkäyksiä, järjestlemähäiriöitä tai inhimillisiä/vakaavi virheitä. Tärkeännä on tunnistaa riskit ja paljastaa järjestelmien heikkouksia, joita ei ehkä ole edes mietitty tai ajateltu, koska ei tietoa koska tämmöinen tulee vastaan tulevaisuudessa.

http://www.secmeter.com/penetraatiotestaus.html

<img src="images/penetration-testing-1.PNG" width="500">

### methods

penetraatiotestauksessa on useita methodia

<img src="images/penetration-testing-2.PNG" width="525">

## cyber security tools

muita kyberturvallisuuden työkalui, tai vähä kuin hakkerointia välineitä hyödyntäen työasioissa tai harjoituksissa, että sama koskee penetraation testausta. Nykyään ja tulevaisuudessakin käytetään useita erityyppisiiä työkaluohjelmistoja ja hyödyntäen verkkoskannausta hankittuja tietoja sekä selvitellään ja tutkaillaan järjestelmän toiminnallisuutta, ja mahdolliset haavoittuvuudet.

- Metasploit ; hyökkäyksien käytettävä ilmainen työkaluohjelma, sen avulla hyökkääjä saa muistinkäsittelyvirheen sisältävän ohjelmiston suorittamaan haluamaansa koodia.

- Nmap ; Ilmainen porttiskanneri. Ohjelma ilmaisee kohdejärjestelmän avoimet portit ja skannaus on mahdollistaa tehdä useita kohdejärjestelmään kerralla.

- Nessus ; Ilmainen haavoittuvuusskanneri. Ohjelma tarkastaa annetun verkkon url osoitteen tai harjoittelun ohjelmiston sovelluksen IP-osoitteen ja selvittää onko kohteeseen mahdollista tehdä tietomurtoja.

- NetStumbler ; Ilmainen WLAN-kartoitusohjelma. Ohjelmalla voi esim. testata salauksen näkyvyyttä ja selvittää verkon haavoittuvuuksia.


https://www.shiksha.com/online-courses/articles/top-10-cyber-security-tools/

<hr>

# muita harjoituksia ja hyviä vinkkejä hakkerointiin: <br>

Suoraan tryhackme sivuston vaan:<br>
https://tryhackme.com/resources/blog/free_path <br>
https://tryhackme.com/room/tutorial <br>
https://www.hackthebox.com/ <br>

<br>
https://resources.infosecinstitute.com/topic/top-5-deliberately-vulnerable-web-applications-to-practice-your-skills-on/
https://geekflare.com/practice-hacking-legally/ <br>

<br>
ladattavia vm; <br>
https://www.vulnhub.com/ <br>

## pdf kirjoja <br>
