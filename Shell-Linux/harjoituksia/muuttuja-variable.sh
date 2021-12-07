#Variable substation - muuttujien korvaaminen

# Muuttujan korvaaminen antaa komentotulkkiohjelmoijalle mahdollisuuden manipuloida muuttujan arvoa sen tilan perusteella.

# jokinlainen muuttuja, että dollarimerkki ja var sisäisen viesti, jotta toistettaisi echo avulla, että pitää viittaa se tekijänsä. esim. a = testi & echo "a", ja toistuu se testi 

#tämä muuttuja on erikoinen, ja menee formaatilla 

#perus echo toisto
echo ${var:-"Muuttuja ei ole asetettu"}
echo "1 - Value of var is ${var}"

#perus muuttuja , mutta toinen toistaa saman säkeistön
echo ${var:="Muuttuja ei ole asetettu"}
echo "2 - Value of var is ${var}"

unset var
#perus echo toisto
echo ${var:+"Tämä on oletus objekti"}
echo "3 - Value of var is $var"

var="Prefix"
lok="Felix"
echo ${var:+"Tämä on oletus objekti"}
echo "4 - Value of var is $lok"

echo ${var:?"Jätä jokin viesti"}
echo "5 - Value of var is ${lok}"

#console/outputs::::::
# Muuttuja ei ole asetettu
# 1 - Value of var is 
# Muuttuja ei ole asetettu
# 2 - Value of var is Muuttuja ei ole asetettu

# 3 - Value of var is 
# Tämä on oletus objekti
# 4 - Value of var is Felix
# Prefix
# 5 - Value of var is Felix

##################
# ${var}
# Substitute the value of var - korvaa var
#
# ${var:-word}
# Jos var on tyhjä tai asettamaton, sana var korvataan. Var:n arvo ei muutu. 
#
# ${var:=word}
# Jos var on tyhjä tai asettamaton, var asetetaan sanan arvoksi.
# 
# ${var:?message}
# Jos var on nolla tai ei ole asetettu, viesti tulostetaan vakiovirheeksi. Tämä tarkistaa, että muuttujat on asetettu oikein.
# 
#
# ${var:+word}
# If var is set, word is substituted for var. The value of var does not change.
# Jos var on asetettu, sana var korvataan sanalla. Var:n arvo ei muutu.
# 
###################
