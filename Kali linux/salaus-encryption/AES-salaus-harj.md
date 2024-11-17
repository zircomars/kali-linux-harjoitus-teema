# AES-salaus 

AES (Advanced Encryption Standard) on <b> symmetrinen salausalgoritmi</b>, joka on suunniteltu suojaamaan tietoa ja varmistamaan sen luottamuksellisuus. Se on yksi käytetyimmistä ja turvallisimmista salausmenetelmistä, ja sitä käytetään laajalti monilla eri aloilla, kuten tietoliikenteessä, verkkosovelluksissa ja tiedostojen suojauksessa.

AES-salauksen perusperiaate on, että se käyttää samaa avainta tiedon salaamiseen ja purkamiseen. Tämä tekee siitä "symmetrisen" salauksen, koska salaustapahtuma ja purkamisprosessi ovat identtiset, mutta avaimet pysyvät samoina molemmissa vaiheissa.

- [AES piirteet](#AES-piirteet)
- [toiminnassa](#toiminnassa)
- [AES terminaali ja OpenSSL työkalun käyttö](#AES-terminaali-ja-OpenSSL-työkalun-käyttö)  
- [AES-salausta tiedostoa](#AES-salausta-tiedostoa)
- [Kali linux harj](#Kali-linux-harj)
- [lähteitä](#lähteitä)  
[Headers](#headers)  

## AES piirteet

Salauksen avaimen pituus jakautuu kolmeen eri pituutta:

- AES-128 (128-bittinen avain)
- AES-192 (192-bittinen avain)
- AES-256 (256-bittinen avain)

mitä pidempi avaimen pituus, niin sitä vahvempi ja turvallisempi salaus on


Salauksen lohkokoon: AES käsittelee tietoa lohkoissa, joissa on 128 bittiä dataa kerrallaan. Tämä tarkoittaa, että data jaetaan 128-bittisiin lohkoihin ja niitä käsitellään erikseen salauksen aikana.

Salauksen kierrokset: AES suorittaa useita "kierroksia" salauksen aikana. Kierroksien määrä riippuu käytettävän avaimen pituudesta:

- AES-128 käyttää 10 kierrosta.
- AES-192 käyttää 12 kierrosta.
- AES-256 käyttää 14 kierrosta.

Kunkin kierroksen aikana suoritetaan erilaisia salausoperaatioita, kuten substituutioita, permutaatioita ja avaimen yhdistämistä.


Turvallisuus: AES on erittäin turvallinen ja sitä pidetään luotettavana menetelmänä jopa nykyaikaisille supertietokoneille. AES on ollut julkisesti arvioitavana ja se on läpäissyt useita turvallisuustarkastuksia. On hyvin vaikeaa murtää AES-salausta bruteforce-hyökkäyksillä, erityisesti pitkillä avaimilla (esim. AES-256).


Käyttökohteet: AES on standardi salausalgoritmi, jota käytetään mm. VPN:ä, SSL/TLS-yhteyksissä, tiedostojen salauksessa, levyjen salauksessa ja muissa tietoturvatoimissa.

## toiminnassa

- Salaaminen: AES ottaa syötteenä selkokielisen datan ja salausavaimen, ja muuntaa tiedon salaamalla sen erilaisten operaatioiden avulla.

- Purkaminen: Salausavaimen avulla salattu tieto voidaan purkaa takaisin alkuperäiseen muotoonsa.

Tätä ei ole rajoitettu missään eli voi tukea hyvinkin Linux terminaalissa, että muissa ymprästissö mukaan lkien Windows, MacOS, palvelimella ja jopa ohjelmointikielessä kuten Python. Tätä AES salausalgoritmiä käytetään laajasti tiedon salaamiseen ja suojaamiseen eri sovelluksissa ja järjestelmissä.

Salausavaimen käsittelyä;
AES-salauksen käyttö vaatii salausavaimen (tai salausavaimen ja alustusvektorin). Komentoriviltä voi määrittää salausavaimen manuaalisesti, mutta on tärkeää, että avaimet käsitellään turvallisesti. OpenSSL voi luoda salausavaimen automaattisesti, mutta yleensä se voidaan antaa myös suoraan komentoriviltä `-k` -parametrilla, jos ei haluta käyttää salasanan syöttöä.

## AES terminaali ja OpenSSL työkalun käyttö

OpenSSL on työkalu, joka on hyvin yleinen salaustekniikoiden toteutuksessa Linux-ympäristössä. Sen avulla voidaan käyttää AES-salausta ja muita salausalgoritmeja.

Vaikka AES-salaus voidaan toteuttaa eri ohjelmointikielissä ja kirjastoissa, kuten Pythonissa, C:ssä tai Java, , `openssl` on kätevä komentorivityökalu, joka mahdollistaa salauksen ja purkamisen ilman erillistä ohjelmointia. Se on laajasti käytetty Linux-terminaalissa.


- Esim. malli AES salaksen luominen tiedostolle ja käyttäen komentoa; <br>
`openssl enc -aes-256-cbc -in tiedosto.txt -out tiedosto.txt.enc`

Tässä `enc` viittaa salausta, `-aes-256-cbc` tarkoittaa käyttäen AES-256 salausavainta CBC (Cipher Block Chaining) -moodilla, `-in tiedosto.txt` määritettään mille tiedostolle joka salataan ja `-out tiedosto.txt.enc` määrittää salatun uuden tiedoston nimen


- Vastaavasti tätä purkausta tiedostoa jos halutaan purkaa (aiemman tiedoston), niin tapahtuu komennolla; <br> 
`openssl enc -d -aes-256-cbc -in tiedosto.txt.enc -out tiedosto.purku.txt` 

tässä sama idea kuin salauksen luominen vain siinä on `-d` mikä tarkoittaa purkamista (decrypt).

<br><br>
AES-salauksen toteutus openssl-komennolla:
- Salauksen tekeminen (salataan tiedosto):

```
┌──(kali㉿kali)-[~/Desktop]
└─$ echo "Hello World" | openssl enc -aes-256-cbc -base64 -pass pass:salasana  

*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
U2FsdGVkX18J5GA0j8d6BE76Wlvk7htXTKwCqY06VVs=
```

Tämä käyttää AES-256-CBC-tilaa ja salaa tekstin base64-muotoon.
-pass pass:salasanasi määrittelee salasanan, jota käytetään avaimena salauksessa


- Salauksen purku
```
┌──(kali㉿kali)-[~/Desktop]
└─$ echo "U2FsdGVkX18J5GA0j8d6BE76Wlvk7htXTKwCqY06VVs=" | openssl enc -aes-256-cbc -base64 -d -pass pass:salasana
*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
Hello World
```

<hr>

Tosiaan `openssl` ei ole ainoa työkalu , jonka avulla voit käyttää AES-salausta. On olemassa monia muita työkaluja ja kirjastoja, kuten:

- GPG (GNU Privacy Guard) salaukseen ja allekirjoituksiin.
- Cryptography Python-kirjasto salaukseen.
- NaCl (Networking and Cryptography Library) tai libsodium.

Kuitenkin `openssl` on yleisesti käytetty työkalu monenlaisiin kryptografisiin tehtäviin, koska se on erittäin joustava ja se tukee monia eri algoritmeja. Kuitenkin se on kätevä ja laajasti käytetty työkalu, on myös muitakin vaihtoehtoja riippuen, mitä ja millaisia ympäristöä ja/tai ohjelmintikieltä käyttää.

<hr>

## AES-salausta tiedostoa

AES-salausta voidaan käyttää tiedostojen salaamiseen, ja se toimii erinomaisesti myös eri tiedostomuodoille, kuten .txt, .docx, .pdf ja monille muille. AES on symmetrinen salausalgoritmi, eli sama avain käytetään sekä tiedoston salaamiseen että sen purkamiseen. Tämä voi olla hyödyllistä esimerkiksi salattaessa henkilökohtaisia tietoja tai arkaluonteisia tiedostoja.


AES-salausta tiedostoille esimerkiksi openssl-työkalulla, joka on saatavilla useimmissa Linux-järjestelmissä ja myös Windowsilla. Alla näet, kuinka tiedosto voidaan salata ja purkaa käyttämällä AES:ää tiedostojen kanssa.

Jos ei halua käyttää salasanaa komentorivillä, voit valita myös keyfile (avain-tiedosto) -ratkaisun, jolloin ei tarvitse kirjoittaa salasanaa suoraan komentoriville. Se lisää turvallisuutta, koska salasanan ei tarvitse näkyä komentorivillä. Eli ilman salasanaa vaikka salaisi tiedoston.

<br>
Tässä esimerkki, ja tässä tapahtuu salaus keyfile:lle: <br>

`openssl enc -aes-256-cbc -salt -in sensitive.txt -out sensitive.enc -pass file:/path/to/keyfile`


`-pass file:/path/to/keyfile`: Tässä käytetään tiedostoa, joka sisältää salausavaimen, eikä salasanaa kirjoiteta suoraan komentoriville.

<br>
Purkaminen keyfilellä; <br>

`openssl enc -aes-256-cbc -d -in sensitive.enc -out sensitive_decrypted.txt -pass file:/path/to/keyfile`

<hr>


# Kali linux harj

- 1. Otettaan esim, satunainen tiedosto (txt) jossa on muutama riviä hepreaa ja salattua tietoa:

```
┌──(kali㉿kali)-[~/Desktop]
└─$ touch file1.txt
                                                                                                                    
┌──(kali㉿kali)-[~/Desktop]
└─$ sudo nano file1.txt
[sudo] password for kali: 
                                                                                                                    
┌──(kali㉿kali)-[~/Desktop]
└─$ cat file1.txt 
moi 
salainen numero on:
123456

tämän sijainti on
XYZ

```

- 2. Sitten seuraavaksi salataan tämä tiedosto ja tuossa annettaan salasana, niin laitoin esim. "testi" :

```
┌──(kali㉿kali)-[~/Desktop]
└─$ openssl enc -aes-256-cbc -in file1.txt -out file1.txt.enc   
enter AES-256-CBC encryption password:
Verifying - enter AES-256-CBC encryption password:
*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
                                                                                                                    
┌──(kali㉿kali)-[~/Desktop]
└─$ ls
file1.txt  file1.txt.enc
                                                                                                                    
┌──(kali㉿kali)-[~/Desktop]
└─$ ls -all
total 16
drwxr-xr-x  2 kali kali 4096 Nov 16 20:50 .
drwx------ 19 kali kali 4096 Nov 16 15:06 ..
-rw-rw-r--  1 kali kali   57 Nov 16 20:44 file1.txt
-rw-rw-r--  1 kali kali   80 Nov 16 20:50 file1.txt.enc
```

vastaavasti jos haluan lukea tätä salattua tiedostoa "file1.txt.enc" niin se tulostaa tällaisia mysteerisiä tekstiä:

```
┌──(kali㉿kali)-[~/Desktop]
└─$ cat file1.txt.enc 
Salted__˘�;�q���Ў�ծ����E?^��Z�▒���!�[�ȺT����
˔�/Bt�`�9'"�N���$Y�X�����                                                                    ```                    
```

- 2.1. muita sivullisia kokeillaan vaikappa kopsata tätä samaa (file1.txt.enc) toiseen kansion polun alle, ja ikään kuin kopsattu sama tiedosto menisi muualle kansio polkuun ja vastaavasti se salausavain niin pysyykö se samana. Vastaavasti tämä on sama identinen tiedosto, sekä jos esim. toi ykkönen jos yhtäkkiä poistettaan ja käytettäisin tätä samaa "file2.txt.enc" niin kopsautuu useampaan samaan versioon ja toimii jatkuvana backup prosessina. Vastaavasti ei voi lukea kopsattua salattua tiedostoa kunnes sitä puretaan ja komennot `$cat` ja `sudo nano` - nämä ei toimi, jos normaalisti linux komennolla toistetaan ja luetaan sitä tiedostoa.

```
┌──(kali㉿kali)-[~/Desktop]
└─$ cp -R /home/kali/Desktop/file1.txt.enc /home/kali/Documents/kansio/file2.txt.enc

┌──(kali㉿kali)-[~/Documents/kansio]
└─$ ls
file2.txt.enc
                                                                                                                    
┌──(kali㉿kali)-[~/Documents/kansio]
└─$ ll
total 4
-rw-rw-r-- 1 kali kali 80 Nov 16 21:05 file2.txt.enc
```

- 2.2. nyt kokeillan vaikappa <b>purkaa</b> "file2.txt.enc" ja saadaanko samaa kuin mitä luotiin alunperin, ja vastaavasti tietenkin toistettan se sama koodi encryptattu salasana eli "testi" ja purettu tiedosto tulostuu uutena eli (tiedosto.purku.txt)

```
┌──(kali㉿kali)-[~/Documents/kansio]
└─$ openssl enc -d -aes-256-cbc -in file2.txt.enc -out tiedosto.purku.txt 
enter AES-256-CBC decryption password:
*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
                                                                                                                    
┌──(kali㉿kali)-[~/Documents/kansio]
└─$ ls
file2.txt.enc  tiedosto.purku.txt
                                                                                                                    
┌──(kali㉿kali)-[~/Documents/kansio]
└─$ ll
total 8
-rw-rw-r-- 1 kali kali 80 Nov 16 21:05 file2.txt.enc
-rw-rw-r-- 1 kali kali 57 Nov 16 21:19 tiedosto.purku.txt

┌──(kali㉿kali)-[~/Documents/kansio]
└─$ cat tiedosto.purku.txt 
moi 
salainen numero on:
123456

tämän sijainti on
XYZ

```

3. pieni yhteenveto; 
Periaatteessa toimii, jos ensimmäisestä tiedostosta salataisiin ja luodaan siitä joko pari tai useampi kopio, mutta ongelmana tätä salattua tiedosto pitää asettaa avain, jonka jälkeen kopsatuista tiedoista kulkee se sama salattu avain seuraaville tiedostoille. Jos halutaan purkaa seuraavat kopsatut tiedostot niin sitten pitää purkkaa, kunnes voidaan lukea ja katsoa mitä sen tiedoston takana onkaan.


## muita kysymyksiä?

mistä tietää jos purettaan onko se (AES-256-CBC) vai muu (AES-128-CBC & ...)


<hr>
## lähteitä

https://docs.anchormydata.com/docs/what-is-aes-256-cbc





