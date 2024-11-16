# AES-salaus 

AES (Advanced Encryption Standard) on <b> symmetrinen salausalgoritmi</b>, joka on suunniteltu suojaamaan tietoa ja varmistamaan sen luottamuksellisuus. Se on yksi käytetyimmistä ja turvallisimmista salausmenetelmistä, ja sitä käytetään laajalti monilla eri aloilla, kuten tietoliikenteessä, verkkosovelluksissa ja tiedostojen suojauksessa.

AES-salauksen perusperiaate on, että se käyttää samaa avainta tiedon salaamiseen ja purkamiseen. Tämä tekee siitä "symmetrisen" salauksen, koska salaustapahtuma ja purkamisprosessi ovat identtiset, mutta avaimet pysyvät samoina molemmissa vaiheissa.

<hr>

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


AES-salauksen toteutus openssl-komennolla:
Salauksen tekeminen (salataan tiedosto):

```
┌──(kali㉿kali)-[~/Desktop]
└─$ echo "Hello World" | openssl enc -aes-256-cbc -base64 -pass pass:salasana  

*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
U2FsdGVkX18J5GA0j8d6BE76Wlvk7htXTKwCqY06VVs=
```

Tämä käyttää AES-256-CBC-tilaa ja salaa tekstin base64-muotoon.
-pass pass:salasanasi määrittelee salasanan, jota käytetään avaimena salauksessa

Salauksen purku
```
┌──(kali㉿kali)-[~/Desktop]
└─$ echo "U2FsdGVkX18J5GA0j8d6BE76Wlvk7htXTKwCqY06VVs=" | openssl enc -aes-256-cbc -base64 -d -pass pass:salasana
*** WARNING : deprecated key derivation used.
Using -iter or -pbkdf2 would be better.
Hello World
```

<hr>

## AES-salausta tiedostoa

AES-salausta voidaan käyttää tiedostojen salaamiseen, ja se toimii erinomaisesti myös eri tiedostomuodoille, kuten .txt, .docx, .pdf ja monille muille. AES on symmetrinen salausalgoritmi, eli sama avain käytetään sekä tiedoston salaamiseen että sen purkamiseen. Tämä voi olla hyödyllistä esimerkiksi salattaessa henkilökohtaisia tietoja tai arkaluonteisia tiedostoja.


AES-salausta tiedostoille esimerkiksi openssl-työkalulla, joka on saatavilla useimmissa Linux-järjestelmissä ja myös Windowsilla. Alla näet, kuinka tiedosto voidaan salata ja purkaa käyttämällä AES:ää tiedostojen kanssa.
