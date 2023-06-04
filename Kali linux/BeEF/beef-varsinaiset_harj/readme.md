# BeEF harjoitus

harjoitus menetelmä menee sama kuin badstore tai sillä vastaava, niin katsotaan miten tämän kanssa mennään. Sekä tänne kirjataan varsinaiset harjoitukset eli tähän mennässä mitä on tehty ja mitä havaittu ja jne, sekä mahdollista upotettaan jotakin tiedostoja 

- [BeEF harjoitus](#beef-harjoitus)
    * [Ensimmäinen harjoitus](#ensimmäinen-harjoitus)
    * [Toinen steppi (metasploit)](#toinen-steppi-metasploit)

## Ensimmäinen harjoitus

Harjoitus lähettä sähköpostin esim. itselle ja käyttäen linkkiä (URL) just klikkaa siihen niin mitäköhän tapahtuu seuraavaksi :D

![Alt text](../beef-harj/beef-6.PNG)

```
┌──(kali㉿kali)-[~/Downloads]
└─$ sudo python2 -m SimpleHTTPServer 80  
192.168.240.130 - - [04/Jun/2023 13:51:00] "GET /favicon.ico HTTP/1.1" 404 -
192.168.240.1 - - [04/Jun/2023 13:55:03] "GET /index.html HTTP/1.1" 200 -
192.168.240.130 - - [04/Jun/2023 13:56:44] "GET /index.html HTTP/1.1" 200 -
```

Sähköpostin lähetyksessä laita BeEF hakkeri/valvonta työkalu sen `UI URL:   http://<IP-add>:3000/ui/panel` sen alku IP-osoite, mikä siellä toistuu Kali Linux kommennossa eli `$./beef` eli riittää kopsaa sen alku http ja IP-osoite `(Http://<ip-add>)`


<b>Huomiona tämä on vain harjoitus joten älä käytä tätä lailisesti, koska muuten joutuu linnaan, ja vaikuttaa elämään ja muihin hakkerointiin, sekä tässä on kaapattu käyttäjän sähköposti ja salasanaa</b>

https://www.youtube.com/watch?v=J2J7uFZnG5E


## Toinen steppi (metasploit)

https://ns2.elhacker.net/descargas/manuales/Hacking%20y%20Seguridad%20informatica/BeEF%20Fake%20Browser%20Update%20Exploitation.pdf





