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










