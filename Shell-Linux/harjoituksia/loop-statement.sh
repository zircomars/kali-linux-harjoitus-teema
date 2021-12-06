# while loop
#
# vähä kuin for - loop, mutta lopettaa niin kauan kuin jotakin täsmää tai haluttaan toistaa jotakin

#esim1) kuin for loop, mutta while loop methodilla

n=1
# continue until $n equals 5
while [ $n -le 5 ]
do
	echo "Pilattu lounas määärä $n kertaa."
	n=$(( n+1 ))	 # increments $n
done

#console/outputs:::
# Pilattu lounas määärä 1 kertaa.
# Pilattu lounas määärä 2 kertaa.
# Pilattu lounas määärä 3 kertaa.
# Pilattu lounas määärä 4 kertaa.
# Pilattu lounas määärä 5 kertaa.

#esim2) - sama kuin 1 - mutta pieni ero
#
# n=1
# while (( $n <= 5 ))
#do
#	echo "Welcome $n times."
#	n=$(( n+1 ))	
# done

#Tähän mennessä olet tutkinut silmukoiden luomista ja silmukoiden kanssa työskentelyä eri tehtävien suorittamiseksi. Joskus sinun on pysäytettävä silmukka tai ohitettava silmukan iteraatiot. 
#Break statements - että määritettään mihin asti lopettaa komennon esim. luku 1...7, 8, 9, 10 asti
#esim 3)

a=0

#while mihin asti esim. 15maksimi
while [ $a -lt 25 ]
do
   echo $a
   if [ $a -eq 22 ] #toistetaan johonkin asti
   then 
      break
   fi
   a=`expr $a + 1`
done

#continue statement
# jatkuva käsky, eli sama kuin break silmukka, paitsi se aiheuttaa silmukan nykyisessä iteraation poistumisessa koko silmukan ajan

#sitä myös voidaan break komentoa, että continue komennolla avulla voidaan antaa kokonaislukuargumenttia, jotta ohittaa komennon sisäkkäisellä silmukalla

#esim 3) parillinen ja pariton
NUMS="1 2 3 4 5 6 7 8 9 10"

for NUM in $NUMS #numerolle tehdää jotain
do
   Q=`expr $NUM % 2` #onko pariton tai parillinen
   if [ $Q -eq 0 ] #jos on pariton
   then
      echo "Number is an even number!!"
      continue
   fi #muu, sitten on pariton
   echo "Found odd number"
done

# console/outputs:::::
# Found odd number
# Number is an even number!!
# Found odd number
# Number is an even number!!
# Found odd number
# Number is an even number!!
# Found odd number
# Number is an even number!!
# Found odd number
# Number is an even number!!
#
#





