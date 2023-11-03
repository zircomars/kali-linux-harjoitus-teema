https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf


Penetration Testing with Kali Linux & Offensive security v.1.1.6
copyright 2018

joku bash harjoitus (START HERE), 

CHAPT, 1.3 - The Bash environment (page 44-47)

HUOM. tämä harjoitus on suoritettu repl.it (oma harjoitus), ei vmware kal linux ympäristössä

##################################################################
tässä periaatteessa wget vähä kuin lataa cisco kotisivun indeksin kotisivuston wget kommennon avulla

~/TatteredIllCables$ wget www.cisco.com
--2023-11-03 15:49:53--  http://www.cisco.com/
Resolving www.cisco.com (www.cisco.com)... 23.209.24.177, 2600:1409:9800:a97::b33, 2600:1409:9800:a94::b33
Connecting to www.cisco.com (www.cisco.com)|23.209.24.177|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.cisco.com/ [following]
--2023-11-03 15:49:53--  https://www.cisco.com/
Connecting to www.cisco.com (www.cisco.com)|23.209.24.177|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: ‘index.html’

index.html                         [ <=>                                              ]  77.87K  --.-KB/s    in 0.06s   

2023-11-03 15:49:53 (1.21 MB/s) - ‘index.html’ saved [79735]

~/TatteredIllCables$ ls
index.html  main.sh  replit.nix
~/TatteredIllCables$ ls -l index.html 
-rw-r--r-- 1 runner runner 79735 Nov  3 15:49 index.html


tässä alettaan purkkaa grep-komennon avulla kaikki tiedostojen rivit sisältyen stringi "href" - mikä osoittaa sisältyvien riviä ja tulostuu jotakin sekalaista linkkiä ja scriptiä tuloksena

~/TatteredIllCables$ grep "href=" index.html 
<link rel="canonical" href="https://www.cisco.com/"/>
<link rel="alternate" hreflang="x-default" href="https://www.cisco.com"/>


nyt tässä tuloksena , suurin osa riveistä on melko samanlaisia rakenteita ja jotka voivat jakaa erii osiin "/" - merkinä erottimena. Sekä poimii verkkotunnisteen nimien tiedostoa, jotta voidaan käyttää "cut" - komentoa erottimella kolme 3 kenttää
~/TatteredIllCables$ grep "href=" index.html | cut -d "/" -f 3


Tulostuksena sieltä toistuu melko sama optimaalisia tuloksia ja useita linkkejä:

www.cisco.com
www.cisco.com
375704031
com.cisco.androidcisco

cisco-cdc
cisco-cdc
cisco-cdc
li>
li>
li>
us
www.w3.org
us
software.cisco.com
www.cisco.com
www.cisco.com
learninglocator.cloudapps.cisco.com
community.cisco.com
www.cisco.com
us
us
us
www.cisco.com
us
us
learningnetwork.cisco.com
newsroom.cisco.com
www.cisco.com
newsroom.cisco.com
duo.com
newsroom.cisco.com
newsroom.cisco.com
www.youtube.com
www.instagram.com
stop><stop offset="1" stop-color="#6600ff" stop-opacity="0"><


eteenpäin, joten puhdistettaan listojen domain nimet, niin käytettään "grep" filteröintiä koko listauksen linjojen periodia & melko toistaa sama kuin ylempi mutta erilaisella

~/TatteredIllCables$ grep "href=" index.html | cut -d "/" -f 3 | grep "\."
www.cisco.com
www.cisco.com
learninglocator.cloudapps.cisco.com
community.cisco.com
www.cisco.com
www.cisco.com
learningnetwork.cisco.com
newsroom.cisco.com
www.cisco.com
newsroom.cisco.com
duo.com
newsroom.cisco.com
newsroom.cisco.com
www.cisco.com
www.cisco.com
ciscocx.qualtrics.com
www.facebook.com
twitter.com
www.linkedin.com

tämä melko toistaa melko samoja domain nimejä (cisco.com) ja jne, mutta siivosi ainakin jotakin tulokstuksena 

~/TatteredIllCables$  grep "href=" index.html |cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1


mutta jos suoritettaan semmoinen clean listaus, kun on paljon duplikaatiota, niin sortattaan (sort)-komentoa ja (unique (-u)) vaihtoehtoa

~/TatteredIllCables$ grep "href=" index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | sort -u
ciscocx.qualtrics.com
com.cisco.androidcisco
community.cisco.com
duo.com
learninglocator.cloudapps.cisco.com
learningnetwork.cisco.com
newsroom.cisco.com
software.cisco.com
twitter.com
www.cisco.com
www.facebook.com
www.instagram.com
www.linkedin.com
www.w3.org
www.youtube.com


seuraavaksi puhdistettaan tämä olisi käyttö ripaus säännöllisen lausekketa komentoa ohjaamalla tulostettujen tekstitiedosto & eli tulostetujen mukaan kopsauttuu tuohon "list.txt" tiedostoon

~/TatteredIllCables$ cat index.html | grep -o 'http://[^"]*' | cut -d "/" -f 3 | sort -u > list.txt

~/TatteredIllCables$ cat list.txt 
cdn.appdynamics.com
pdx-col.eum-appdynamics.com
schema.org
www.w3.org

nyt on puhtaampi tiedosto näkymä domain nimien linkkejä tuolta cisco.com etusivustoilta. seuraavaksi käytettään "host" komentoa, jokaisessa tekstitiedoson verkkotunnuksien nimessä (Domain name) jossa luotiin löydettäkseen niiden IP-osoite ja voidaan käyttää Bash onliner-silmukkaa tekemään tämä npuolesta


~/TatteredIllCables$ for url in $(cat list.txt); do host $url; done
host: command not installed, but was located via Nix.
Would you like to run host from Nix and add it to your replit.nix file? [Yn]: y
Adding bind.host to replit.nix
success
/nix/store/s9cfm0smq5qi2d1p2f3l02g0ckl8nl7r-bind-9.18.8-host
cdn.appdynamics.com has address 52.84.162.9
cdn.appdynamics.com has address 52.84.162.10
cdn.appdynamics.com has address 52.84.162.5
cdn.appdynamics.com has address 52.84.162.82
host: command not installed, but was located via Nix.
Would you like to run host from Nix and add it to your replit.nix file? [Yn]: y
Adding bind.host to replit.nix
success
/nix/store/s9cfm0smq5qi2d1p2f3l02g0ckl8nl7r-bind-9.18.8-host
pdx-col.eum-appdynamics.com is an alias for col.eum-appdynamics.com.
col.eum-appdynamics.com has address 54.70.132.165
col.eum-appdynamics.com has address 54.245.10.83
col.eum-appdynamics.com has address 52.34.218.207
col.eum-appdynamics.com has address 44.241.253.115
col.eum-appdynamics.com has address 52.35.172.1
col.eum-appdynamics.com has address 44.238.145.143
col.eum-appdynamics.com has address 35.162.201.65
col.eum-appdynamics.com has address 54.190.100.253
host: command not installed, but was located via Nix.
Would you like to run host from Nix and add it to your replit.nix file? [Yn]: n
host: command not installed, but was located via Nix.
Would you like to run host from Nix and add it to your replit.nix file? [Yn]: ^C
Detected change in environment, reloading shell...


tuossa tapahtui jotakin toistumista, se ei tykkää "n" no-lopettamisen komentoa.. 


host komennon avulal antaa kaikenlaisia tuloksia, jossa ei kaikkea oleelista. haluamme jotenkin poimia vain IP-osoitteita kaikista näistä tiedostoista, joten ohjataan tulevien "grep" - estimiseen tekstiä "has address" ja sitten suoritettaan "cut" - leikkaus ja "sort" - lajittelun tulostusta.


~/TatteredIllCables$ for url in $(cat list.txt); do host $url; done | grep "has address" | cut -d " " -f 4 | sort -u
104.18.22.19
104.18.23.19
35.160.0.108
35.162.201.65
44.238.145.143
52.34.218.207
52.35.172.1
52.36.154.158
52.84.162.10
52.84.162.5
52.84.162.82
52.84.162.9
54.148.205.112
54.245.10.83
74.125.199.100
74.125.199.101
74.125.199.102
74.125.199.113
74.125.199.138
74.125.199.139



##################################################################







