#!/bin/bash
#if...elif...else - statements
#jos on useampi jos tai kun, jotain muuta vastaava toistettaan sitä proesessia tai tekijänsä

#Multiple Conditions
#looginen OR- tai AND-operaattori, mitä sen avulla voi käyttää useita ehtoja if-lauseessa, periaatteessa lyhentäisi if-elif-else operaattorin.

#vaihtoehtona on, että joko tulostaa suurimman numeron kolmesta numerosta. Tässä esim. sisäkkäisen if-lauseiden sijasta loogistaa AND-operaattoria &&

# if..elif..else operaattori merkit

# integer = kokonaisluku (ohjelmointi int)
# operaattorissa siellä lukee -eq ja jne.

# int1 -eq int2 : tosi jos int1 ja int ovat yhtä suuri

# int1 -gt int2 : tosi jos int1 on suurempi kuin int2

# int1 -lt int2 : tosi jos int1 on pienempi kuin int2

# int1 -ge int2 : tosi jos int1 on yhtä suuri tai suurempi kuin int2

# int1 -le int2 : tosi jos int1 on yhtä suuri tai pienempi kuin int2

#tässä esimerkissä syötettään kolme eri lukua, ja havaitaan kolmen luvun ero, että mikä on isoin
#käyttä antaa luvun
echo -n "Ensimmäinen luku: "
read NUM1
echo -n "Toinen luku: "
read NUM2
echo -n "Kolmas luku: "
read NUM3

#annettuista luvuista suorittaa operaattorin, ja jos eka < toinen > kolmas suurempi/pienempi
if [[ $NUM1 -ge $NUM2 ]] && [[ $NUM1 -ge $NUM3 ]]
then
  echo "Luku $NUM1 on suurin numero."
elif [[ $NUM2 -ge $NUM1 ]] && [[ $VAR2 -ge $NUM3 ]]
then
  echo "Luku $NUM2 on suurin numero."
else
  echo "Luku $NUM3 on suurin numero."
fi

#######
#esim 2) tämä on sama kuin edellinen, mutta vain havaitaan esim. maksimi on 100, että mitä lukua käyttäjä syöttää

read -p "Anna luku:" num  
  
if [ $num -gt 100 ]; #-gt greater than
then  
  echo "Antamasi numero on suurempi"  
elif [ $num -lt 100 ];  #-lt less than
then  
  echo "Antamasi numeron pienempi"  
else  
  echo "BINGO!!"  
  echo "$num on yhtä suuri"  
fi  
