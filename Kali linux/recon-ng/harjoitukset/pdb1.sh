# pdb is a debugger (debuggointi) eli virheidenjäljittämiset ja kaikki viat/troubleshootit

[recon-ng][default] > pdb.set_trace()
--Return--
> /usr/share/recon-ng/recon/core/framework.py(1291)do_pdb()->None
-> pdb.set_trace()
(Pdb) 

#db module (database module)
[recon-ng][ipgeo] > db 
delete  insert  notes   query   schema  

#####################
# db (esim1)
# esim. jostain liitännän työ tietokannasta suoritettaan; "schema", "insert", "delete", "query", "notes" ja jne.

#kun kerta syöttää (alemman komennon), jonka jälkeen näkee informaation tästä boxien laatikosta (aika paljon) siksi laitoin ...
# periaatteessa löytyy tällaisia datoja & tietokannasta; companies|contacts|credentials|domains|hosts|leaks|locations|netblocks|ports|profiles|pushpins|repositories|vulnerabilities
> $db schema

[recon-ng][default] > db schema

  +---------------+
  |    domains    |
  +---------------+
  | domain | TEXT |
  | notes  | TEXT |
  | module | TEXT |
  +---------------+


  +--------------------+
  |     companies      |
  +--------------------+
  | company     | TEXT |
  | description | TEXT |
  | notes       | TEXT |
  | module      | TEXT |
  +--------------------+


  +-----------------+
  |    netblocks    |
  +-----------------+
  | netblock | TEXT |
  | notes    | TEXT |
  | module   | TEXT |
  +-----------------+

....

#####################
# db (esim2)
# Usage: db <delete|insert|notes|query|schema> [...]
# db insert porttia (jotakin)

[recon-ng][default] > db insert ports

# poistaminen (delete)
[recon-ng][default] > db delete hosts

# notes 
[recon-ng][default] > db notes ports

#####################
# esim. 3 esim. datan lisääminen esim. jotakin sivustoa ja huom. ennen sitä luodaan joku workspaces (kuin tietokanta)
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


# tässä näkyvissä (huutomerkit) tarkoittaa, virheilmoituksien taustaa, jossa ei olla määrittänyt/lisänneet API-avainta johiinkin moduuleihin, mikä joka tapauksessa valinnaista. joten voidaan skippata hetkeksi huomioimatta..

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
#











