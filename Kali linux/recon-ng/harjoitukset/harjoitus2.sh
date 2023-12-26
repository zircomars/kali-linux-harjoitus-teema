# virallinen harjoitus; https://medium.com/hacker-toolbelt/recon-ng-how-to-ii-986a82d47dc3
#
# tässä harjoituksessa suoritettaan verkkontutkinta. 
#
#####################

# ensimmäisenä luodaan oma workspace tila (uusi tietokanta), johon kerätään tietoja ja tietojen keräämisessä pitäisi olla helppo, mutta tee järjestyksessä. Lisätään esim. joku sivusto verkko domaini "medium.com"

#############
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
  
#############















