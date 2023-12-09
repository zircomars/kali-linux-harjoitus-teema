# pdb is a debugger (debuggointi) eli virheidenjäljittämiset ja kaikki viat/troubleshootit

[recon-ng][default] > pdb.set_trace()
--Return--
> /usr/share/recon-ng/recon/core/framework.py(1291)do_pdb()->None
-> pdb.set_trace()
(Pdb) 

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
