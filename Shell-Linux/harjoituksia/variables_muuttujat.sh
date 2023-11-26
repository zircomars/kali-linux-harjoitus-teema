# muuttujan (variable) arvo muuttaminen tai antaminen, tämä toimii periaatteessa yksi suora arvoisena, että pitää antaa "nimi=arvo" jotakin ja ilmoittamisessa edessä ja takana ei saa olla välilyöntiä, jos antaa niin se tositaa jokin pien error:in
# tätä voi periaatteessa hyödyntää mm. cmd/powershell ja linux / kali linux istunnossa

~/variables-muuttujat$ first_name=Mikael
~/variables-muuttujat$ last_name=Doe_Hacker
~/variables-muuttujat$ last_name=Doe Hacker
bash: Hacker: command not found
~/variables-muuttujat$ last_name=Doe_Hacker
~/variables-muuttujat$ echo $first_name $last_name 
Mikael Doe_Hacker

# esim. toistettu echo niin kirjataan list listan sisään
~/variables-muuttujat$ echo $first_name $last_name >> list.txt
~/variables-muuttujat$ ls
harjoitus2.txt  list.txt  main.sh  muistio.txt
~/variables-muuttujat$ cat list.txt 
Mikael Doe_Hacker

# dollari merki edessä tarkoittaa ikään kuin viitattaan siihen tekijäänsä esim. a = arvo jotakin, mutta dollarimerkki pitää olla sen edessä kun yritettää ntoistaa jotakin vastaavaa

# muuttujista voi olla iso, pien, ja erikois merkkiä tai yhdistelmiä. bash sallii isoja ja pien kirjaimia, johon voidaan oltava johdonmukainen muuttuja ilmoittamisessa ja laajentamisessa.

# lisäksi muuttujien nimessä, jotta tehdään scriptiä on paljo helpompi lukea ja ylläpitää


# lisäksi jos on jokin lause vaikappa tervehdys tai vastaava;
#esim. tämä pieni error
~/variables-muuttujat$ greeting=hello world
bash: world: command not found

# jos haluttaan korjata, että toistetaan jokin lause tai vastaava niin pitää lisätä tommoiset heittomerkkit kaksi kertaa "" tai '' koska että on alku ja päättyvät lainausmerkki
# kun on suljettu heittomerkki " ja kaikkiin merkit katsotaan kirjaimellisesti eli dollari merkkinä $ ja \ (kautta viiva) mikä tarkoittaa, että muuttujat laajennettaan lakuperäisestä korvaavasta tekstistä

~/variables-muuttujat$ greeting='moikka kuis hurisee?'
~/variables-muuttujat$ echo $greeting 
moikka kuis hurisee?
~/variables-muuttujat$ 

~/variables-muuttujat$  greeting2="New $greeting"
~/variables-muuttujat$ echo $greeting
moikka kuis hurisee?
~/variables-muuttujat$ 

~/variables-muuttujat$ greeting="joulu on taas"
~/variables-muuttujat$ echo $greeting
joulu on taas

## sitten muita esimerkkejä muuttujista

kali@kali:~$ user=$(whoami)
kali@kali:~$ echo $user
kali

# tiedoston tai jotakin scriptien toistamista, esim. alemmassa ./main.sh jossa toistettaan tai suoritettaan scriptin ominaisuus
~/variables-muuttujat$ cat ./list.txt 
Mikael Doe_Hacker

~/variables-muuttujat$ ./main.sh 
File Name: ./main.sh
First Parameter : 
Toinen Parameter : 
Quoted Values: 
Quoted Values: 
asdf: 0
Software testing: 16592
zxcv: 
Total Number of Parameters : 0

##############################################

~/variables-muuttujat$ chmod +x ./main.sh 
~/variables-muuttujat$ ./main.sh hello there
File Name: ./main.sh
First Parameter : hello
Toinen Parameter : there
Quoted Values: hello there
Quoted Values: hello there
asdf: 0
Software testing: 17634
zxcv: 
Total Number of Parameters : 2
The first two arguments are hello and there
~/variables-muuttujat$ 

# toistaa tuon "hello there" ennen sitä scriptiä

