# workplaces harjoitus, josta tapahtuu "create", "list", "load" ja "remove" workspace toimintoja 

# luodaan joku workspace (vähä kuin sql komento)
[recon-ng][default] > workspaces create datakanta

# toistetaan ja tarkistellaan listat, ja oletuksena (default) tulee mukaan aina
[recon-ng][datakanta] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | datakanta  | 2023-12-09 13:34:48 |
  | default    | 2023-12-07 18:04:48 |
  +----------------------------------+

# workspace <jotakin> niin mennään takaisin polkuun (default) on aina mukana jos halutaan ikään kuin peruuttaa taaksepäin sitä polkua
# ja sama kun on luotu "datakanta" niin load <nimi> , joka tarkoittaa mennään kuin siihen database:sin (tietokannan) joku projektien kansion polun sisään ja suoritettaan prosessi ja muita toimintoja
[recon-ng][datakanta] > workspaces load default

# poistaminen?
# poistamiesssa missä polussa onkaan niin "remove" <jotakin> niin sillä kautta ja voi varmuuden vuodella tarkistaa onko kyseinen "kansio" poistunut listan alta
[recon-ng][default] > workspaces load datakanta
[recon-ng][datakanta] > workspaces remove datakanta
[recon-ng][default] > workspaces list

  +----------------------------------+
  | Workspaces |       Modified      |
  +----------------------------------+
  | default    | 2023-12-07 18:04:48 |
  +----------------------------------+






