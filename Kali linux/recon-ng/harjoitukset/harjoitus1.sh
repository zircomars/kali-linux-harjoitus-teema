# virallinen harjoitus; https://medium.com/@bibinrajbs/using-recon-ng-in-kali-2020-cc76aa3a4a6d
#
#####################
# esim. datan lisääminen esim. jotakin sivustoa ja huom. ennen sitä luodaan joku workspaces (kuin tietokanta)
# tässä harjoitessa tapahtuu tietojen kerrämistä vaikappa sivustojen kautta kerrätyjä IP-osoiteitta, host:ia ja jne
# vaikappa autot

[recon-ng][default] > workspaces create autocars
[recon-ng][autocars] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | autocars   | 2023-12-10 19:48:39 |
  | default    | 2023-12-09 20:56:31 |
  +----------------------------------+

# katsotaan mitä db tarjoakaan.. 
[recon-ng][autocars] > db 
delete  insert  notes   query   schema  

# kokeillaan esim. lisätä sivusto tai joku domain ja tarkistellaan "insert":iä
[recon-ng][autocars] > db insert 
companies        credentials      hosts            locations        ports            pushpins         vulnerabilities  
contacts         domains          leaks            netblocks        profiles         repositories     

[recon-ng][autocars] > db insert domains 
domain (TEXT): toyota.com
notes (TEXT): 
[*] 1 rows affected.
[recon-ng][autocars] > db insert domains 
domain (TEXT): tesla.com
notes (TEXT): 
[*] 1 rows affected.

# tuossa notes kohassa, löin vain ENTER, koska ei ole mitään muistiota tai vastaavaa
# sitten kun tarkistellaan domainia

[recon-ng][autocars] > show domains

  +-------------------------------------------+
  | rowid |   domain   | notes |    module    |
  +-------------------------------------------+
  | 1     | toyota.com |       | user_defined |
  | 2     | tesla.com  |       | user_defined |
  +-------------------------------------------+

[*] 2 rows returned

###############################
# seuraavaksi alettaan kohteen domainia, käyttämällä domainien varsiseen polkuun /reconnainssance/information gathering prosessiin

# jos (default) asetuksissa siinä polkussa ja halutaan muokata yksittäistä database:iä (workspace) listoista niin esim. vaikappa just "autolistat"

[recon-ng][default] > workspaces load autocars
[!] 'whoxy_api' key not set. whoxy_whois module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/domains-companies/censys_companies' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.                                                                                                                             
[!] 'hibp_api' key not set. hibp_breach module will likely fail at runtime. See 'keys add'.
[!] 'hibp_api' key not set. hibp_paste module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/hosts-hosts/censys_query' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.                                                                                                                                       
[!] 'ipinfodb_api' key not set. ipinfodb module will likely fail at runtime. See 'keys add'.
[!] 'bing_api' key not set. bing_ip module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/hosts-hosts/censys_ip' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.  
......
[!] 'shodan_api' key not set. shodan_hostname module will likely fail at runtime. See 'keys add'.
[!] 'spyse_api' key not set. spyse_subdomains module will likely fail at runtime. See 'keys add'.
[!] 'builtwith_api' key not set. builtwith module will likely fail at runtime. See 'keys add'.
[!] 'binaryedge_api' key not set. binaryedge module will likely fail at runtime. See 'keys add'.
[!] 'bing_api' key not set. bing_domain_api module will likely fail at runtime. See 'keys add'.
[!] 'github_api' key not set. github_dorks module will likely fail at runtime. See 'keys add'.
[!] 'google_api' key not set. pushpin module will likely fail at runtime. See 'keys add'.


# tässä näkyvissä (huutomerkit) tarkoittaa, virheilmoituksien taustaa, jossa ei olla määrittänyt/lisänneet API-avainta johiinkin moduuleihin, mikä joka tapauksessa valinnaista. joten voidaan skippata hetkeksi huomioimatta.. ja siksi ei olla ladattu ihan kaikkea moduulia (kannattaa install niitä varmuuden vuoksi muuten debugointi ja workspace noi tommoiset skannaukset ei toimi)

# seuraavaksi haettaan noita "autojen" tyypiä ja haettaan niistä jotakin tietoa, ja näyttää toimivan (ainakin)
# tuloksena läydetiin "hackertarget" moduuli polun "recon kateogirasta"
[recon-ng][autocars] > modules search hack
[*] Searching installed modules for 'hack'...

  Recon
  -----
    recon/domains-hosts/hackertarget

# seuraavaksi, käytettään tätä moduulia ja ladataan tietoja
# periaatteessa mennään siihen tiedoston polkuun ja toistetaan "info" tarkistellaan jotakin kosketavia tietoja

[recon-ng][autocars] > modules 
load    reload  search 
[recon-ng][autocars] > modules load recon/domains-hosts/hackertarget
[recon-ng][autocars][hackertarget] >

[recon-ng][autocars][hackertarget] > info

      Name: HackerTarget Lookup
    Author: Michael Henriksen (@michenriksen)
   Version: 1.1

Description:
  Uses the HackerTarget.com API to find host names. Updates the 'hosts' table with the results.

Options:
  Name    Current Value  Required  Description
  ------  -------------  --------  -----------
  SOURCE  default        yes       source of input (see 'info' for details)

Source Options:
  default        SELECT DISTINCT domain FROM domains WHERE domain IS NOT NULL
  <string>       string representing a single input
  <path>         path to a file containing a list of inputs
  query <sql>    database query returning one column of inputs

# tärkeimistä kohteesta on "descriptions" , "source options --> default kohta"

###########################
# options command


[recon-ng][autocars][hackertarget] > options 
list   set    unset  
[recon-ng][autocars][hackertarget] > options list

  Name    Current Value  Required  Description
  ------  -------------  --------  -----------
  SOURCE  default        yes       source of input (see 'info' for details)

# määritettään joku value tuohon "option" määritykseen, josta se "source Options -> default" kohta

#######################################################
### Method 1 (START HERE) ###
# tässä methodissa/arvossa käytettään kaikkia verkoalueita (distinct domain names) lisättyä erillisiä toimialueita (domains table). Ja harjoituksen kannalta lisättiin kaksi domainia (toyota & tesla).

[recon-ng][autocars][hackertarget] > options set SOURCE default
SOURCE => default
[recon-ng][autocars][hackertarget] > info

      Name: HackerTarget Lookup
    Author: Michael Henriksen (@michenriksen)
   Version: 1.1

Description:
  Uses the HackerTarget.com API to find host names. Updates the 'hosts' table with the results.

Options:
  Name    Current Value  Required  Description
  ------  -------------  --------  -----------
  SOURCE  default        yes       source of input (see 'info' for details)

Source Options:
  default        SELECT DISTINCT domain FROM domains WHERE domain IS NOT NULL
  <string>       string representing a single input
  <path>         path to a file containing a list of inputs
  query <sql>    database query returning one column of inputs

# sitten suorittamaan ja komennolla "run" ja huom siinä toistuu Toyota domainia ja IP-osoiteitta ja jne, sekä sama vastaavasti Tesla

[recon-ng][autocars][hackertarget] > run

----------
TOYOTA.COM
----------
[*] Country: None
[*] Host: toyota.com
[*] Ip_Address: 45.154.183.183
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: wave5000.toyota.com
[*] Ip_Address: 162.246.76.160
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: staging.explore.engage.toyota.com
[*] Ip_Address: 65.8.158.123
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
....................
---------
TESLA.COM
---------
[*] Country: None
[*] Host: tesla.com
[*] Ip_Address: 104.89.118.48
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: o7.ptr6980.tesla.com
[*] Ip_Address: 149.72.144.42
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: email1.tesla.com
[*] Ip_Address: 192.28.144.15
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: apacvpn1.tesla.com
[*] Ip_Address: 8.244.131.215
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: cnvpn1.tesla.com
[*] Ip_Address: 114.141.176.215
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: ptr1.tesla.com
[*] Ip_Address: 117.50.35.199
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None

.............................
[*] --------------------------------------------------
[*] Country: None
[*] Host: apacvpn.tesla.com
[*] Ip_Address: 8.244.67.215
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------

-------
SUMMARY
-------
[*] 548 total (548 new) hosts found.

# kokonais summaltaan molemmista (Toyota & Tesla) löytyi noin paljon eli 500 päälle
# näin voidaan luetella hostnimiä (hostname) ja keskityä toiseksi SOURCE vaihtoehtojen käyttöä

########################################################################

# Unsetting the existing value 
# huom tähän tulostuu neljä eri methodia, mutta kaikki on yhtä hyviä ja riippuu mikä voisi olla helppompi tulostuksena

##################
# method 1 default 
# ennen suorittamista, tarkistellaan ja poistetaan nykyisiä arvoja
# käyttäen; options unset <option> & sekä Current value:sta tulostuksena on tyhjä kenttä
# ja samalla tarkistellaa "info" tietoja

[recon-ng][autocars][hackertarget] > options unset SOURCE
SOURCE => None
[recon-ng][autocars][hackertarget] > info

      Name: HackerTarget Lookup
    Author: Michael Henriksen (@michenriksen)
   Version: 1.1

Description:
  Uses the HackerTarget.com API to find host names. Updates the 'hosts' table with the results.

Options:
  Name    Current Value  Required  Description
  ------  -------------  --------  -----------
  SOURCE                 yes       source of input (see 'info' for details)

Source Options:
  default        SELECT DISTINCT domain FROM domains WHERE domain IS NOT NULL
  <string>       string representing a single input
  <path>         path to a file containing a list of inputs
  query <sql>    database query returning one column of inputs

##################
# method 2 using a string value
# method 2 voidaan määrittää verkkotunnuksien domain nimeä ja tässä esimerkissä haetaan kohteen domain (toyota / tesla)
# $[recon-ng][recon-cars][hackertarget] > options set SOURCE tesla.com

[recon-ng][autocars][hackertarget] > options set SOURCE toyota.com
SOURCE => toyota.com
[recon-ng][autocars][hackertarget] > run

----------
TOYOTA.COM
----------
[*] Country: None
[*] Host: toyota.com
[*] Ip_Address: 45.154.183.183
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: wave5000.toyota.com
[*] Ip_Address: 162.246.76.160
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
............
[*] --------------------------------------------------
[*] Country: None
[*] Host: dev.nonprod.engage.toyota.com
[*] Ip_Address: 18.65.25.18
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None

[*] --------------------------------------------------
[*] Country: None
[*] Host: staging.explore.engage.toyota.com
[*] Ip_Address: 65.8.158.123
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------

-------
SUMMARY
-------
[*] 501 total (0 new) hosts found.
[recon-ng][autocars][hackertarget] > 

##################
# method 3 using a file that contains a list of domains
# luodaan joku file tiedosto, johon tulostettaan noita nimejä vaikappa polkuu eli joku target.txt tiedosto jossa on pari domain sivuston linkkiä & periaatteessa ikään kuin hakee noita "workspace autocars" lisättyä dataa ja skannaa jotakin jännästi 

# txt luominen tapahtuu $touch file.txt
# vaikappa Download tiedostoon 
┌──(kali㉿kali)-[~/Downloads]
└─$ pwd
/home/kali/Downloads

┌──(kali㉿kali)-[~/Downloads]
└─$ cat targets.txt 
toyota.com
tesla.com

# eli jos palataa recon-ng cli liittymäänsä ja SOURCE polun tiedostoon eli targets.txt
# jonka jälkeen suoritettaan moduuli "run" komennolla ja nähdään tulostuksen kohteen toyota ja tesla.com sivustot targets.txt tiedoston sisään

[recon-ng][autocars][hackertarget] > options set SOURCE /home/kali/Downloads/targets.txt
SOURCE => /home/kali/Downloads/targets.txt
[recon-ng][autocars][hackertarget] > run

----------
TOYOTA.COM
----------
[*] Country: None
[*] Host: toyota.com
[*] Ip_Address: 45.154.183.183
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: wave5000.toyota.com
[*] Ip_Address: 162.246.76.160
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: telematicsservice-dc2-10.toyota.com
[*] Ip_Address: 69.25.174.204
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
......................
[*] --------------------------------------------------
[*] Country: None
[*] Host: staging.explore.engage.toyota.com
[*] Ip_Address: 65.8.158.123
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------

---------
TESLA.COM
---------
[*] Country: None
[*] Host: tesla.com
[*] Ip_Address: 23.218.192.46
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: o7.ptr6980.tesla.com
[*] Ip_Address: 149.72.144.42
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
..........................................
[*] --------------------------------------------------
[*] Country: None
[*] Host: email1.tesla.com
[*] Ip_Address: 192.28.144.15
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: testnotify.tesla.com
[*] Ip_Address: 205.234.27.221
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: apacvpn.tesla.com
[*] Ip_Address: 8.244.67.215
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------

-------
SUMMARY
-------
[*] 548 total (1 new) hosts found.

# yhteen vetona muodostoi ton verran 548 hostnimiä
# ennen sitä vähä vilkaistaan "info" "Current value" kategoriaa ja sen polua ja sitä SOURCE:a

[recon-ng][autocars][hackertarget] > info

      Name: HackerTarget Lookup
    Author: Michael Henriksen (@michenriksen)
   Version: 1.1

Description:
  Uses the HackerTarget.com API to find host names. Updates the 'hosts' table with the results.

Options:
  Name    Current Value                     Required  Description
  ------  -------------                     --------  -----------
  SOURCE  /home/kali/Downloads/targets.txt  yes       source of input (see 'info' for details)

Source Options:
  default        SELECT DISTINCT domain FROM domains WHERE domain IS NOT NULL
  <string>       string representing a single input
  <path>         path to a file containing a list of inputs
  query <sql>    database query returning one column of inputs


##################
# method 4 using sql query
# käytettään SQL-queriers ja voidaan asettaa SOURCE-arvoon
# käyttäen malli komentoa ja samassa polussa eli hackertarget; options set <option> query <sql-query>

# esim, [recon-ng][recon-cars][hackertarget] > options set SOURCE query select domain from domains where rowid=2

[recon-ng][autocars][hackertarget] > options set SOURCE query select domain from domains where rowid=2
SOURCE => query select domain from domains where rowid=2

# pien huomio, rowid = 2 vastaa verkkotunnusta tesla.com
# ja tämän jäölkeen voi suorittaa "run" komennon, johon vastaa domainia "tesla.com"

[recon-ng][autocars][hackertarget] > run

---------
TESLA.COM
---------
[*] Country: None
[*] Host: tesla.com
[*] Ip_Address: 104.85.4.91
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: o7.ptr6980.tesla.com
[*] Ip_Address: 149.72.144.42
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------
[*] Country: None
[*] Host: email1.tesla.com
[*] Ip_Address: 192.28.144.15
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
..............
[*] --------------------------------------------------
[*] Country: None
[*] Host: apacvpn.tesla.com
[*] Ip_Address: 8.244.67.215
[*] Latitude: None
[*] Longitude: None
[*] Notes: None
[*] Region: None
[*] --------------------------------------------------

-------
SUMMARY
-------
[*] 47 total (1 new) hosts found.

########################################################################

# Viewing the results
# tarkistellaan tuloksia, ja recon-ng käytettään db-moduulia erilaisissa taulukoissa ja hostia jotka ovat yksi niistä. tarkistellaan mennessä löydettyistä host nimia (hostnames) ja show komennolla

[recon-ng][recon-cars][hackertarget] > show hosts
[recon-ng][autocars][hackertarget] > show hosts

  +-------------------------------------------------------------------------------------------------------------------------------------------------------------+
  | rowid |                               host                               |    ip_address   | region | country | latitude | longitude | notes |    module    |
  +-------------------------------------------------------------------------------------------------------------------------------------------------------------+
  | 1     | toyota.com                                                       | 45.154.183.183  |        |         |          |           |       | hackertarget |
  | 2     | wave5000.toyota.com                                              | 162.246.76.160  |        |         |          |           |       | hackertarget |
  | 3     | telematicsservice-dc2-10.toyota.com                              | 69.25.174.204   |        |         |          |           |       | hackertarget |
  | 4     | ssologin-dc2-10.toyota.com                                       | 69.25.174.214   |        |         |          |           |       | hackertarget |
  | 5     | origin.auth10.toyota.com                                         | 69.25.174.1     |        |         |          |           |       | hackertarget |
  | 6     | mail10.toyota.com                                                | 148.163.159.204 |        |         |          |           |       | hackertarget |
  | 7     | mail20.toyota.com                                                | 148.163.157.204 |        |         |          |           |       | hackertarget |
  | 8     | mail30.toyota.com                                                | 148.163.159.204 |        |         |          |           |       | hackertarget |
  | 9     | mail40.toyota.com                                                | 148.163.157.204 |        |         |          |           |       | hackertarget |
  | 10    | corolla50.toyota.com                                             | 162.209.75.141  |        |         |          |           |       | hackertarget |
  | 11    | c360.toyota.com                                                  | 162.246.78.88   |        |         |          |           |       | hackertarget |
  | 12    | q360.toyota.com                                                  | 150.45.13.43    |        |         |          |           |       | hack
......
ertarget |
  | 500   | dev.nonprod.engage.toyota.com                                    | 18.65.25.18     |        |         |          |           |       | hackertarget |
  | 501   | staging.explore.engage.toyota.com                                | 65.8.158.123    |        |         |          |           |       | hackertarget |
  | 502   | tesla.com                                                        | 104.89.118.48   |        |         |          |           |       | hackertarget |
  | 503   | o7.ptr6980.tesla.com                                             | 149.72.144.42   |        |         |          |           |       | hackertarget |
  | 504   | email1.tesla.com                                                 | 192.28.144.15   |        |         |          |           |       | hackertarget |
  | 505   | apacvpn1.tesla.com                                               | 8.244.131.215   |        |         |          |           |       | hackertarget |
  | 506   | cnvpn1.tesla.com                                                 | 114.141.176.215 |        |         |          |           |       | hackertarget |
  | 507   | ptr1.tesla.com                                                   | 117.50.35.199   |        |         |          |           |       | hackertarget |
  | 550   | tesla.com                                                        | 104.85.4.91     |        |         |          |           |       | hackertarget |
  +-------------------------------------------------------------------------------------------------------------------------------------------------------------+

[*] 550 rows returned

###############################################################
# raportti 

# kun löydetiin jotakin (method 4) yksi niistä tulostuksena niin halutaan niitä ulos mekanisemeina
# tulostuksien komennossa pitää ladata ja käyttäen komentoa $modules search reporting

# mikäli jos ei ole ladannut sellaista pakettia niin pitää ladatta, jota saa raportien tulostukset ulos
# $marketplaces install reporting

# raportien tulostuksena tulee eri tyyppisiä formaatteja joko excel, html, json, list ja jne. 
[recon-ng][autocars] > marketplace install reporting
[*] Module installed: reporting/csv
[*] Module installed: reporting/html
[*] Module installed: reporting/json
[*] Module installed: reporting/list
[*] Module installed: reporting/proxifier
[*] Module installed: reporting/pushpin
[*] Module installed: reporting/xlsx
[*] Module installed: reporting/xml
[*] Reloading modules...
[!] 'whoxy_api' key not set. whoxy_whois module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/domains-companies/censys_companies' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.                                                                                                                         
[!] 'hibp_api' key not set. hibp_breach module will likely fail at runtime. See 'keys add'.
[!] 'hibp_api' key not set. hibp_paste module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/hosts-hosts/censys_query' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.                                                                                                                                   

# periaatteessa komennolla $back - joka mnee yhden polun taakse päin 

# using the reporting html and json module
# kokeilaan ensin ensimmäisenä html moduulia ja jonka jälkeen json moduulia

# eli komennolla ladataan moduuli ladaa ja huom pitää olla siinä workspace polussa (autocars)
# komennolla tab kaks kertaa nii tulostaa vaihtoehtoisia raportia ulos
[recon-ng][autocars] > modules load reporting/
reporting/csv        reporting/json       reporting/proxifier  reporting/xlsx       
reporting/html       reporting/list       reporting/pushpin    reporting/xml        

# tulos löytyy polusta FILENAME /home/kali...../results.html
# kuvauksen mukaan on ainakin HTML on raportti ja SANITIZE tuloksena on tosi
[recon-ng][autocars] > modules load reporting/html
[recon-ng][autocars][html] > info

      Name: HTML Report Generator
    Author: Tim Tomes (@lanmaster53)
   Version: 1.0

Description:
  Creates an HTML report.

Options:
  Name      Current Value                                          Required  Description
  --------  -------------                                          --------  -----------
  CREATOR                                                          yes       use creator name in the report footer
  CUSTOMER                                                         yes       use customer name in the report header
  FILENAME  /home/kali/.recon-ng/workspaces/autocars/results.html  yes       path and filename for report output
  SANITIZE  True                                                   yes       mask sensitive data in the report

# ehkä vähä turha panikoida ja avaa toisesta cmd ikkunaa ja tarkistaa, kun siellä puuttuu jotaikn komentoa ja määritystä eli konnfaukset niin tulostuksena näyttää tältä

┌──(kali㉿kali)-[~/.recon-ng/workspaces/autocars]
└─$ pwd
/home/kali/.recon-ng/workspaces/autocars

┌──(kali㉿kali)-[~/.recon-ng/workspaces/autocars]
└─$ ls
config.dat  data.db

# seuraavaksi, asetettaan value options saataviksi
# sekä määritettään se html johonkin sopivaan paikkaan vaikapa helppoiten Download polkuun ja anna sopivan nimi, joka tulee html:ksi
# huom kantsii olla tarkana onko siellä useampi kansio ja jne
# sitten "run" suorittamaan toimintaa

[recon-ng][autocars][html] > options set CREATOR kali
CREATOR => kali
[recon-ng][autocars][html] > options set CUSTOMER CAR WORLD
CUSTOMER => CAR WORLD
[recon-ng][autocars][html] > options set FILENAME /home/kali/Downloads/recon-cars-results.html
FILENAME => /home/kali/Downloads/recon-cars-results.html
[recon-ng][autocars][html] > run
[*] Report generated at '/home/kali/Downloads/recon-cars-results.html'.

# siinä se tiedosto
┌──(kali㉿kali)-[~/Downloads]
└─$ ls
recon-cars-results.html
command.txt      file1.txt     images.jpeg  targets.txt

################################
# toinen raportointi , kokeillaan json
[recon-ng][autocars] > modules load reporting/json
[recon-ng][autocars][json] > info

      Name: JSON Report Generator
    Author: Paul (@PaulWebSec)
   Version: 1.0

Description:
  Creates a JSON report.

Options:
  Name      Current Value                                          Required  Description
  --------  -------------                                          --------  -----------
  FILENAME  /home/kali/.recon-ng/workspaces/autocars/results.json  yes       path and filename for report output
  TABLES    hosts, contacts, credentials                           yes       comma delineated list of tables


# tässä tiedostossa näyttää paljon vähemmän ja määrityksiäkin on vähemmän, ja noin helppoa?
# sitten "run" komentoa ja suorittamaan json
[recon-ng][autocars][json] > options set FILENAME /home/kali/Downloads/autocar-result.json
FILENAME => /home/kali/Downloads/autocar-result.json
[recon-ng][autocars][json] > run
[*] 550 records added to '/home/kali/Downloads/autocar-result.json'.


# siinä se tiedosto json tiedosto löytyy Downloads tiedoston alta
┌──(kali㉿kali)-[~/Downloads]
└─$ ls
recon-cars-results.html
autocar-result.json      file1.txt     images.jpeg  targets.txt








