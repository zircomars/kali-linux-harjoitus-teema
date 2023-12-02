#tämä scripti on sama kuin edellinen harjoitus, mutta toisella methodilla voidaan tarkstaa dns domainia käyttämällä komentoa kuin "nslookup"
$nslookup <domain | IP-address>

# se periaatteessa näyttää tiedon johon voi käyttää DNS (Domain name system) infrastruktuurin diagnosointiin. Ennen kuin käyttää tätä työkalua pitää tuntea tai ainakin tietää DNS toiminnan. tämä "nslookup" - komento on asentanut TCP/IP-protokollaan.

#nslookup - komennon työkalulla on kaksi tyypistä moodia; "interactive" ja "noninteractive"
# tätä komentoa käytettään etsittäviä yksittäisiä tietoja tai yleisen käyttöön, tätä voi hyödyntä mm. kali linux shellissä tai powershellissä moodilla "noninteractive"

# noninteractive - moodi tarkoittaa komentotilaa, johon parametri on sen tietokoneen nimi tai IP-osoite, jhon halutaan etsiä. Toinen parametri on DNS-nimipalvelin nimi tai IP-osoite. Jos jättää toisen argumentin pois, nslookup käyttää oletusarvoisen DNS-nimipalvelinta.

# interactive - jos on etsittävä useampi tieto tai määritettävä useita määritystä sitten tulee interaktiivi moodi. Interaktiivisen moodissa tulee kirjoittaa viiva (-) ensimmäisen parametrin sijaan nslookup komentoriville. Anna jokin DNS-nimipalvelin nimi tai IP-osoite toiselle parametrille, jos jätät toisen argumentin pois niin nslookup käyttää oletusarvoista DNS-nimipalvelinta. Voi myös käynnistää interaktiivisen tilan kirjoittamalla nslookup - komentoa ja kirjoittamalla sitten etsittävän nimen tai IP-osoitetta interaktiivisen mooodin komentolle.

#############################
#esim1 . interactive mode
# jos haluaa lopettaa nslookup komennon käytön niin CTRl + C 
┌──(kali㉿kali)-[~]
└─$ nslookup                     
> www.google.com
Server:         192.168.240.2
Address:        192.168.240.2#53

Non-authoritative answer:
Name:   www.google.com
Address: 216.58.209.196
Name:   www.google.com
Address: 2a00:1450:4026:808::2004
> 
>


#esim2 . interactive mode
# interaktiivissa lisätän vaihtoehtoja erilliselle riville ennen kyselyä eli > 
set [option]

┌──(kali㉿kali)-[~]
└─$ nslookup
> set type=ns
> google.fi
;; communications error to 192.168.240.2#53: timed out
Server:         192.168.240.2
Address:        192.168.240.2#53

Non-authoritative answer:
google.fi       nameserver = ns4.google.com.
google.fi       nameserver = ns1.google.com.
google.fi       nameserver = ns3.google.com.
google.fi       nameserver = ns2.google.com.

Authoritative answers can be found from:
>  









