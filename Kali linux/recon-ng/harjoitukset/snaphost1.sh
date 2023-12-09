# snapshot - josta tuttu linux ja virtuaalkoneiden ympäristössä kuin "tilannekuva" tai siinä ajanhetkellisen keskeneärisenn projekti tai tutkimus tai vastaava konffaus, josta voi tarvittaessa palata taaksenpäin ja suorittaa sen projektin loppuun asti & ikään kuin backup / varmuuskopiot

# snapshot syöttäminen ja anna sopiva nimi
[recon-ng][default] > snapshots take kuvashot
[*] Snapshot created: snapshot_20231209144017.db

# sitten tarkistellaan snapshotien listat
[recon-ng][default] > 
[recon-ng][default] > snapshots list

  +----------------------------+
  |         Snapshots          |
  +----------------------------+
  | snapshot_20231209144017.db |
  +----------------------------+

# ladataan (load) snap komennolle jotakin
[recon-ng][default] > snapshots load snapshot_20231209144017.db
[*] Snapshot loaded: snapshot_20231209144017.db
[recon-ng][default] > 


# poistetaan yksittäinen snapshot kuva
[recon-ng][default] > snapshots remove snapshot_20231209144017.db
[*] Snapshot removed: snapshot_20231209144017.db
[recon-ng][default] > 

# tarkistellaan varmuuden vuoksi niin onko se listalla, periatteessa ei ole listalla
[recon-ng][default] > snapshots list
[*] This workspace has no snapshots.
[recon-ng][default] > 





