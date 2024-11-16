# rockyou 

Tärkeimmistä tiedoista on toi "rockyou.txt" eli yksi maailman tunnetuimmista ja käytetyimmistä sanakirjatiedostoista, joka sisältää suuren määrän yleisimpiä ja heikosti turvattuja salasanoja. Se on erityisesti suosittu sanakirjahyökkäyksissä ja käytetään usein salasanamurtamisessa, koska siinä on valtava määrä yleisiä, helposti arvattavia salasanoja, joita monet ihmiset käyttävät. 

esim. ylläpitäjillä saatettaan käyttää <admin:admin> eli <käyttäjätunnus:salasana> eli tosi helpo purkaa, kun kirjautuu kyseisen järjestelmän sovelluksen/työkalun sisään, tai <1234> salasanaksi ja jne.

periaatteessa tässä komennosa haettaan se tiedosto ja tulostuksena tulostuu tämmöinen polku. huomiona toi txt.gz on zipattu tiedosto niin sitä pitä purkkaa, koska se on paketoittu ja jos normaalisti cat lukee sitä tiedostoa niin tulostuksena terminaalisa näyttää ihan hepreaa koodia.

```
┌──(kali㉿kali)-[~]
└─$ locate rockyou.txt
/usr/share/wordlists/rockyou.txt.gz
```


## tiedoston purkaus

ton rockyou.txt tiedostoa löytyy gui käyttöliittymän kauttakin kali linux puolelta, mutta maku asia, menee terminaalista vai käyttöliittymästä. (ei ole oikeaa tai väärä tapaa)

```
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ ls
amass  dirbuster   fasttrack.txt  john.lst  metasploit  rockyou.txt.gz  wfuzz
dirb   dnsmap.txt  fern-wifi      legion    nmap.lst    sqlmap.txt      wifite.txt

```

aloitettaan purkaus (unzip) (START HERE);

```
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ sudo gzip -d rockyou.txt.gz 
[sudo] password for kali: 

┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ ls
amass  dirbuster   fasttrack.txt  john.lst  metasploit  rockyou.txt  wfuzz
dirb   dnsmap.txt  fern-wifi      legion    nmap.lst    sqlmap.txt   wifite.txt

```

lasketaan tiedoston rivi määrää käyttäen `$wc` (word count) joka laskee tiedostossa olevien sanojen, rivien, merkkien ja tavujen määrän. ja mukaan tulee `-l` valinta tarkoittaa, että komento laskee vain rivien määrän.

nmap:issä 5 tuhatta ja rockyou on n. 14 miljoonaa, eli 14 miljoona mahdollisia salasanoja.
```
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ wc -l nmap.lst 
5007 nmap.lst
                                                                                                                    
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ wc -l rockyou.txt 
14344392 rockyou.txt
```


## grep komento

`grep` on Linux-komento, jota käytetään tekstin etsimiseen tiedostosta tai syötteestä, joka vastaa tiettyä hakuehtoa. Se on erittäin tehokas työkalu erityisesti silloin, kun halutaan suodattaa tai etsiä tietoja suurista tekstitiedostoista tai virhelokeista.

Tämä on Unix pohjainen työkalu eli Linux terminaalille, joten ei ole suoraan käytetävissä Windows:sin PowerShell:ille ilman lisäasennusta, mutta PowerShell:issä on vastaavia komentoja ja tapoja suorittaa hakujen tiedostoa eli `Select-String`, tämä on sama idea kuin `grep`.

tässä esim. tulostuu kaikki jossa on "cisco" kirjain ei väliä onko muita tekstiä, kirjaimia tai erikoismerkkiä sen edessä ja takana, ja pari-muutama esim.

```
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ grep cisco rockyou.txt 

1996franciscovicente
0467francisco
0.francisco
..francisco
((francisco))
$143mtfrancisco$

```

samaan laitoin tähän `-c` (--count), joka laskee monta kertaa sana "cisco" esiintyy siinä tiedossa, ja sama idea kuin `wc -l`, joka laskee ja tulostaa vain rivien määrä, joka vastaa sitä hakua
```
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ grep -c "cisco" rockyou.txt
```


muita grep komentoja ja esimerkkejä:

- hakee tietyn sanan tiedostosta ja sama pätee lokitukset, kun etsitään kyseistä virhettä; <br>
`grep "sana" tiedosto.txt`


- etsii ilman isojen ja pien kirjaimien erottamista ja `-i` tarkoittaa, että ei tehdä erottamatta isoja ja pien kirjaimia; <br>
`grep -i "sana" tiedosto.txt`


- näytää rivin numero, jossa hakuehdot esiintyy ja `-n` näyttää rivin numeron, jolla hakusana esiintyy. vastaavasti lokituksesta voidaan tulostaa myös rivien numeroa; <br>
`grep -n "sana" tiedosto.txt`


- etsii ja tulostaa rivit, jotka eivät sisällä hakusanaa ja `-v` valitsin tekee niin, että `grep` tulostaa ne rivit, jotka eivät sisällä hakusanaa <br>
`grep -v "sana" tiedosto.txt`


- etsii useita sanoja tiedostosta, eli jos on kaksi tai useampaa sanaa, ja `-E` mahdollistaisi säännöllisen lausekkeet ja tästä käytettään tuota putkea | - operaatiota niin etsii sana1 ja sana2:sen <br>
`grep -E "sana1|sana2" tiedosto.txt`


- etsii tietyn vain osa tiedostosta, joissa hakusana esiinty (iman koko riviä) ja `-o` tulostaa vain ne osat rivistä, jotka astaavat hakusanaa (ilman koko riviä) <br>
`grep -o "sana" tiedosto.txt`

- tässä esim. `-F` komennon joka tarkoittaa "fixed strings" kiinteä merkkijono, eli joka ei käsittele hakuehtoja säänööllisinä laueskkeina, vaan se tsii täsmälleen annettuen merkkijonoa. Eli ei väliä mitä muuta kuin vain etsii täsmällisen sanan ja tulkinnan tarkasti, koskien iso/pien kirjaimet, numerot ja erikoismerkit.  <br>
```
┌──(kali㉿kali)-[/usr/share/wordlists]
└─$ grep -F "1*cowcode1*cowco" rockyou.txt 
1*cowcode1*cowco
```




