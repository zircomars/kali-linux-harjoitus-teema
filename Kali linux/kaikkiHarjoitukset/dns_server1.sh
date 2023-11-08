# avoimien verkkojen resurssien ja muita passiivisien tiedon keruu tekniikkaa, jotta voidaan kerätä lisää oleellisia tietoja muista, tarkemmista palveluista.
# DNS on usein tuottoisin lähde (source) aktiivisiin tiedonkeruulle. DNS periaatteessa tarjoaa erilaisia tietoja julkisia ja miks ei yksityisissä, jossa organisaation palvelimista kuten on IP-osoite, palvelin serverin nimi ja palvelin funktionaali (toimintoja)

# DNS palvelin yleensä paljastavat DNS- ja sähköpostipalvelimien tietoja verkkotunnuksista (domain), johon sillä on valtanssa. Tämä on välttämätöntä, koska julkiset sähköposti- ja DNS-palvelinosoitteiden pyynnöt muodostavat Internetin peruskokemuksen. 

# Tarkastellaan esimerkiksi megacorpone.com-verkkotunnusta, väärennettyä Internet-näkyvyyttä, jonka rakensimme tätä harjoitusta varten. 

# Käytämme isäntäkomentoa yhdessä parametrin –t (type) kanssa löytääksemme sekä DNS- että sähköpostipalvelimet megacorpone.com-verkkotunnukselle

# Oletusarvoisesti jokaisessa määritetyssä toimialueessa on oltava vähintään toimialueesta vastaavat DNS- ja sähköpostipalvelimet.

#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu start here: 98-

# samat harjoitukset ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 

########################################################################
┌──(kali㉿kali)-[~]
└─$ host -t ns megacorpone.com
megacorpone.com name server ns3.megacorpone.com.
megacorpone.com name server ns1.megacorpone.com.
megacorpone.com name server ns2.megacorpone.com.
                                                                                                                                        
┌──(kali㉿kali)-[~]
└─$ 
                                                                                                                                        
┌──(kali㉿kali)-[~]
└─$ host -t mx megacorpone.com
megacorpone.com mail is handled by 60 mail2.megacorpone.com.
megacorpone.com mail is handled by 50 mail.megacorpone.com.
megacorpone.com mail is handled by 20 spool.mail.gandi.net.
megacorpone.com mail is handled by 10 fb.mail.gandi.net.

########################################################################
# automating Lookups

# kun on tiedossa jokin alustava tieto vaikappa megacorpone.com - domain (verkkotunnus) nimi, niin voidaan jatkaa DNS - requestiä (lisäkyselyä) käyttöön löydetäkseen sen tämän sivuston megacorpone - domain tunnus kuuluviin host:in nimi ja IP-osoite. 

# periaatteessa: For example, we can assume that the megacorpone.com domain has a web server, probably with the hostname www. We can test this theory using the host command once again:

┌──(kali㉿kali)-[~]
└─$ host www.megacorpone.com  
www.megacorpone.com has address 149.56.244.87
                                                                                                                                                            
##########
# seuraavaksi, jos tarkistellaan onko tällä domain (megacorpone.com) sillä on myös palvelin, jonka isäntänimi on idontexist.
# Huomaa ero kyselytulosteiden välillä

┌──(kali㉿kali)-[~]
└─$ host idontexist.megacorpone.com
Host idontexist.megacorpone.com not found: 3(NXDOMAIN)


########################################################################
# forward lookup brute force

# edellisessä harjoituksessa eli (automating lookups), ja nyt tähän lisätään yleisiä host nimejä, johon suoritettaan Bash scriptaus. 

# Tämän tekniikan ideana on arvata palvelimien kelvollisen nimet yrittämällä ratkaista annettu nimi. Jos arvaamasi nimi ratkaisee, tulokset saattavat viitata palvelimen olemassaoloon ja jopa toimivuuteen. Voimme luoda lyhyen (tai pitkän) luettelon mahdollisista isäntänimistä ja kokeilla kutakin host:in komentoa.

# ensimmäisenä toistettaan "www" tonne list.txt sisään , ja sitten sama noi muutkin tulee 
──(kali㉿kali)-[~]
└─$ echo www > list.txt
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo ftp >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo mail >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo owa >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo proxy >> list.txt 
                                                                                   
┌──(kali㉿kali)-[~]
└─$ echo router >> list.txt 

┌──(kali㉿kali)-[~]
└─$ echo api >> list.txt   

# jos tarkistettaan list.txt                                                                                   
┌──(kali㉿kali)-[~]
└─$ cat list.txt 
www
ftp
mail
owa
proxy
router
api


# lisäksi tuohon listaan voisi lisätä kaikki protokollat eli tärkeimmistä TCP/UDP protokollat, ja ehkä mahdollista toimiakin mm. lisäisi http 80, https 443, ja jne, mutta tietty protokollat kuitenkin pitää tarkista mitä lisätään list.txt alle, google ja wikipedia on paras haku työkalu & ja ottaa muilta github tekijältä vähä esimerkkiä mallia

#### step 2
# In this simplified example, we notice that the hostnames www, router, and mail have been discovered through this brute-force attack. The hostnames owa, ftp and proxy, however, were not found.

# tässä periaatteessa for looppin kautta, että käytettän list.txt sisäisiä objektia, että tarkistellaan tämän domain.com (megacorpone.com) verkkotunnus prosessi
# eli tässä tarkistettiin host nimi, www, routeri ja sähköposti, jotka löydettiin näiden raa'an voiman hyökkäyksen avulla, joten host nimet owa, ftp ja proxy, niistä ei löytynyt mitään tietoa
# NXDOMAIN - saattaa tarkoittaa ettei sillä löydy mitään jos tarkistellaan muita esimerkkejä
┌──(kali㉿kali)-[~]
└─$ for ip in $(cat list.txt);do host $ip.megacorpone.com;done
www.megacorpone.com has address 149.56.244.87
Host ftp.megacorpone.com not found: 3(NXDOMAIN)
mail.megacorpone.com has address 51.222.169.212
Host owa.megacorpone.com not found: 3(NXDOMAIN)
Host proxy.megacorpone.com not found: 3(NXDOMAIN)
router.megacorpone.com has address 51.222.169.214
Host api.megacorpone.com not found: 3(NXDOMAIN)

##### toinen esim
# Reverse lookup brute force

# tässä esimerkissä DNS forward brute-force luetto paljasti joukon hajaamia olevia IP-osoiteitta. Jos megacorpone-com sivuston DNS ylläpitäjä (administrator) määritti verkkotunukselle (domain) PTR-recordin, niin saatamme hakkeri/penetraatio testaaja löytää lisää verkkotunnisteen nimeitä (domain name), niin saatetaan löytää lisäää domain nimejä, jotka jäivät huomioimatta "forward look up brute-force" vaiheessa.

#pieni huomiona, toi host IP-osoite (50.7.76.$ip;done) saattaa tuottaa hämäystä penetraatio testaajille & hakkerille, mutta harjoituksen kirjan mukaan niin kantsii kokeilla ja katsoa mitä se oikein tulostaa ja näyttääkin vähä eri osoitteelta verrattuna ylempi komento scripti.

# alemman komentojen merkitykset;
# grep -v :: --invert-match
┌──(kali㉿kali)-[~]
└─$ for ip in $(seq 155 190);do host 50.7.67.$ip;done | grep -v "not found"
155.67.7.50.in-addr.arpa domain name pointer mail.megacorpone.com.
162.67.7.50.in-addr.arpa domain name pointer www.megacorpone.com.
163.67.7.50.in-addr.arpa domain name pointer mail2.megacorpone.com.
164.67.7.50.in-addr.arpa domain name pointer www2.megacorpone.com.
165.67.7.50.in-addr.arpa domain name pointer beta.megacorpone.com.
170.67.7.50.in-addr.arpa domain name pointer ns3.megacorpone.com.
178.67.7.50.in-addr.arpa domain name pointer syslog.megacorpone.com.
179.67.7.50.in-addr.arpa domain name pointer mgmt.megacorpone.com.
180.67.7.50.in-addr.arpa domain name pointer siem.megacorpone.com.
181.67.7.50.in-addr.arpa domain name pointer snmp.megacorpone.com.
182.67.7.50.in-addr.arpa domain name pointer test.megacorpone.com.
186.67.7.50.in-addr.arpa domain name pointer ns1.megacorpone.com.
187.67.7.50.in-addr.arpa domain name pointer admin.megacorpone.com.
188.67.7.50.in-addr.arpa domain name pointer intranet.megacorpone.com.
189.67.7.50.in-addr.arpa domain name pointer vpn.megacorpone.com.
190.67.7.50.in-addr.arpa domain name pointer router.megacorpone.com.
                                                                   
┌──(kali㉿kali)-[~]
└─$

########################################################################
# DNS Zone transfer

#zone transfer on samanalinen kuin tietokannan replikonti toiminta toisiinsa liittyviä DNS-palvelimien välillä
# tämä prosessisisältää zone tiedoston kopioimisen NDS pää palvelimeltao orjapalvelimelle (slave/primary server)
# zone tiedosto sisältää luettelon kaikista tälle zone konfattuile määritetyistä DNS-nimeistä.Zone transfers tulisi yleensä rajoittaa valtuutettuihin (authorized) primary DNS:ään.

# tämä komento muistuu siinä kohdassa kuin; "$host -t ns megacorpone.com" & kun siinä tulostuksessa näkyy tämä "ns1.megacorpone.com" ja se toinen, ja kolmas niin 
┌──(kali㉿kali)-[~]
└─$ host -l megacorpone.com ns1.megacorpone.com
Using domain server:
Name: ns1.megacorpone.com
Address: 51.79.37.18#53
Aliases: 

Host megacorpone.com not found: 5(REFUSED)
; Transfer failed.

# kokeillaan toinen-kolmas zone transfer DNS-nimi
┌──(kali㉿kali)-[~]
└─$ host -l megacorpone.com ns2.megacorpone.com
Using domain server:
Name: ns2.megacorpone.com
Address: 51.222.39.63#53
Aliases: 

megacorpone.com name server ns1.megacorpone.com.
megacorpone.com name server ns2.megacorpone.com.
megacorpone.com name server ns3.megacorpone.com.
admin.megacorpone.com has address 51.222.169.208
beta.megacorpone.com has address 51.222.169.209
fs1.megacorpone.com has address 51.222.169.210
intranet.megacorpone.com has address 51.222.169.211
mail.megacorpone.com has address 51.222.169.212
mail2.megacorpone.com has address 51.222.169.213
ns1.megacorpone.com has address 51.79.37.18
ns2.megacorpone.com has address 51.222.39.63
ns3.megacorpone.com has address 66.70.207.180
router.megacorpone.com has address 51.222.169.214
siem.megacorpone.com has address 51.222.169.215
snmp.megacorpone.com has address 51.222.169.216
support.megacorpone.com has address 51.222.169.218
syslog.megacorpone.com has address 51.222.169.217
test.megacorpone.com has address 51.222.169.219
vpn.megacorpone.com has address 51.222.169.220
www.megacorpone.com has address 149.56.244.87
www2.megacorpone.com has address 149.56.244.87
                                                                                   
┌──(kali㉿kali)-[~]
└─$ host -l megacorpone.com ns3.megacorpone.com
Using domain server:
Name: ns3.megacorpone.com
Address: 66.70.207.180#53
Aliases: 

Host megacorpone.com not found: 5(REFUSED)
; Transfer failed.

# pieni yhteenveto tuosta edellisestä kaksi komennon scriptiä, josta tässä tapauksessa ns1 ja ns3 ovat hylkäneet zone transfer pyynnön ja vain ns3:ssa sallii sen.
# tuloksena megacorpone.com domain nimessä zone transfer:issä tiedoston täydellisen vedos, joka tarjoaa penetraatios testaajille kätevän luettelon listan megacorpone.com domain nimestä IP- ja DNS nimejä

#### jatkuu
# domain nimi (verkkosivu) megacorpone.com:lla on kolme DNS serveriä tarkisteltavinna palvelinta. Joissakn suuressa organisaatiossa saattaaa olla useita DNS-apvelimia, tai penetraatiotestaaja/hakkeri saattaa haluta yrittää zone transfer pyyntöjä tiettyihin toimialuetta vastaan
# seuraavassa Bash scriptissä tulee peliin, jossa suoritettaan zone transfer host-komentoa tarvisemalla kaksi parametriä;
# analysoitava domain nimi ja nimipalvelimen osoite (name server address), jonka saadakseen tietyn toimialueen nimi palvelimen puhtaan formaattin eli..

# alemman komentojen merkitykset;
# -d :: --delimiter=DELIM ;
# -f ::  --fields=LIST select only these fields on each line;
└─$ host -t ns megacorpone.com | cut -d " " -f 4
ns3.megacorpone.com.
ns1.megacorpone.com.
ns2.megacorpone.com.

######## valinnainen , oma harjotius ########
# lisäharjoituksena, tätä voisi jopa kokeilla muita domain nimejä (verkkotunnuksia domain.fi), ja tarkistaa mitä zone transferiä se tulostaa ja jne.
# ja jos saisi niiden IP-osoitteet ja siitä metsätää niiden dns-nimi palvelimet

###### bash script malli
# jos ei muista miten luotiin joku tiedosto niin...
┌──(kali㉿kali)-[~]
└─$ nano dns-axfr.sh

# kopsaa alempi scripti ja tässä scriptissä joka automatisoi jokaisen löydetyn DNS-palvelimien löytämisen ja zone transfer jokaisesta yrittämisestä eli vähä kuin skannaa domain nimen ja löydetyistä dns palvelimesta
## HUOM! kun kopsaa ton scriptin niin pitää tarkista jopa useamman kerran, että miksi toistuu jatkuvasti ongelmia, kun scriptissä on jotakin häikkää 8joko ylimääräinen välilyönti ja jne)
# /bin/bash
# Simple Zone Transfer Bash Script
# $1 is the first argument given after the bash script
# Check if argument was given, if not, print usage
if  [-z "$1" ]; then
echo "[-] Simple Zone transfer script"
echo "[-] Usage : $0 <domain name> "
exit 0
fi

# if argument was given, identify the DNS servers for the domain
for server in $(host ­-t ns $1 | cut ­-d" " ­-f4);do
# For each of these servers, attempt a zone transfer
host -l $1 $server | grep "has address"
done

###### jatkuu
# määrittä chmod 755 oikeudet ja suoritettaan scripti komnnenon kautta 
┌──(kali㉿kali)-[~]
└─$ chmod 755 dns-axfr.sh 

┌──(kali㉿kali)-[~]
└─$ ./dns-axfr.sh megacorpone.com
admin.megacorpone.com has address 51.222.169.208
beta.megacorpone.com has address 51.222.169.209
fs1.megacorpone.com has address 51.222.169.210
intranet.megacorpone.com has address 51.222.169.211
mail.megacorpone.com has address 51.222.169.212
mail2.megacorpone.com has address 51.222.169.213
ns1.megacorpone.com has address 51.79.37.18
ns2.megacorpone.com has address 51.222.39.63
ns3.megacorpone.com has address 66.70.207.180
router.megacorpone.com has address 51.222.169.214
siem.megacorpone.com has address 51.222.169.215
snmp.megacorpone.com has address 51.222.169.216
support.megacorpone.com has address 51.222.169.218
syslog.megacorpone.com has address 51.222.169.217
test.megacorpone.com has address 51.222.169.219
vpn.megacorpone.com has address 51.222.169.220
www.megacorpone.com has address 149.56.244.87
www2.megacorpone.com has address 149.56.244.87


##################################
### DNSRecon
# DNSRecon on edistyksellinen, moderni Pythonilla kirjoitettu DNS luettelo scripti. DNSrecord komennon scriptin suorittamisen "megacorpone.com" domain vastaan tuottaa seuraava tulokset:

# alemman komentojen merkitykset; -d , -t , axfr
# -d :: domain
# -t :: type of Enumeration to perform
# axfr :: test all ns servers for zone transfer

┌──(kali㉿kali)-[~]
└─$  dnsrecon -d megacorpone.com -t axfr
[*] Checking for Zone Transfer for megacorpone.com name servers
[*] Resolving SOA Record
[+]      SOA ns1.megacorpone.com 51.79.37.18
[*] Resolving NS Records
[*] NS Servers found:
[+]      NS ns3.megacorpone.com 66.70.207.180
[+]      NS ns2.megacorpone.com 51.222.39.63
[+]      NS ns1.megacorpone.com 51.79.37.18
[*] Removing any duplicate NS server IP Addresses...
[*]  
[*] Trying NS server 51.222.39.63
[+] 51.222.39.63 Has port 53 TCP Open
[+] Zone Transfer was successful!!
[*]      NS ns1.megacorpone.com 51.79.37.18
[*]      NS ns2.megacorpone.com 51.222.39.63
[*]      NS ns3.megacorpone.com 66.70.207.180
[*]      TXT Try Harder
[*]      TXT google-site-verification=U7B_b0HNeBtY4qYGQZNsEYXfCJ32hMNV3GtC0wWq5pA
[*]      MX @.megacorpone.com fb.mail.gandi.net 217.70.178.217
[*]      MX @.megacorpone.com fb.mail.gandi.net 217.70.178.215
[*]      MX @.megacorpone.com fb.mail.gandi.net 217.70.178.216
[*]      MX @.megacorpone.com fb.mail.gandi.net 2001:4b98:dc4:8::215
[*]      MX @.megacorpone.com fb.mail.gandi.net 2001:4b98:dc4:8::216
[*]      MX @.megacorpone.com fb.mail.gandi.net 2001:4b98:dc4:8::217
[*]      MX @.megacorpone.com spool.mail.gandi.net 217.70.178.1
[*]      MX @.megacorpone.com spool.mail.gandi.net 2001:4b98:e00::1
[*]      A admin.megacorpone.com 51.222.169.208
[*]      A beta.megacorpone.com 51.222.169.209
[*]      A fs1.megacorpone.com 51.222.169.210
[*]      A intranet.megacorpone.com 51.222.169.211
[*]      A mail.megacorpone.com 51.222.169.212
[*]      A mail2.megacorpone.com 51.222.169.213
[*]      A ns1.megacorpone.com 51.79.37.18
[*]      A ns2.megacorpone.com 51.222.39.63
[*]      A ns3.megacorpone.com 66.70.207.180
[*]      A router.megacorpone.com 51.222.169.214
[*]      A siem.megacorpone.com 51.222.169.215
[*]      A snmp.megacorpone.com 51.222.169.216
[*]      A support.megacorpone.com 51.222.169.218
[*]      A syslog.megacorpone.com 51.222.169.217
[*]      A test.megacorpone.com 51.222.169.219
[*]      A vpn.megacorpone.com 51.222.169.220
[*]      A www.megacorpone.com 149.56.244.87
[*]      A www2.megacorpone.com 149.56.244.87
[*]  
[*] Trying NS server 66.70.207.180
[+] 66.70.207.180 Has port 53 TCP Open
[-] Zone Transfer Failed (Zone transfer error: REFUSED)
[*]  
[*] Trying NS server 51.79.37.18
[+] 51.79.37.18 Has port 53 TCP Open
[-] Zone Transfer Failed (Zone transfer error: REFUSED)

######## valinnainen , oma harjotius ########
# lisäharjoituksena, tätä voisi jopa kokeilla muita domain nimejä (verkkotunnuksia domain.fi), ja tarkistaa mitä se tulostaa mm. dns palvelin, ip-sooite, zone transfer, mac osoite ja jne.
# sekä mitä yksityiskohtaisia tietoja se saattaa tulostaa ja hertaja

##################################
### DNSRecon









