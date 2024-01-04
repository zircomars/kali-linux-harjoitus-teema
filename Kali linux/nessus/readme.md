# Nessus

Ohjelmistosovellus, jossa vaadittaan sisään kirjautumista sallii ohjelmiston käyttöä eli tunnuksia sisään ja nessus on oma haavoittuvuuden skanneri. 

Esim. haavoittuvuuksista ja altistumisesta, josta Nessus voi etsiä mm;
- haavoittuvuuden, jotka voivat sallia luvattoman hallinnan tai pääsyn johonkin järjestelmän arkisto tietoihin
- virheellisiä määrityksiä kuten avoimet sähköpostit, puuttuvia korjaustietoja ja jne.
- oletussalasanat (admin : secret) tai muutamia yleisiä salasanoja ja tyhjiä/puuttuvia salasanoja joillakin järjestelmillä. Myös yleisiä helppoja salasanoja vaikappa: password, admin, admin123, 1234 ja jne. Nessus voi myös kutsus Hydran (ulkoisen työkalua) käynnistäkseen sanakirjanhyökkäyksen.
- Palvelun DDos hyökkäyksien haavoittuvuuksia kieltäminen.

Nessus periaatteessa skannaa kattavia laajan valikoman tekniikoita mm. käyttöjärjestelmät, verkkolaitteet, hypervisorit, tietokannat, verkkopalvleimet ja kriittisiä infrastruktuuria. 

Skannauksesta voi olla url linkki joko http tai https - protokolla (http://name.fi) tai kohteen IP-osoite. Harjotuksen kanssa jos harjoittelee tiettyä sovellusta hakkerointiin niin on oman koti/työpaikan lähempänä sitä IP-osoitetta eli alkuun just 192.168.X.Y jotakin, koska käyttää just sitä DHCP:tä.

* [Pien huomio latauksesta ja startup](#pien-huomio-latauksesta-ja-startup)

![Alt text](nessus_image/nessus_1.png)

## Pien huomio latauksesta ja startup

Nessus asennusohjeesta löytyy pientä tarkennusta, että kuinka asentuu. Pieni huomiona kevät 2023 mennään versio 10.x.y jotakin ja se ei tykkää google gmail sähköpostia jotain syystä, kantsii kokeilla jos täydentää omalla työsähköpostilla (esim. vale työsähköposti...)

Nessusta asennettaan virtualikoneen vmware:n sisäisen kali linux ympäristön sisään eli kantsii ensimmäisenä kirjautua kali linux:sen sisään, niin sieltä lataa sitä nessus sovellusta, ja ladatun jälkeen se pitää mennä selaimen osoitteeseen pääteellä tcp/udp protokollalla kuin `8834` eli --> ` https://kali:8834/`

## komennot

Debian, Kali, and Ubuntu <br>
`systemctl <start|stop|status> nessusd`

```
┌──(kali㉿kali)-[~]
└─$ systemctl status nessusd
● nessusd.service - The Nessus Vulnerability Scanner
     Loaded: loaded (/lib/systemd/system/nessusd.service; disabled; preset: disabled)
     Active: active (running) since Sun 2023-12-31 21:08:15 EET; 3s ago
   Main PID: 175331 (nessus-service)
      Tasks: 12 (limit: 2261)
     Memory: 93.6M
        CPU: 2.054s
     CGroup: /system.slice/nessusd.service
             ├─175331 /opt/nessus/sbin/nessus-service -q
             └─175335 nessusd -q

Dec 31 21:08:15 kali systemd[1]: Started nessusd.service - The Nessus Vulnerability Scanner.

```

<br>
Jos on unohtanut kokonaan käyttäjätunnukset ja salasanan niin kantsii resetoida ja mene polkuun kuin ` /opt/nessus/sbin ` ja komennolla toistaa mikä käyttäjä (siis on ollut alunperin) siis ladattu siinä Kali linux ympäristössä (yksi ainoa käyttäjä) ja suoritettaan salasanan muutos samalla. Kun salasana on resetoitu niin on valmis leikkimään taas Nessus;sta ja scannamaan haavoittuvuutta verkostosta.

```
┌──(root㉿kali)-[/opt/nessus/sbin]
└─# ./nessuscli chpasswd
Login to change: Nick96
New password: 
New password (again): 
Password changed for Nick96
                                                                                                      
┌──(root㉿kali)-[/opt/nessus/sbin]
└─#
```

## scannaus

Nessus tekee useita skannauksia ja eri tyyppisiä mm.
-  Basic Network Scan: Generic scan with various checks that are suitable to be used against various target types.
-  Credentialed Patch Audit: Authenticated scan that enumerates missing patches.
-  Web Application Tests: Specialized scan for discovering published vulnerabilities in Web Applications.
-  Spectre and Meltdown: Targeted scan for the Spectre and Meltdown vulnerabilities.

Nessus tukee kohteen lisäämistä IP-osoitteena, IP-alueena tai pilkuilla eroteltuna FQDN- tai IP-luettelona.

![Alt text](nessus_image/nessus_2.png)

# ohjeita ja muita tutoriaalia;

guide; <br>
https://docs.tenable.com/quick-reference/nessus-scan-tuning/Content/PDF/Nessus_Scan_Tuning_Guide.pdf
