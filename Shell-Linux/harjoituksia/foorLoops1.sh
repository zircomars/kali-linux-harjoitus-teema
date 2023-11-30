# LOOPS
# for-loops

# jollekin toiminalle ja käytännön tyypiä. Silmukkaa käytetään suorittamaan titetttyn joukkon komentoa luettelon kullekin kohalle

for var-name in <list>
do
 <action to perform>
done

# tässä pari ensimmäistä esimerkkiä on paljon potentiaalia. IP-osoitteiden for loop jotakin IP-osoitteiden näyttämisessä ei hyödynnä mitään kauheasti, mutta sitä voi käyttää samaa ideaa porttienskannauksessa suorittamiseen nmap prosesisissa. 
# Tätä voidaan periaattessa yrittää käyttää pinggien komentoa ja vastaako jokin IP-osoitteesta ICMP echo pyyntöön.

# ICMP = Internet Control Message Protocol

#esim1. jos shellissä suoritettaan jotakin pinggausta, ip-osoitteeseen nin se tekee sen 10.11.1.1 - 10.11.1.10 asti
#siksi siinä on alkaminen 10.11.1.X jotakin
$for ip in $(seq 1 10); do echo 10.11.1.$ip; done
10.11.1.1
10.11.1.2
10.11.1.3
10.11.1.4
10.11.1.5
10.11.1.6
10.11.1.7
10.11.1.8
10.11.1.9
10.11.1.10


kali@kali:~$ for i in {1..10}; do echo 10.11.1.$i;done
10.11.1.1
10.11.1.2
10.11.1.3
10.11.1.4
10.11.1.5
10.11.1.6
10.11.1.7
10.11.1.8
10.11.1.9
10.11.1.10

#############################################

# while loops

# tämä on melko sama tai yleiseinen suoritettava koodi, kun lauseke on tosi. eli periaateessa suorittaa niin kauan on tosi/täsmää jokin toiminta.

while [ <some test> ]
do
 <perform an action>
done

# esim1. scripti tämä on sama idea kuin suorittaisi shell komennossa ja while on [ jotakin ] eli laatikko
# tässä esimerkissä tuli yleinen virhse, jota kutsutaan "off by one" virheeksi. Siinä on "-lt" (pienempi kuin / less than), "-le" (pienempi tai yhtä suuri) sijaista, joten laskurin sai vain 9 IP-osoitetta eli 10.11.1.1 - 10.11.1.9 , eli puuttuu yksi vielä 

#!/bin/bash
# while loop example
counter=1
while [ $counter -lt 10 ]
do
 echo "10.11.1.$counter"
 ((counter++))
done


# esim2.
# eli tässä käytettään c++ methodia ja jossa on tupla sulkun rakenteen ariteettin laajennusta ja arvioinnin suorittamista samanaikaisesti. Tässä just tapauksessa käytettään laskurina lisäämistä yhden muuttujan arvoon. ja tässä toistuu just sitä tasan tarkalleen 10 IP-osoitetta shellistä eli 10.11.1.1 - 10.11.1.10

#!/bin/bash
# while loop example 2
counter=1
while [ $counter -le 10 ]
do
 echo "10.11.1.$counter"
 ((counter++))
done

#################################################




