# Offensive-Security-OSCP-by-Offensive-Security_2020
# https://blactec.biz/wp-content/uploads/2021/09/Offensive-Security-OSCP-by-Offensive-Security%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90.pdf

#tämä on sama idea kuin toi vanhempi 2018 julkaistettu versio, mutta tässä harjoituksessa käytettään sen esimerkkin linkkiä "megacorpone.com" 
#tätä voi periaatteessa suorittaa virallisesti omass kali linux:sessa, mutta testaan repl.it bash:in kautta

# PAGE START 125 - 129 (EXAMPLE 2)

# Esim. kun ollaan keskellä penetraation testausta ja käyttäjällä on etuoikeus pääsy (unpriviledge access) Windows koneeseen. 

#  As we continue to collect information, we realize it may be
vulnerable to an exploit that we read about that began with the letters a, f, and d but we can’tremember the full name of the exploit. In an attempt to escalate our privileges, we want to search for that specific exploit.

# harjoituksen kannalta etsitään "https://www.exploit-db.com" hakusanalla "afd windows", jolla ladataan hakuehtoja vastaavat exploitit ja tarkstettavien niitä, kunnes löydetäkseen oikea tieto. 
# voidaan tehdä tätä manuaalisesti verkkosivustojn kautta, mutta (kirjan ohje) ei pitäisi mennä kauaan, mutta jos käyttää paljon aikaa bash -scriptin kirjoittamiseen, johon voi helposti käyttää hakua ja lataa automaattisesti hyväksikäyttöjä myöhemmin

##########
# eli aloitettaan "searchsploit32"- apuohjelelmalla Kali linuxsessa. (tämä virallisesti suoritettu repl.it harjoituskena)
# searchsploit on exploit-db:n komentorivi työlalu, jonka voidaan ottaa offline-kopiona Exploit-tietokannasta mukanaan minne vain.

# 


~/penetrationpracticeexample2$  searchsploit afd windows -w -t
searchsploit: command not installed, but was located via Nix.
Would you like to run searchsploit from Nix and add it to your replit.nix file? [Yn]: y
Adding exploitdb to replit.nix
success
/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12
[i] Found (#1): /nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/files_exploits.csv
[i] To remove this message, please edit "/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/.searchsploit_rc" which has "package_array: exploitdb" to point too: path_array+=("/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb")

[i] Found (#1): /nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/files_shellcodes.csv
[i] To remove this message, please edit "/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/.searchsploit_rc" which has "package_array: exploitdb" to point too: path_array+=("/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb")

---------- --------------------------------------------
 Exploit Title |  URL
---------- --------------------------------------------
Microsoft | https://www.exploit-db.com/exploits/17133
Microsoft | https://www.exploit-db.com/exploits/18176
Microsoft | https://www.exploit-db.com/exploits/18755
Microsoft | https://www.exploit-db.com/exploits/21844
Microsoft | https://www.exploit-db.com/exploits/39446
Microsoft | https://www.exploit-db.com/exploits/39525
Microsoft | https://www.exploit-db.com/exploits/40564
Microsoft | https://www.exploit-db.com/exploits/42009
Microsoft | https://www.exploit-db.com/exploits/6757
---------- --------------------------------------------
Shellcodes: No Results
Detected change in environment, reloading shell...

#########
# seuraavaksi, ollaan kiinnostuneita hyväksinkäyttöön URL osoittesta, johon kirjoitettaan "http:lle" grep-koemntoa ja leikattaan tarvitsemamme ja lisätään putki | 

# tässä näyttää pikasen paremmaklta, kun on URL jokaisessa hyväksikäytössä ja voidaan ladata tiedostot ja tallentaa niitä paikallisen Bash- looppiin.

~/penetrationpracticeexample2$ searchsploit afd windows -w -t | grep http | cut -f 2 -d "|"
[i] Found (#1): /nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/files_exploits.csv
[i] To remove this message, please edit "/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/.searchsploit_rc" which has "package_array: exploitdb" to point too: path_array+=("/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb")

[i] Found (#1): /nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/files_shellcodes.csv
[i] To remove this message, please edit "/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/.searchsploit_rc" which has "package_array: exploitdb" to point too: path_array+=("/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb")

 https://www.exploit-db.com/exploits/40564
 https://www.exploit-db.com/exploits/18755
 https://www.exploit-db.com/exploits/21844
 https://www.exploit-db.com/exploits/39446
 https://www.exploit-db.com/exploits/39525
 https://www.exploit-db.com/exploits/42009
 https://www.exploit-db.com/exploits/17133
 https://www.exploit-db.com/exploits/18176
 https://www.exploit-db.com/exploits/6757


#########
# seuraavaksi ennen kuin aloittaakin huomaa kuitenkin, että jokaisen tuossa sivustojen linkkissä on raa'an  (raw) lataamiset. Eli jos käyt katsotamassa noi URL (https://www.exploit-db.com) linkkejä)

# ja pääteessä/loppussa on "/exploits/40564" siis joku arvo, jonka linkkittää raakaan hyväksikäyttöön. Periaatteessa näiden tietojen avulla voi suorittaa komennon (sed 's/exploits/raw') muokatakseen lataus URL-osoitetta ja lisäämmällä sen Bash yhteislinjaisen ,johon voidaan ladata hyödykkeiden raakaa-kooodia (raw code)

# tässä for loop komennossa, joka toistuu nappautakseen SearchSploit -Url linkkiä lävitse. Siihen asetettaan silmukan sisälle "name" ja käyttämällä grep-, cut- ja komentokorvausta, ja URL raakaa latauspaikkaa.

# samaan jos tämä onnistuu (&&) kanssa, tartuttaan hyväskikäyttöön "wget:iä" ja tallennetaan paikallisen hyväskikäytöön nimellä paikallista tiedoston nimeämistä.

$for e in $(searchsploit afd windows -w -t | grep http | cut -f 2 -d "|"); do exp_name=$(echo $e | cut -d "/" -f 5) && url=$(echo $e | sed 's/exploits/raw/') && wget -q --no-check-certificate $url -O $exp_name; done

~/penetrationpracticeexample2$ for e in $(searchsploit afd windows -w -t | grep http | cut -f 2 -d "|"); do exp_name=$(echo $e | cut -d "/" -f 5) && url=$(echo $e | sed 's/exploits/raw/') && wget -q --no-check-certificate $url -O $exp_name; done
[i] Found (#1): /nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/files_exploits.csv
[i] To remove this message, please edit "/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/.searchsploit_rc" which has "package_array: exploitdb" to point too: path_array+=("/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb")

[i] Found (#1): /nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/files_shellcodes.csv
[i] To remove this message, please edit "/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb/.searchsploit_rc" which has "package_array: exploitdb" to point too: path_array+=("/nix/store/xpjpcl8kriaxb1nqw9fivn7ih2kzwv73-exploitdb-2022-11-12/share/exploitdb")

wget: command not installed. Multiple versions of this command were found in Nix.
Select one to run (or press Ctrl-C to cancel):
Adding wget to replit.nix
success
/nix/store/kblplvpffcfn0zprj80vh41xchjx4jag-wget-1.21.3
wget: command not installed. Multiple versions of this command were found in Nix.
Select one to run (or press Ctrl-C to cancel):
Adding wget to replit.nix
success
/nix/store/kblplvpffcfn0zprj80vh41xchjx4jag-wget-1.21.3
wget: command not installed. Multiple versions of this command were found in Nix.
Select one to run (or press Ctrl-C to cancel):
Adding toybox to replit.nix
success

# ainakin pari tiedostoa saattiin, sekä noissa tiedostjen sisällä on suuri data 
~/penetrationpracticeexample2$ ls 
18755  40564

# kun on ladannut niin voidaan tarkistaa ja varmistakseen, että todella ladatin. Tiedoston varmistamista toistetaan "file" komentoa ja se on tekstiä

# jokaisesta voidaan tarkistaa hyväksikäytön ja nähdä sen, että käyttäjä teki oikean ja raa'an hyödynsä, eli löysi tiedostonsa 

~/penetrationpracticeexample2$ ls -l
total 60
-rw-r--r-- 1 runner runner  9698 Dec  3 14:29 18755
-rw-r--r-- 1 runner runner 32674 Dec  3 14:29 40564
-rw-r--r-- 1 runner runner  7964 Dec  3 14:54 harjoitus.txt
-rw-r--r-- 1 runner runner    16 Apr  7  2023 main.sh
-rw-r--r-- 1 runner runner   159 Dec  3 14:29 replit.nix
~/penetrationpracticeexample2$ file 40564 
40564: ASCII text

#######################################

## seuraavaksi, (kirjan ohjeen mukaan), josta joudutaan copy-paste yhden scriptin, josta suoritettaan/puhdistettaan tietty toiminta (ohjeen mukaan ei ole helppoa käyttää uudelleen..)

# ehkä tässä ongelmana, kun on suoritettu jo pari tai muutaman kerramn saman komennon , niin sieltä toistu sitä "wget: unknown option 'q'" blah blah paskaa.. joten epäonnistui, mutta periaatteessa alussa (yks kohta) niistä tapahtui se lataa niitä URL linkkien exploits tyyppiä 

#!/bin/bash
# Bash script to search for a given exploit and download all matches.
for e in $(searchsploit afd windows -w -t | grep http | cut -f 2 -d "|")
do
 exp_name=$(echo $e | cut -d "/" -f 5)
 url=$(echo $e | sed 's/exploits/raw/')
 wget -q --no-check-certificate $url -O $exp_name
done

# kirja; tätä voi periaatteessa tarkastaa hyökkäystä, jotta ne löytää, joihin voidaan kiinnostaa, ja kokeilla niitä testikoneella ja lopulta suoirtettua oikean hyökkäyksen kohteelta, koska satunnaisien hyökkäyksiä ammuttaan elävältä kohdelta on huono prosessi ja tämä ns. kuin tuhoaa täydellisen katastrofin.





