# User information gathering - käyttäjän tietojen keräämiset

# Käyttäjien tieotjen keräämisestä on kohteen organisaation/yrityksien resurssia, josta voidaan kerätä tietoa myös oman tai tutun yrityksien työntekijöitä. Sen tarkoituksena on kerätä näitä tietojan koota käyttäjiä- ja salasana luetteloita, käyttää tekosyitä (sosiaalisen manipulointia, lisätä tietojenkalastelu sähköpostia/kampanijoita tai asiakaspuolen hyökkäystä, suorittaa tunnisteita tietojen keräämiseen ja jne. 

# Osat penetraation testauksesta voidaan rajoittua puhtaasti teknisen testaukseen ilman sosiaalisen manipulointia suunnittelluun, mutta toimeksiannoilla voi olla vähän tai ei ollenkaan rajoitusta.

# Penetraatio testauksessa pitää olla varovainen, kun alkaa kerätä tietoja käyttäjistä, mutta silti tietoturva harjoittelija tai specialisti parantaa client's security prosessia ja eivät välttämättä saa ketään irtisanottua. Kuitenkin ei haluta rikkoa lakeja. Yrityksessä voi olla valtuutettui testaajia vain omissa tietyissä järjestelmissä. Työntekijä henkilökohtaiset laitteet, kolmanen osapuolen sähköpostit ja sosiaalisen median tilit jäävät yleensä tämän valtuutuksen ulkopuolelle.

########################
# email harvesting

#sähköpostien kerääminen eli käyttäjäntietoja. Tässä harjoituksessa käytettään "theharvester", joka kerää sähköpostit, nimet, subdomainit, IP-osoitteet ja URL-osoitteet julkisisita tietolähteestä
# määrityksessä komennossa käytettään jsut "theharvesting" komennolla -d ja määritäkseen kohdeverkkotunnusta (domain) ja -b:llä asetakseen tietolähdettä
# ja huom tätä pitää super root:ia eli "root" käyttistä.

# tässä pitää käyttä "theHarverster" ja se pieni h , "theharvester" on vanhentunut jos sitä käyttää
┌──(root㉿kali)-[/home/kali]
└─# theharvester -d megacorpone.com -b google
┏━(Message from Kali developers)
┃
┃ The command theharvester is deprecated. Please use theHarvester instead.
┃
┗━

# uusi yritys ja katsotaan lisätietoa -h help
┌──(root㉿kali)-[/home/kali]
└─# theHarvester -h                                    
*******************************************************************
*  _   _                                            _             *
* | |_| |__   ___    /\  /\__ _ _ ____   _____  ___| |_ ___ _ __  *
* | __|  _ \ / _ \  / /_/ / _` | '__\ \ / / _ \/ __| __/ _ \ '__| *
* | |_| | | |  __/ / __  / (_| | |   \ V /  __/\__ \ ||  __/ |    *
*  \__|_| |_|\___| \/ /_/ \__,_|_|    \_/ \___||___/\__\___|_|    *
*                                                                 *
* theHarvester 4.2.0                                              *
* Coded by Christian Martorella                                   *
* Edge-Security Research                                          *
* cmartorella@edge-security.com                                   *
*                                                                 *
*******************************************************************
usage: theHarvester [-h] -d DOMAIN [-l LIMIT] [-S START] [-p] [-s] [--screenshot SCREENSHOT] [-v] [-e DNS_SERVER] [-r] [-n] [-c] [-f FILENAME] [-b SOURCE]

theHarvester is used to gather open source intelligence (OSINT) on a company or domain.

options:
  -h, --help            show this help message and exit
  -d DOMAIN, --domain DOMAIN
                        Company name or domain to search.
  -l LIMIT, --limit LIMIT
                        Limit the number of search results, default=500.
  -S START, --start START
                        Start with result number X, default=0.
  -p, --proxies         Use proxies for requests, enter proxies in proxies.yaml.
  -s, --shodan          Use Shodan to query discovered hosts.
  --screenshot SCREENSHOT
                        Take screenshots of resolved domains specify output directory: --screenshot output_directory
  -v, --virtual-host    Verify host name via DNS resolution and search for virtual hosts.
  -e DNS_SERVER, --dns-server DNS_SERVER
                        DNS server to use for lookup.
  -r, --take-over       Check for takeovers.
  -n, --dns-lookup      Enable DNS server lookup, default False.
  -c, --dns-brute       Perform a DNS brute force on the domain.
  -f FILENAME, --filename FILENAME
                        Save the results to an XML and JSON file.
  -b SOURCE, --source SOURCE
                        anubis, baidu, bevigil, binaryedge, bing, bingapi, bufferoverun, censys, certspotter, crtsh, dnsdumpster, duckduckgo, fullhunt, github-
                        code, hackertarget, hunter, intelx, omnisint, otx, pentesttools, projectdiscovery, qwant, rapiddns, rocketreach, securityTrails, sublist3r,
                        threatcrowd, threatminer, urlscan, virustotal, yahoo, zoomeye


# esim $theHarvester -d <DOMAIN> -b all
# huom. tämä ei toimi ja mahdollista suurin osa on poistettu googlesta? $theHarvester -d <DOMAIN> -b google
# ei tarvitse mennä ihan kirjan mukaan (offensive security oscp by offensive security 2020) teorian mukaan ja kantsii googlettaa mitä voisi esim. testata

┌──(root㉿kali)-[/home/kali]
└─# theHarvester -d medium.com -b all       
*******************************************************************
*  _   _                                            _             *
* | |_| |__   ___    /\  /\__ _ _ ____   _____  ___| |_ ___ _ __  *
* | __|  _ \ / _ \  / /_/ / _` | '__\ \ / / _ \/ __| __/ _ \ '__| *
* | |_| | | |  __/ / __  / (_| | |   \ V /  __/\__ \ ||  __/ |    *
*  \__|_| |_|\___| \/ /_/ \__,_|_|    \_/ \___||___/\__\___|_|    *
*                                                                 *
* theHarvester 4.2.0                                              *
* Coded by Christian Martorella                                   *
* Edge-Security Research                                          *
* cmartorella@edge-security.com                                   *
*                                                                 *
*******************************************************************

[*] Target: medium.com 


[!] Missing API key for binaryedge. 

[!] Missing API key for Censys ID and/or Secret. 

[!] Missing API key for fullhunt. 

[!] Missing API key for Github. 

[!] Missing API key for Hunter. 

[!] Missing API key for Intelx. 

[!] Missing API key for PentestTools. 

[!] Missing API key for ProjectDiscovery. 

[!] Missing API key for RocketReach. 

[!] Missing API key for Securitytrail. 

[!] Missing API key for virustotal. 

[!] Missing API key for zoomeye. 
An exception has occurred: Cannot serialize non-str key None
[*] Searching Anubis. 
An exception has occurred: Cannot connect to host dns.bufferover.run:443 ssl:<ssl.SSLContext object at 0x7f16b4921490> [Name or service not known]                   
        Searching 0 results.                                                                                                                                         
[*] Searching Bing.                                                                                                                                                  
        Searching results.                                                                                                                                           
[*] Searching Certspotter.                                                                                                                                           
[*] Searching Baidu.                                                                                                                                                 
[*] Searching CRTsh.                                                                                                                                                 
[*] Searching Dnsdumpster.                                                                                                                                           
[*] Searching Hackertarget.                                                                                                                                          
[*] Searching Duckduckgo.                                                                                                                                            
[*] Searching Otx.                                                                                                                                                   
[*] Searching Qwant.                                                                                                                                                 
An exception has occurred: Cannot connect to host api.sublist3r.com:443 ssl:<ssl.SSLContext object at 0x7f16b6fef380> [[SSL: WRONG_VERSION_NUMBER] wrong version number (_ssl.c:992)]                                                                                                                                                     
[*] Searching Sublist3r.                                                                                                                                             
An exception has occurred: Cannot connect to host www.threatcrowd.org:443 ssl:True [SSLCertVerificationError: (1, "[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: Hostname mismatch, certificate is not valid for 'www.threatcrowd.org'. (_ssl.c:992)")]                                                                     
string indices must be integers, not 'str'                                                                                                                           
[*] Searching Threatcrowd.                                                                                                                                           
[*] Searching Rapiddns.                                                                                                                                              
[*] Searching Threatminer.                                                                                                                                           
[*] Searching Urlscan.                                                                                                                                               
An exception has occurred: 0, message='Attempt to decode JSON with unexpected mimetype: text/html; charset=utf-8', url=URL('https://sonar.omnisint.io/all/medium.com?page=1')                                                                                                                                                             
[*] Searching Omnisint.                                                                                                                                              
                                                                                                                                                                     
[*] ASNS found: 17                                                                                                                                                   
--------------------                                                                                                                                                 
AS132203                                                                                                                                                             
AS13335                 
......
AS54825                                                                                                                                                              
AS57724                                                                                                                                                              
                                                                                                                                                                     
[*] LinkedIn Links found: 0                                                                                                                                          
---------------------                                                                                                                                                
                                                                                                                                                                     
[*] IPs found: 534                                                                                                                                                   
-------------------                                                                                                                                                  
1.1.1.1                                                                                                                                                              
222.186.50.3                                                                                                                                                         
222.186.130.211                                                                                                                                                      
222.186.130.217                                                                                                                                                      
223.4.246.38                                                                                                                                                         
2606:4700:3032::ac43:c667                                                                                                                                            
2606:4700:3033::ac43:c54f                                                                                                                                            
2606:4700:3108::ac42:2b50                                                                                                                                            
2606:4700:310c::ac42:2c3c                                                                                                                                            
2606:4700:310c::ac42:2c78   
........
2a06:98c1:3120::3                                                                                                                                                    
2a06:98c1:3121::9                                                                                                                                                    
                                                                                                                                                                     
[*] No emails found.                                                                                                                                                 
                                                                                                                                                                     
[*] Hosts found: 10970                                                                                                                                               
---------------------                                                                                                                                                
000000000.medium.com:162.159.152.4, 162.159.153.4                                                                                                                    
000000000.medium.com:162.159.153.4                                                                                                                                   
0x000000000.medium.com:162.159.153.4, 162.159.152.4                                                                                                                  
0x000000000.medium.com:162.159.152.4
0xaniket.medium.com:162.159.153.4, 162.159.152.4                                                                                                                     
1998design.medium.com:2606:4700:7::a29f:9904                                                                                                                         
1998design.medium.com:2606:4700:7::a29f:9804                                                                                                                         
1cyb3rs3curity1.medium.com:2606:4700:7::a29f:9804                                                                                                                    
....
zvuk71.medium.com:2606:4700:7::a29f:9904                                                                                                                             
zyfangx.medium.com:2606:4700:7::a29f:9804                                                                                                                            
zyfangx.medium.com:2606:4700:7::a29f:9904                                                                                                                            

# tulostuksena ei löytynyt yhtäkään sähköpostia (No emails found) outoa?
# tietojen keräämisessä ei ole aina siistiä, lineaarisessa prosessissa. Tietojen etsimisessä kuitenkin käyttäjistä ja löytäää jotakin muuta kohteesta.

##################################################################
# toinen esim, josta haettaan "megacorpone.com" :sta tietoa

┌──(kali㉿kali)-[~]
└─$ theHarvester -d megacorpone.com -b all
*******************************************************************
*  _   _                                            _             *
* | |_| |__   ___    /\  /\__ _ _ ____   _____  ___| |_ ___ _ __  *
* | __|  _ \ / _ \  / /_/ / _` | '__\ \ / / _ \/ __| __/ _ \ '__| *
* | |_| | | |  __/ / __  / (_| | |   \ V /  __/\__ \ ||  __/ |    *
*  \__|_| |_|\___| \/ /_/ \__,_|_|    \_/ \___||___/\__\___|_|    *
*                                                                 *
* theHarvester 4.2.0                                              *
* Coded by Christian Martorella                                   *
* Edge-Security Research                                          *
* cmartorella@edge-security.com                                   *
*                                                                 *
*******************************************************************

[*] Target: megacorpone.com 


[!] Missing API key for binaryedge. 

[!] Missing API key for Censys ID and/or Secret. 

[!] Missing API key for fullhunt. 

[!] Missing API key for Github. 

[!] Missing API key for Hunter. 

[!] Missing API key for Intelx. 

[!] Missing API key for PentestTools. 

[!] Missing API key for ProjectDiscovery. 

[!] Missing API key for RocketReach. 

[!] Missing API key for Securitytrail. 

[!] Missing API key for virustotal. 

[!] Missing API key for zoomeye. 
An exception has occurred: Cannot serialize non-str key None
[*] Searching Anubis. 
        Searching 0 results.                                                     
[*] Searching Bing.                                                              
An exception has occurred: Cannot connect to host dns.bufferover.run:443 ssl:<ssl.SSLContext object at 0x7f24517b24e0> [Name or service not known]                
        Searching results.                                                       
[*] Searching Certspotter.                                                       
[*] Searching Baidu.                                                             
[*] Searching CRTsh.                                                             
[*] Searching Duckduckgo.                                                        
[*] Searching Hackertarget.                                                      
[*] Searching Dnsdumpster.                                                       
[*] Searching Otx.                                                               
[*] Searching Qwant.                                                             
An exception has occurred: Cannot connect to host api.sublist3r.com:443 ssl:<ssl.SSLContext object at 0x7f2453d9eba0> [[SSL: WRONG_VERSION_NUMBER] wrong version number (_ssl.c:992)]                                                              
[*] Searching Sublist3r.                                                         
[*] Searching Rapiddns.                                                          
An exception has occurred: Cannot connect to host www.threatcrowd.org:443 ssl:True [SSLCertVerificationError: (1, "[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: Hostname mismatch, certificate is not valid for 'www.threatcrowd.org'. (_ssl.c:992)")]                                                               
string indices must be integers, not 'str'                                       
[*] Searching Threatcrowd.                                                       
[*] Searching Urlscan.                                                           
[*] Searching Threatminer.                                                       
An exception has occurred: 0, message='Attempt to decode JSON with unexpected mimetype: text/html; charset=utf-8', url=URL('https://sonar.omnisint.io/all/megacorpone.com?page=1')                                                                 
[*] Searching Omnisint.                                                          
                                                                                 
[*] ASNS found: 3                                                                
--------------------                                                             
AS14618                                                                          
AS16276                                                                          
AS33724                                                                          
                                                                                 
[*] Interesting Urls found: 11                                                   
--------------------                                                             
http://admin.megacorpone.com                                                     
http://admin.megacorpone.com/                                                    
http://admin.megacorpone.com/admin/index.html                                    
http://intranet.megacorpone.com/                                                 
http://mail.megacorpone.com                                                      
...........                                          
https://www.megacorpone.com/                                                     
                                                                                 
[*] LinkedIn Links found: 0                                                      
---------------------                                                            
                                                                                 
[*] IPs found: 8                                                                 
-------------------                                                              
3.220.87.155
.....
149.56.244.87                                                                    
                                                                                 
[*] No emails found.                                                             
                                                                                 
[*] Hosts found: 103                                                             
---------------------                                                            
admin.megacorpone.com:51.222.169.208                                             
admin.megacorpone.com:50.7.20.244                                                
beta.megacorpone.com:50.7.67.165                                                 
.....                                         
megacorpone.com:mail.megacorpone.com                                             
megacorpone.com:mail2.megacorpone.com.                                           
megacorpone.com:mail2.megacorpone.com                                            
mgmt.megacorpone.com                                                             
mgmt.megacorpone.com:50.7.67.179                                                 
ns1.megacorpone.com:50.7.67.186                                                  
ns1.megacorpone.com:51.79.37.18                                                  
ns2.megacorpone.com:50.7.20.242                                                  
ns2.megacorpone.com:51.222.39.63                                                 
ns3.megacorpone.com:66.70.207.180                                                
........                                               
www.megacorpone.com:149.56.244.87                                                
www.megacorpone.com:50.7.67.162                                                  
www2.megacorpone.com:50.7.67.164                                                 
www2.megacorpone.com:149.56.244.87      

#####################################################################
# Password Dumps
# haitalliset/rikolliset hakkerit jättävät usein rikotut kirjautumistiedotteet "Pastebin" sivustolle tai muihin vähempien arvostettuihin verkkosivustoille
# näiden salasanavedokset voivat olla erittäin arvokkaita sanalistoja luomisessa (generating wordlists), esim. kali linux on "rockyou" jossa on sanaluettelo monipuolisista ja yleisestä salasanasta esim. jos käyttää salasanaa "Dog" , joka on kuitenkkin luetu tietomurron seurauksena vuonna 2009.

# käyttäjien luettelon ajalla löydetäkseen sähköpostiluetteloa tarkistamisessa salasanojen kirjaamisen varalta voi palajstua salasanoja, joihin voidaan käyttää tunnistetietoja täyttämishyökkäykseen (credential stuffing attacks)
