# Recon-ng

```
┌──(kali㉿kali)-[~]
└─$ recon-ng 
[*] Version check disabled.

    _/_/_/    _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/
   _/    _/  _/        _/        _/      _/  _/_/    _/            _/_/    _/  _/       
  _/_/_/    _/_/_/    _/        _/      _/  _/  _/  _/  _/_/_/_/  _/  _/  _/  _/  _/_/_/
 _/    _/  _/        _/        _/      _/  _/    _/_/            _/    _/_/  _/      _/ 
_/    _/  _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/    


                                          /\
                                         / \\ /\
    Sponsored by...               /\  /\/  \\V  \/\
                                 / \\/ // \\\\\ \\ \/\
                                // // BLACK HILLS \/ \\
                               www.blackhillsinfosec.com

                  ____   ____   ____   ____ _____ _  ____   ____  ____
                 |____] | ___/ |____| |       |   | |____  |____ |
                 |      |   \_ |    | |____   |   |  ____| |____ |____
                                   www.practisec.com

                      [recon-ng v5.1.2, Tim Tomes (@lanmaster53)]                       

[*] No modules enabled/installed.

[recon-ng][default] >
```

* [marketplace and modules](#marketplace-and-modules)
  * [modules](#modules)
  * [reports](#reports)

* [tutoriaalit ja käyttöohjeita](#tutoriaalit-ja-käyttöohjeita)

reco-ng on moduulipohjainen framework verkkopohjaisen tiedon keräykseen ja OSINT (open source intelligence) työkalu, ja tulostaa/näyttää moduulien päätelaitteelle että tallentaa niitä tietokantaan. Suurin osat recon-ng tehostaa moduulien tulostuksien syöttämistä toiseen, jolla voidaan nopeasti laajentaa tiedon keräystä laajuutta.

Recon-ng mmuistuttaa sama kuin Metasploit Framework:iä, mikä vähentää framework hyödyntämistä oppimiskäyrää, mutta se on kuitenkin aivan erilainen. Recon-ng ei ole tarkoitus kilpailla olemassa/muita framework:ien kanssa, koska se on suunniteltu yksinomaisen verkkopohjaisen avoimen lähdenkoodin tutkimiseen. 

Pien huom, jos käyttää kali linux:sta niin tätä on asennettu siihen pohjaan, että riittää syöttää komennon `$recon-ng` ja harjoituksissa osat on suoraan kirjasta, mutta osat on liitetty esim. vähä muiden linkkeiden kautta (vähä ristiin), mutta samaa harjoitusta ja sen ideaa

```
[recon-ng][default] > help

Commands (type [help|?] <topic>):
---------------------------------
back            Exits the current context
dashboard       Displays a summary of activity
db              Interfaces with the workspace's database
exit            Exits the framework
help            Displays this menu
index           Creates a module index (dev only)
keys            Manages third party resource credentials
marketplace     Interfaces with the module marketplace
modules         Interfaces with installed modules
options         Manages the current context options
pdb             Starts a Python Debugger session (dev only)
script          Records and executes command scripts
shell           Executes shell commands
show            Shows various framework items
snapshots       Manages workspace snapshots
spool           Spools output to a file
workspaces      Manages workspaces
```

`back` - komennolla menee yhden polun takaisin taakse päin , kuin linux `cd ..`

```
[recon-ng][default] > show
Shows various framework items

Usage: show <companies|contacts|credentials|domains|hosts|leaks|locations|netblocks|ports|profiles|pushpins|repositories|vulnerabilities>

```

## marketplace and modules

```
[recon-ng][default] > marketplace help
Interfaces with the module marketplace

Usage: marketplace <info|install|refresh|remove|search> [...]

```

jos on puuttuvia "marketplace" työkaluja/moduulia niin kantsii tarvittaessa ladata niitä eli..
ja jossakin moduulissa vaadittaan API-avainta lisäämistä toimiakseen oikein
```
[recon-ng][default] > marketplace install all
[*] Module installed: discovery/info_disclosure/cache_snoop
[*] Module installed: discovery/info_disclosure/interesting_files
[*] Module installed: exploitation/injection/command_injector
[*] Module installed: exploitation/injection/xpath_bruter
[*] Module installed: import/csv_file
[*] Module installed: import/list
[*] Module installed: import/masscan
[*] Module installed: import/nmap
[*] Module installed: recon/companies-contacts/bing_linkedin_cache
[*] Module installed: recon/companies-contacts/censys_email_address
[*] Module installed: recon/companies-contacts/pen
[*] Module installed: recon/companies-domains/censys_subdomains
[*] Module installed: recon/companies-domains/pen
[*] Module installed: recon/companies-domains/viewdns_reverse_whois
[*] Module installed: recon/companies-domains/whoxy_dns
[*] Module installed: recon/companies-hosts/censys_org
[*] Module installed: recon/companies-hosts/censys_tls_subjects
[*] Module installed: recon/companies-multi/github_miner
[*] Module installed: recon/companies-multi/shodan_org
[*] Module installed: recon/companies-multi/whois_miner
.........

[*] Module installed: recon/repositories-vulnerabilities/gists_search
[*] Module installed: recon/repositories-vulnerabilities/github_dorks
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
[!] 'ipinfodb_api' key not set. ipinfodb module will likely fail at runtime. See 'keys add'.
[!] 'bing_api' key not set. bing_ip module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/hosts-hosts/censys_ip' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.                                                                                                                                          
[!] 'virustotal_api' key not set. virustotal module will likely fail at runtime. See 'keys add'.


```

### modules

moduulit, joka on ryhmitelty eri luokkiin ja niitä löytyy "marketplace" hakemistolla

`- discovery`
`- exploitation`
`- import`
`- recon`
`- reporting`

### reports

oletuksena kun aloittaa tyhjästä Kali Linux virtuaalikone ympäristöstä niin siinä raportti moduuli ei tule mukana, jos aikoo suorittaa jotakin tietojen etsimistä vaikappa domain sivustoa (domain.com), niin haetuista tulostuksesta joko tulostettaan excel taulukkona, html, json ja jne.

Tätä raportti moduulia työkalua saa ladattua marketplace:istä ja komennolla;

```
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
```

## tutoriaalit ja käyttöohjeita <br>
https://hackertarget.com/recon-ng-tutorial/ <br>
https://www.kali.org/tools/recon-ng/ <br> 
https://holisticinfosec.io/toolsmith/pdf/may2013.pdf <br>
https://securitytrails.com/blog/recon-ng <br>
<br>
https://techyrick.com/recon-ng/ <br>
https://www.trickster.dev/post/recon-ng-modular-framework-for-osint-automation/ <br>
https://medium.com/@bibinrajbs/using-recon-ng-in-kali-2020-cc76aa3a4a6d  <br>
https://techradix.in/recon-ng-tutorial/ <br>
https://medium.com/hacker-toolbelt/recon-ng-how-to-ii-986a82d47dc3 <br>


### cheat sheet
https://www.blackhillsinfosec.com/wp-content/uploads/2019/11/recon-ng-5.x-cheat-sheet-Sheet1-1.pdf
https://medium.com/hacker-toolbelt/my-recon-ng-cheat-sheet-efdfebb82929

