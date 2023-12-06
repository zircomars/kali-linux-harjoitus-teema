# Offensive-Security-OSCP-by-Offensive-Security_2020
# https://blactec.biz/wp-content/uploads/2021/09/Offensive-Security-OSCP-by-Offensive-Security%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90.pdf

#tämä on sama idea kuin toi vanhempi 2018 julkaistettu versio, mutta tässä harjoituksessa käytettään sen esimerkkin linkkiä "megacorpone.com" 
#tätä voi periaatteessa suorittaa virallisesti omass kali linux:sessa, mutta testaan repl.it bash:in kautta

# PAGE START 129 - 135 (EXAMPLE 3)

# penetraatiotestauksessa yritettään usein löytää tehokkuutta minimoidakseen datan analysointia kuluvien ajan, josta erityisesti erilaisten skannausten aikana palutettavien datamäärää.
# porttien skannaus on prosessi johon tarkastetaan etäkoneen TCP- tai UDP porttien tarkotuksena on havaita mitkä palveluiden kohteet ovat käynnissä ja mitä hyökkäysvektoria mahdollisesti on olemassa.

# eli suoritettaan porttiskannausta ensin koko aliverkon löydetäkseen mahdolliset avoimet verkkopalvelut
# kun saavutttaan porttienskannsuta ensin koko aliverkon löydetäkseen mahdollisen avoimet verkkopalvelut (open web services), minkä jälkeen voidaan selata niiden verkkosivuja manuaalisesti

##################################
# tätä suoritettiin kali linux, niin katsotaan omalla versiolla  et meneekö läpi..? mutta ainakin ainoana on toi badstore IP osoite

Ennen sitä luodaan joku tyhjä kansio
┌──(kali㉿kali)-[~]
└─$ mkdir temp

┌──(kali㉿kali)-[~]
└─$ cd temp   

# kun tiedosto on luotu niin mennään siihen kansion polkuun ja määritettään verkon skannausta. Keskityttään ensin porttiin protokollaan 80, johon laajuus pysyy jossain määritettävien hallittavissa ja käytetään nmap työkalua 

# periaatteessa tässä komennon skannauksessa tapahtuu -A (aggressivisen skannaus), -p määrittää portin tai tiettyn porttin alueeseen (TCP/IP), --open palauttaa vain koneet eli IP-osoitte alue ja siinä perässä maski alue, -oG tallentaa tarkistuksen tuloksen greppable muodossa.

┌──(kali㉿kali)-[~/temp]
└─$ sudo nmap -A -p80 --open 54.177.2000/24 -oG nmap-scan_54.177.200120-129
Starting Nmap 7.93 ( https://nmap.org ) at 2023-12-04 20:55 EET
Nmap scan report for 54.177.200129
Host is up (0.0012s latency).

PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 1.3.28 ((Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c)
| http-methods: 
|_  Potentially risky methods: TRACE
| http-robots.txt: 5 disallowed entries 
|_/cgi-bin /scanbot /backup /supplier /upload
|_http-title: Welcome to BadStore.net v1.2.3s
|_http-server-header: Apache/1.3.28 (Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c
MAC Address: 00:0C:29:33:A0:BB (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 2.4.X
OS CPE: cpe:/o:linux:linux_kernel:2.4
OS details: Linux 2.4.18 - 2.4.35 (likely embedded)
Network Distance: 1 hop

TRACEROUTE
HOP RTT     ADDRESS
1   1.19 ms 54.177.200129

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (5 hosts up) scanned in 19.01 seconds

#####################
# seuraavassa kohdassa on tarkistellaan vähä tarkempaa yksityiskohtaisia kohtia..

┌──(kali㉿kali)-[~/temp]
└─$ ll
total 4
-rw-r--r-- 1 root root 452 Dec  4 20:55 nmap-scan_54.177.200120-129

# tulostuksena jokaisen rivin IP-osoite toistetaan, että näyttää laitteen tilan ja toisen skannattavien portin numero.
┌──(kali㉿kali)-[~/temp]
└─$ cat nmap-scan_54.177.200120-129 
# Nmap 7.93 scan initiated Mon Dec  4 20:55:17 2023 as: nmap -A -p80 --open -oG nmap-scan_54.177.200120-129 54.177.2000/24
Host: 54.177.200129 ()        Status: Up
Host: 54.177.200129 ()        Ports: 80/open/tcp//http//Apache httpd 1.3.28 ((Unix) mod_ssl|2.8.15 OpenSSL|0.9.7c)/   OS: Linux 2.4.18 - 2.4.35 (likely embedded)       Seq Index: 196  IP ID Seq: All zeros
# Nmap done at Mon Dec  4 20:55:35 2023 -- 256 IP addresses (5 hosts up) scanned in 19.01 seconds

#################
# seuraavasa steppissä greppataan portin 80 sisältäviä taustoi & ja tässä jotakin on merkitemättömiä tuloksia..

┌──(kali㉿kali)-[~/temp]
└─$ cat nmap-scan_54.177.200120-129 | grep 80
# Nmap 7.93 scan initiated Mon Dec  4 20:55:17 2023 as: nmap -A -p80 --open -oG nmap-scan_54.177.200120-129 54.177.2000/24
Host: 54.177.200129 ()        Ports: 80/open/tcp//http//Apache httpd 1.3.28 ((Unix) mod_ssl|2.8.15 OpenSSL|0.9.7c)/   OS: Linux 2.4.18 - 2.4.35 (likely embedded)       Seq Index: 196  IP ID Seq: All zeros


#################
# seuraavaksi suljetaan / poistetaan grep-komennolla -v, joka "reverse-grep", joka näyttää vain rivit, johon eivät vastaa hakumerkkijonoa. Eli poistetaan haluamia rivejä ja jotka sisältävät isoja ja pien kirjaimia avainsanalla "Nmap"

# eli poisti jotakin turhia komentoja mitä emme halua tai sitä avainsanaa
┌──(kali㉿kali)-[~/temp]
└─$ cat nmap-scan_54.177.200120-129 | grep 80 | grep -v "Nmap" 
Host: 54.177.200129 ()        Ports: 80/open/tcp//http//Apache httpd 1.3.28 ((Unix) mod_ssl|2.8.15 OpenSSL|0.9.7c)/   OS: Linux 2.4.18 - 2.4.35 (likely embedded)       Seq Index: 196  IP ID Seq: All zeros


#################
# seuraavaksi yritetään poimia vain IP-osoiteitta, koska tämä on ns. ikään kuin yksi asia, josta haetaan lisätietoa. Käytetään "awk"-komentoa toisen kentään tulostukseen käyttäen (väli/space)

# kirjassa on useampi IP-osoite, siksi siinä on 10.11.1.1-254 (alue)

┌──(kali㉿kali)-[~/temp]
└─$ cat nmap-scan_54.177.200120-129 | grep 80 | grep -v "Nmap" | awk '{print$2}'
54.177.200129


#################
# seuraavassa for-loop komennossa käytetään Bash looppia, johon IP-luettelon lävitse ja suoritettaan "cutycapt", joka on Qt WebKit - verkkosivujen kaappausohjelma. Käytetään sitä -url osoitetta määritelmällä kohdesivustoa ja -out -määritäkseen tulostiedoston nimeä

$for ip in $(cat nmap-scan_10.11.1.1-254 | grep 80 | grep -v "Nmap" |
awk '{print $2}'); do cutycapt --url=$ip --out=$ip.png;done


# kun tätä looppia on suorittanut niin löydetään kehotetta, jotta voidaan tarkistaa Bash one-liner:iä ohjelmalla luomista tulostiedostoja luetteloa -1 - options vaihtoehdon ls:lle eli........


┌──(kali㉿kali)-[~/temp]
└─$ for ip in $(cat nmap-scan_54.177.200120-129 | grep 80 | grep -v "Nmap" | awk '{print $2}'); do cutycapt --url=$ip --out=$ip.png;done


# eli pitäisi tulostua useampi png kuvia, mutta en tiedä miksi badstoressa ei toistunut..
kali@kali:~/temp$ ls -1 *.png
10.11.1.10.png
10.11.1.115.png
...

###
# tässä väliin luodaan joku scripti josta, voi ottaa noiden generoitujen/haettujen png kuvia tiedostoja yksittelen, ja tarkistella ja automatisoida sitä dataa HTML-tietojen kautta.

┌──(kali㉿kali)-[~/temp]
└─$ cat file1.sh
#!/bin/bash
# Bash script to examine the scan results through HTML.
echo "<HTML><BODY><BR>" > web.html
ls -1 *.png | awk -F : '{ print $1":\n<BR><IMG SRC=\""$1""$2"\" width=600><BR>"}' >> w
eb.html
echo "</BODY></HTML>" >> web.html

# periaatteessa tämän jälkeen pikku hiljaa scriptin kautta lukea tiedostn noita kuvia, sekä toistuu siinä html sivustolla ja näin saadaan ns. melkein kuin toimiva serveri ja firefox selaimella toistuu se html sivusto.

┌──(kali㉿kali)-[~/temp]
└─$ sudo chmod +x ./file1.sh 
[sudo] password for kali: 

┌──(kali㉿kali)-[~/temp]
└─$ ./file1.sh 
ls: cannot access '*.png': No such file or directory
./file1.sh: line 5: eb.html: command not found

┌──(kali㉿kali)-[~/temp]
└─$ firefox web.html      
[GFX1-]: Unrecognized feature ACCELERATED_CANVAS2D
Missing chrome or resource URL: resource://gre/modules/UpdateListener.jsm
Missing chrome or resource URL: resource://gre/modules/UpdateListener.sys.mjs
^CExiting due to channel error.
Exiting due to channel error.
Exiting due to channel error.
Exiting due to channel error.
Exiting due to channel error.
Exiting due to channel error.






