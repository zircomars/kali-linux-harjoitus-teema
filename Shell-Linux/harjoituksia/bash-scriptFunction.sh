#Bash skriptin funktio, että toistettaan se sisäisen asia, ja määritys

#toiminnossa käytettään toistuvia tehtävien suorittamista, että on yksi tapa luoda koodin uudelleen käynnistämiseksi. On osa nykyaikaisen olio-ohjelmointi

#shell bash funktiossa on samanlaisia tai suurinpirtein kuin muiden ohjelmointien kielenkanssa, että niiden rutiinit, menettelyt ja funktiot/parametrit ja jne.

#funktiossa pitää kutsua toista funktion määritystä, että kutsuessa on muualta käsikirjoituksia. Toiminnossa pitää olla sulkumerkit, että on sisäisen komento tai muu määritys

# Calling one function from another
number_one () {
   echo "Function math example"
   number_two #replay function two
}

number_two () {
   a=2
   b=8
   val=`expr $a + $b`
  echo "Plus: $a + $b : $val"

  number_three
}

number_three () {
  echo "asdf"
}

# Calling function one.
number_one

#outputs/console:::::
#Basic math
#Plus: 2 + 8 : 10
#asdf
#
