# Offensive-Security-OSCP-by-Offensive-Security_2020
# https://blactec.biz/wp-content/uploads/2021/09/Offensive-Security-OSCP-by-Offensive-Security%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90.pdf

#tämä on sama idea kuin toi vanhempi 2018 julkaistettu versio, mutta tässä harjoituksessa käytettään sen esimerkkin linkkiä "megacorpone.com" 
#tätä voi periaatteessa suorittaa virallisesti omass kali linux:sessa, mutta testaan repl.it bash:in kautta

# PAGE START 125 - 129 (EXAMPLE 2)

# penetraatiotestauksessa yritettään usein löytää tehokkuutta minimoidakseen datan analysointia kuluvien ajan, josta erityisesti erilaisten skannausten aikana palutettavien datamäärää.

# esim. kun suooritettaan verkkossa mm. C -luokkan (192.0.0.0 to 223.255.255.0) aliverkkoa tunnistakseen verkkopalvelimen ja määrittäkseen tulevia "attack surface".

# porttien skannaus on prosessi johon tarkastetaan etäkoneen TCP- tai UDP porttien tarkotuksena on havaita mitkä palveluiden kohteet ovat käynnissä ja mitä hyökkäysvektoria mahdollisesti on olemassa.

# eli suoritettaan porttiskannausta ensin koko aliverkon löydetäkseen mahdolliset avoimet verkkopalvelut

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
















