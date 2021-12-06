#Operaatiot (perus matikkat, if-else ja muut sessiot tai muu methodi )

# matikat perus: + - * /

# Aritmeettiset operaattorit
# Relaatio operaattorit
# Boolen operaattorit
# Merkkijono operaattorit
# Tiedoston testausoperaattorit 

a=6
b=2

val=`expr $a + $b`
echo "Plus: a + b : $val"

val=`expr $a - $b`
echo "Minus: a - b : $val"

val=`expr $a \* $b`
echo "Kerto: a * b : $val"

val=`expr $b / $a`
echo "Jako: b / a : $val"

# modulo matikka (Modulaarinen aritmetiikka)
val=`expr $b % $a`
echo "b % a : $val"

#onko yhtä suuri tai ei
if [ $a == $b ]
then
   echo "a is equal to b"
fi

if [ $a != $b ]
then
   echo "a is not equal to b"
fi

# a ja b ero, & if-else statement 
if [ $a > $b ]
then 
  echo "a on pienempi kuin b"
else
  echo "a on suurempi kuin b"
fi

#console/outputs::::
# Plus: a + b : 8
# Minus: a - b : 4
# Kerto: a * b : 12
# Jako: b / a : 0
# b % a : 2
# a is not equal to b
# a on pienempi kuin b
#
