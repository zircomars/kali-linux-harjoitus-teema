# harjoitus (geo location)

# ensimmäisenä tarkistellaan ja luodaan tyhjä "workspace" eli kuin sql joku tietokanta, ja siihen tarkistellaan. usein tyhjästä , jostakin on tyhjä "host" ja "domain"

# jos ei ole luonut workspace (tietokantaa) tai jotakin tässä pieni lunttilappuna, ja samalla voi tarkistaa olemassa olevia workspace listoja.

[recon-ng][default] > workspaces create ipgeo
[recon-ng][ipgeo] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | default    | 2023-12-09 20:56:31 |
  | ipgeo      | 2023-12-10 16:41:58 |
  +----------------------------------+

# ja voi varmuuden vuodella tarkistaa onko luoneen tieokannan "ipgeo":ssa mitään hostia ja/tai domainia (yleensä luoneen tyhjän workspace:ssä on tyhjää dataa)
[recon-ng][ipgeo] > show hosts
[*] No data returned.
[recon-ng][ipgeo] > show domains
[*] No data returned.

#################################
# demo (HARJOITUS) START HERE
# haetaan kyseisen sivuston serverin IP-osoite ja sen paikannuksen kohde (geo location) 
















