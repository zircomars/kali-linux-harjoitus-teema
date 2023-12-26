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



