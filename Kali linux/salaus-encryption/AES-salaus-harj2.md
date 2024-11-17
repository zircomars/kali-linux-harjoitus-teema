# lisää harjoituksia (kali linux)
Tänne tulee pari-muutamia kivoja harjoituksia kali linux:seen, että tänne ja vastaavasti pientä kysymyksiä

- [pieni lunttilappu](#pieni-lunttilappu)
- [harj ](#harj-1)
- [harj 2](#harj-2)
- [header](#header)
- [header](#header)

## pieni lunttilappu

Salataan tiedosto: `$ openssl enc -aes-256-cbc -in file1.txt -out file1.txt.enc`

Purettaan salaus: `$ openssl enc -d -aes-256-cbc -in file2.txt.enc -out tiedosto.purku.txt`

:exclamation: Pieni muistutus, joka kerta salataan tai purettaan tiedosto niin pitää tietää se <b>salasana</b>, kunnes päästään tiedoston sisään. Koska luonti ja purettussa kysyy sitä salasanaa. 

Salauksen avaimia jakautuu kolmeen avaimeen eli (AES 128/192/256), mitä pidempi avaimen pituus, niin sitä vahvempi ja turvallisempi salaus on

## harj 1 
Ilman salasanaa


## harj 2
kokeillaan 128/192 bittiä


## harj 3
