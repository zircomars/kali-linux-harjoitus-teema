# Burp Suite – Perusteet, käyttö, ympäristöt ja eettinen testaus

## 1. Yleiskuvaus
Burp Suite on web‑sovellusten tietoturvatestausohjelmisto, joka toimii välikätenä selaimen ja palvelimen välillä. Se mahdollistaa HTTP/HTTPS‑liikenteen kaappaamisen, muokkaamisen, analysoinnin ja automatisoidun testauksen. Burp Suite on alan standardi penetraatiotestauksessa, bug bounty ‑työssä ja sovelluskehityksen turvallisuustestauksessa.

---

## 2. Miten Burp Suite toimii
Burp Suite toimii proxy‑palvelimena. Kun selain ohjataan käyttämään Burpia:

- Burp näkee jokaisen HTTP/HTTPS‑pyynnön ja vastauksen  
- Burp voi muokata pyyntöjä ennen niiden lähettämistä  
- Burp voi toistaa pyyntöjä ja testata haavoittuvuuksia  
- Burp voi purkaa HTTPS‑liikenteen oman CA‑sertifikaattinsa avulla  

Burp Suite koostuu useista työkaluista, jotka yhdessä muodostavat tehokkaan testausympäristön.

---

## 3. Proxy‑asetukset ja selaimen konfigurointi

### Proxy-asetukset
- Host: `127.0.0.1`  
- Portti: `8080`

### Firefoxin asetukset
1. Asetukset → Network Settings  
2. Manual proxy configuration  
3. HTTP Proxy: `127.0.0.1`, Port: `8080`  
4. “Use this proxy for all protocols”  
5. Tallenna

### HTTPS-sertifikaatti
1. Avaa selaimessa: `http://burp`  
2. Lataa `cacert.der`  
3. Firefox → Settings → Certificates → Import  
4. Valitse: “Trust this CA to identify websites”

---

## 4. Burp Suiten tärkeimmät työkalut

### Proxy
Näyttää kaiken liikenteen ja mahdollistaa pyyntöjen muokkauksen.

### Repeater
Manuaalinen testaus:
- lähetä sama pyyntö uudelleen  
- muokkaa parametreja  
- testaa XSS, IDOR, SQLi jne.

### Intruder
Automaattinen fuzzing ja hyökkäystestaus:
- brute force  
- parametrien testaus  
- payload‑listojen syöttö

### Scanner (Pro-versio)
Automaattinen haavoittuvuusskanneri.

### Decoder
Base64, URL-encoding, hex jne.

### Comparer
Vertaa kahta pyyntöä tai vastausta.

### Sequencer
Analysoi session ID:n satunnaisuutta.

---

## 5. HTTP vs HTTPS Burp Suitessa

### HTTP
- selkokielinen liikenne  
- Burp näkee kaiken automaattisesti  

### HTTPS
- liikenne salattua  
- Burp toimii MITM‑periaatteella  
- vaatii Burpin CA‑sertifikaatin  
- ilman sertifikaattia selaimessa → virheilmoituksia  

---

## 6. Burp Suite Kali Linuxissa (virtuaalikoneessa)

Kali Linuxissa Burp Suite on yleensä valmiiksi asennettuna.

### Virtuaalikoneessa huomioitavaa
- NAT tai Bridged toimii  
- jos käytät Kali-selainta → proxy `127.0.0.1:8080`  
- jos käytät hostin selainta → käytä FoxyProxyä ja ohjaa liikenne Kali‑VM:n IP:hen  
- sertifikaatti pitää asentaa siihen selaimeen, jota käytät  

---

## 7. Eettinen ja laillinen tietoturvatestaus

### Saa testata vain, jos sinulla on lupa.

Laillista:
- oma sovellus  
- työnantajan sovellus, jos lupa  
- testilabrat (DVWA, Juice Shop, HackTheBox, TryHackMe)  
- CTF-kilpailut  

Laitonta:
- muiden sivustojen testaus ilman lupaa  
- pankit, verkkokaupat, some, palvelut → ei ilman lupaa  
- maksujärjestelmien kiertäminen  

Burp Suite on työkalu — käyttötapa määrittää, onko toiminta laillista.

---

## 8. Missä Burp Suitea kannattaa testata?

### Suositeltu: Testilabra / Localhost
Paras ja turvallisin tapa:
- DVWA  
- OWASP Juice Shop  
- Mutillidae  
- WebGoat  
- omat API:t ja dev‑ympäristöt  

Syyt:
- ei riskiä laittomuuksista  
- ei häiritä oikeita käyttäjiä  
- ei aiheuteta vahinkoa tuotannolle  

### Voi testata: Staging / QA (luvalla)
- jos organisaatiolla on testiympäristö  
- liikenne ei vaikuta oikeisiin asiakkaisiin  

### Ei suositella: Tuotanto
Tuotantoa testataan vain, jos:
- sopimus sallii  
- testaus on suunniteltu  
- riskit on arvioitu  
- liikenne ei aiheuta haittaa

Intruder ja Scanner voivat kuormittaa palvelinta, joten niitä ei yleensä käytetä tuotannossa.

---

## 9. Burp Suiten uusi tekoäly‑ominaisuus (Burp AI)

Burp Suiteen on lisätty AI‑pohjainen toiminnallisuus (Burp Suite AI Assistant), joka:

- analysoi pyyntöjä ja vastauksia  
- ehdottaa haavoittuvuuksia  
- selittää liikenteen merkityksen  
- auttaa kirjoittamaan hyökkäys‑payloadit  
- auttaa tulkitsemaan sovelluksen logiikkaa  

Tekoäly ei korvaa manuaalista testausta, mutta nopeuttaa analyysiä ja auttaa aloittelijoita ymmärtämään sovelluksen toimintaa.

---

## 10. Yhteenveto

- Burp Suite toimii välikätenä selaimen ja palvelimen välillä.  
- Proxy = `127.0.0.1:8080`.  
- HTTPS vaatii Burpin sertifikaatin.  
- Repeater = manuaalinen testaus.  
- Intruder = automaattinen fuzzing.  
- Testaa aina ensin testilabrassa, ei tuotannossa.  
- Tekoäly‑ominaisuus auttaa analysoimaan liikennettä ja haavoittuvuuksia.  

