#lukaisee jokin tiedoston polun tai fyysisen tiedoston jos on olemassa, esim. tiedoston kansiossa on useita tiedostoi word, excel, txt ja jne..
¨
#kolme methodia & tyypistä

esim1)
File=read_file.txt  
if test -f "$File"; then  
echo "$File exist "  
fi  


esim2)
File=read_file.txt  
if [ -f "$File" ]; then  
echo "$File exist "  
fi  


esim3)
File=read_file.txt  
if [[ -f "$File" ]]; then  
echo "$File exist "  
fi  


#tässä voidaan kokeilla ilman if..else menetelmää & sama kolme eri methodia/tyypistä

esim1)
File=read_file.txt  
test -f read_file.txt && echo "$File exist"  

esim2)
File=read_file.txt  
[ -f read_file.txt ] && echo "$File exist"  

esim3)
File=read_file.txt  
[[ -f read_file.txt ]] && echo "$File exist"  


#

#myös käytetään && operaatiota, mitä on suoritettava useita komentoja, mitä komennon hakasulkeisiin erottuu puolipiste ; tai AND:llä eli &&

esim1)
File=read_file.txt  
[ -f read_file.txt ] && { echo "$File exist"; echo "Task Completed"; }  


esim2)

File=read_file.txt  
  [ -f read_file.txt ] && echo "$File exist" || echo "$File does not exist"  



##tarkistetaan jos hakemisto on olemassa
#operaatiossa -d mitä voidaan testata, että onko tiedosto hakemisto vai ei
#kaksi eri tyypistä / methodia

esim1)
File=Javatpoint  
if [ -d "$File" ]; then  
echo "$File is a directory"  
fi

esim2)
File=Javatpoint  
[ -d "$File" ] && echo "$File is a directory"  


#tarkistus jos tiedosto ei ole olemassa
#tarkistamisessa voidaan mitätöidä käyttämällä huutomerkkiä ! ja NOT operaatiota.

esim1)
File=missing_read_file.txt  
if [ ! -f "$File" ]; then  
echo "$File does not exist"  
fi  

esim2)
File=missing_read_file.txt  
[ ! -f "$File" ] && echo "$File unavailable"  

