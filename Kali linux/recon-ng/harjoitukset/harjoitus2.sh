# virallinen harjoitus; https://medium.com/hacker-toolbelt/recon-ng-how-to-ii-986a82d47dc3
#
# tässä harjoituksessa suoritettaan verkkontutkinta. 
# ensimmäisenä luodaan oma workspace tila (uusi tietokanta), johon kerätään tietoja ja tietojen keräämisessä pitäisi olla helppo, mutta tee järjestyksessä. Lisätään esim. joku sivusto verkko domaini "medium.com"

#################################################################
# pieni lunttilappu kuinka luodaan ja poistettaan "workspaces"

[recon-ng][default] > workspaces 
create  list    load    remove  
[recon-ng][default] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | autocars   | 2023-12-18 21:05:08 |
  | default    | 2023-12-09 20:56:31 |
  | ipgeo      | 2023-12-10 16:41:58 |
  +----------------------------------+

# poistaminen 
[recon-ng][default] > workspaces remove ipgeo
[recon-ng][default] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | autocars   | 2023-12-18 21:05:08 |
  | default    | 2023-12-09 20:56:31 |
  +----------------------------------+

# uusi database (tietokanta - lista) (puuttuu API key, mutta ignoraa niitä)
[recon-ng][default] > workspaces create domainit
[!] 'whoxy_api' key not set. whoxy_whois module will likely fail at runtime. See 'keys add'.
[!] Module 'recon/domains-companies/censys_companies' disabled. Dependency required: 'me 'CensysIPv4' from 'censys.search' (/usr/lib/python3/dist-packages/censys/search/__init__.py)'.                                                                                                                                                   
[!] 'hibp_api' key not set. hibp_breach module will likely fail at runtime. See 'keys add'.
...........
[!] 'google_api' key not set. pushpin module will likely fail at runtime. See 'keys add'.
[recon-ng][domainit] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | autocars   | 2023-12-18 21:05:08 |
  | default    | 2023-12-09 20:56:31 |
  | domainit   | 2023-12-26 11:02:34 |
  +----------------------------------+

##########################
# HARJOITUS START HERE
# lisätään joku sivuston nimi "domainit-listan alle", just tämä "medium.com" sivusto ja tarkistellaan
# db = database
# $db insert domain.com - listään "sivuston nimi" alle











