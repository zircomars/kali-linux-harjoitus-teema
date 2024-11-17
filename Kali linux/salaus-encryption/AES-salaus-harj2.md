# lisää harjoituksia (kali linux)
Tänne tulee pari-muutamia kivoja harjoituksia kali linux:seen, että tänne ja vastaavasti pientä kysymyksiä

- [pieni lunttilappu](#pieni-lunttilappu)
- [harj 1 - ilman salasanaa](#harj-1-ilman-salasanaa)
- [harj 2 muut bittit](#harj-2-muut-bittit)
- [harj 3 hyökkäys](#harj-3-hyökkäys)
- [harj 4 vertailuun CBC ja GC](#harj-4-vertailuun-CBC-ja-GC)
- [header](#header)
- [header](#header)
- 
## pieni lunttilappu

Salataan tiedosto: `$ openssl enc -aes-256-cbc -in file1.txt -out file1.txt.enc`

Purettaan salaus: `$ openssl enc -d -aes-256-cbc -in file2.txt.enc -out tiedosto.purku.txt`

:exclamation: Pieni muistutus, joka kerta salataan tai purettaan tiedosto niin pitää tietää se <b>salasana</b>, kunnes päästään tiedoston sisään. Koska luonti ja purettussa kysyy sitä salasanaa. 

Salauksen avaimia jakautuu kolmeen avaimeen eli (AES 128/192/256), mitä pidempi avaimen pituus, niin sitä vahvempi ja turvallisempi salaus on

## harj 1 - ilman salasanaa

Jos käyttää AES - salausmenetelmissä ilman salasanaa, se ei ole teknisesti mahdollista tehdä samalla tavalla kuin normaalisti. Salasanaa tarvitaan AES-salauksessa, koska se toimii symmetrisen salausalgoritmin mukaan, eli sama avain käytetään sekä tiedoston salaamiseen että purkamiseen. Salasana (tai salausavain) on olennaisesti se "avain", joka muuntaa alkuperäisen datan salatuksi muodoksi ja päinvastoin purkamisen yhteydessä.



<br>
- Mitä tarkoitetaan "ilman salasanaa" AES-salauksessa?
  
Jos salasanaa ei ole annettu, nin yrittää käyttää AES salausta `openssl` tai muu vastaava työklaua pyyttää käyttäjän/luojan antamaan salasanan. Jos ei anna salasanaa, salaus ei voi suorittaa salauksen tai purkamisen prosessia, koska AES tarvitsee salasanan (tai avaimen) salauksen suorittamiseen..

Tai jos ei halua käyttää salasanaa, mutta haluat silti tehdä AES-salauksen, käyttäjän/lluojan on käytettävä keyfile-ratkaisua (tiedosto, joka sisältää salausavaimen). Tämä on vaihtoehto perinteiselle salasanalle. Keyfile on tiedosto, jossa on salausavain, jota käytetään salauksessa ja purkamisessa.

Periaatteessa AES salausmenetelmissä (tai muissakin symmetrisissä salausalgoritmissä) salasana ja/tai avain on pakollinen, ei voi suorittaa salausta tai purkamista ilman, että määritettyä salasanaa ja/tai salauksen avainta.

Miksi, koska tämä tarkoittaa, että sama avain käytetään sekä tiedoston salaamiseen että sen purkamiseen. Tällä avaimella (tai salasanalla) salausalgoritmi luo salatun version alkuperäisestä tiedosta ja mahdollistaa sen purkamisen takaisin alkuperäiseen muotoonsa.

Jos ei anna salasanaa tai avainta, salausalgoritmi ei voi luoda salattua versiota tiedostosta, eikä myöskään pysty purkamaan sitä takaisin alkuperäiseksi tiedoksi. Tämä on symmetrisen salauksen perusperiaate.


:exclamation: HARJOITUS - START HERE;

Tässä salataan tiedosto (file1.txt), ja ilman salasanaa.

```
┌──(kali㉿kali)-[~/Desktop]
└─$ openssl enc -aes-256-cbc -salt -in file1.txt -out file1.txt.enc -pass file:./file1.txt  

*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
```

Mitä tässä tapahtui? 
- `-pass file:./file1.txt` takoittaa, että käytämme `file1.txt` -tiedostossa olevaa avainta salauksessa.
- `-salt` tarkoittaa lisää suolan, joka parantaa turvallisuutta.
- viimeisenä `file1.txt.enc` joka tallentuu sen salatuksi tiedostoksi, eli `file1.txt` on se alkuperäinen tiedosto.

Perus alkuun kuin tarkistaa lyhyesti ominaisuudet, vaikka ei olekaan lisätty sitä salasanaa silti salattu tämä tiedosto:

```
┌──(kali㉿kali)-[~/Desktop]
└─$ cat file1.txt.enc 
Salted__^��▒�O\x>8(��   �=�p
p�V��|08sX�
           �OJ��{��m�]=3��▒;6`
�.�
��o�
    [(                                                                                                      

┌──(kali㉿kali)-[~/Desktop]
└─$ ll
total 8
-rw-rw-r-- 1 kali kali 57 Nov 16 20:44 file1.txt
-rw-rw-r-- 1 kali kali 80 Nov 17 11:56 file1.txt.enc
                                                                                                                       
┌──(kali㉿kali)-[~/Desktop]
└─$ file file1.txt.enc 
file1.txt.enc: openssl enc'd data with salted password

```

Seuraavaksi puretaan tämä `file1.txt.enc` eli avataan se tiedosto.

```
┌──(kali㉿kali)-[~/Desktop]
└─$ openssl enc -aes-256-cbc -d -in file1.txt.enc -out file-purettu.txt -pass file:./file1.txt
*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
                                                                                                                       
┌──(kali㉿kali)-[~/Desktop]
└─$ ls
file1.txt  file1.txt.enc  file-purettu.txt
                                                                                                                       
┌──(kali㉿kali)-[~/Desktop]
└─$ cat file-purettu.txt 
moi 
salainen numero on:
123456

tämän sijainti on
XYZ
```

Salauksen purkamisen toinen methodi:
```
┌──(kali㉿kali)-[~/Desktop]
└─$ openssl enc -aes-256-cbc -d -in file1.txt.enc -out file-purettu.txt                       
enter AES-256-CBC decryption password:
*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
bad decrypt
40E6E3AC937F0000:error:1C800064:Provider routines:ossl_cipher_unpadblock:bad decrypt:../providers/implementations/ciphers/ciphercommon_block.c:107:

┌──(kali㉿kali)-[~/Desktop]
└─$ ls
file1.txt  file1.txt.enc  file-purettu.txt

```

Pieni yhteenveto;
Periaatteessa joko `openssl enc -aes-256-cbc -d -in file1.txt.enc -out file-purettu.txt -pass file:./file1.txt` eli tässä perässä syötettään se salauksen tiedoston salasanan tai toinen vaihtoehto purettaan kyseisen tiedosto, mitä halutaan purkkaa ja sen jälkeen toistettaan se salasana


<hr>

## harj 2 muut bittit
kokeillaan 128/192 bittiä

<hr>

## harj 3 hyökkäys

AES-salauksen hyökkäykset: Brute-force ja sanakirjahyökkäykset
Tavoite: Ymmärtää, kuinka helposti salasanoja voidaan murtamalla AES-salauksessa ja harjoitella sitä.

Harjoitus:
Salasanojen murtaminen:

Käytä brute-force- ja sanakirjahyökkäyksiä salasanan murtamiseen. Voit käyttää esimerkiksi Hashcat-työkalua yhdessä openssl-komentojen kanssa.
Testaa erilaisia salasanoja:

Luo eri pituisia ja vaikeusasteisia salasanoja ja testaa, kuinka nopeasti ne voidaan murtaa brute-force tai sanakirjahyökkäyksillä.
Tavoitteet:

Ymmärtää salasanan heikkoudet AES-salauksessa.
Harjoitella hyökkäyksiä (brute-force, sanakirjahyökkäykset) ja ymmärtää, miksi vahvat salasanat ovat tärkeitä.

<hr>

## harj 4 vertailuun CBC ja GC
AES-salauksen vertailu eri tiloilla (CBC vs GCM)



<hr>

## harj 5

Tavoite: Ymmärtää AES
eri toimintatilojen (moodien) vaikutus turvallisuuteen ja suorituskykyyn.

Salaaminen CBC-tilassa (Cipher Block Chaining):
`openssl enc -aes-256-cbc -salt -in file1.txt -out file1.txt.enc -pass pass:"salasana"` 


Salaaminen GCM-tilassa (Galois/Counter Mode):
`openssl enc -aes-256-gcm -salt -in file1.txt -out file1.txt.enc -pass pass:"salasana"` 

Vertaa GCM-tilan ja CBC-tilan eroja suorituskyvyssä ja turvallisuudessa.
eri tilojen (moodien) rooli ja niiden ero.
Harjoitella AES-GCM ja AES-CBC-moodien käyttöä ja ymmärtää niiden käytön edut ja rajoitukset.


