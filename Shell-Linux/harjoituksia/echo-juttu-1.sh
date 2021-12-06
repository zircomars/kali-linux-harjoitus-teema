#Substitution
#Shell skripti suoritta korvauksen, kun se kohtaa lauskkeen, joka sisältää yhden tai useamman erikoismerkkin

a=10
b=2
echo -e "Value of a is $a * $b \r asdf"
val=`expr $a \* $b`
echo "tulos on:  $val"
echo "qwerty"
#esim 10 perässä \n & echo jälkisen e on vaihtoehtoinen komento, että toistettaan toi lausekke

#muu escape-sekvenssit, mitä käytettään echo kommennossa
#
# rivi 6 echo komento lopussa olevat kautta \ erikoismerkkien merkit ja tämä vaikuttaa echo -e kanssa & jos tavallinen echo "teksti", niin toi teksti tulostuu ja tämä -e on special

# \\ - backslash / kenoviiva
# \a - pieni alerti ääni
# \b - blackspace / askelpalautin

# \c - estää rivinvaihdon perässä, vähä kuin toi alemman rivin ylös \c paikalle ja puhdistaa jälkimmäiset tekstit
# Value of a is 10 * 2 tulos on:  20

# \f - muotosyöte (form feed)
#Value of a is 10 * 2 
#                     asdf
#tulos on:  20
#qwerty

# \n - uusi tyhjä rivi alle
# \r - carriage return eli 
# \t - horizontal tab eli kuin näppäimistön tab

# \v - veritcal tab eli 
# tämän esimerkki, että jatkaa luvusta siitä eteenpäin tuleva tab tai välisäs on pitkä tab
# Value of a is 10 * 2 
#                      asdf
