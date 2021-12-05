#variables - muuttujat & ja muut parametrit

echo "File Name: $0"
echo "First Parameter : $1"
echo "Toinen Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "asdf: $?"
echo "Software testing: $$"
echo "zxcv: $!"
echo "Total Number of Parameters : $#"

#console/outputs:::::::
# ./main.sh zxcv qwerty adsf 12
# File Name: ./main.sh
# First Parameter : zxcv
# Toinen Parameter : qwerty
# Quoted Values: zxcv qwerty adsf 12
# Quoted Values: zxcv qwerty adsf 12
# asdf: 0
# Software testing: 147
# zxcv: 
# Total Number of Parameters : 4

#muu muistiinpanot START HERE:::
### ja just check äskeisen harjoituksen
# $0
# lukaistee tiedoston tyyppin, eli ohjelman, mitä on nimennyt

# $n (n - luku [1234] )
# lukaisee parametrin , eli "zxcv" ja "qwerty"

# $#
# laskee monta parametriä on yhteensä & ja muu argumentit tekijät

# $*
# Kaikki argumentit ovat lainausmerkkejä. Jos komentosarja saa kaksi argumenttia, $* vastaa $1 $2. 

# $@
# Kaikki argumentit on erikseen lainattu. Jos komentosarja saa kaksi argumenttia, $@ vastaa $1 $2. 

# $? (tämä on tuntematon)
# Viimeksi suoritetun komennon poistumistila.

# $$ (laskee monta kertaa tätä skriptiä on pyöritetty), eli "run" tai testaa
# Nykyisen kuoren prosessinumero. Shell-skripteillä tämä on prosessitunnus, jolla ne suoritetaan. 

# $!
# Viimeisen taustakomennon prosessinumero.
#
