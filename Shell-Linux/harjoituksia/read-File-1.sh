#tässä on monta tapaa lukaista tiedoston eli .txt Bash:in kautta, mutta scripttauksessa pitää vain määrittää polku ja tiedosto, että täsmääsen ja pitää antaa jokin toiminnan komento

#read_file.txt
#asdf qwerty
#zxcv 
#12345 xcvb
#hgjkl


##esim 1)
#read file path and echo / reply  string
value=`cat read_file.txt`  
echo "$value"

##esim2)
#sama kuin esim 1)
value=$(<read_file.txt)  
echo "$value"

##Read file & Reading File Content Using Script

##esim3)
#sama kuin esim 1 ja 2, mutta tässä toistamisen perässä toistetaan rivit, että kyseisen rivin teksti/luku, että monessa toistuu jotakin ja jne.

file='read_file.txt'  
  
i=1  
while read line; do  
  
#Reading each line  
echo "Line No. $i : $line"  
i=$((i+1))  
done < $file  

#Passing filename from Command line and reading the File

#Bash:in luomisessa lisää seuraava komentosarja, mitä välittää tiedoston nimen komentoriviltä, ja lukee tiedoston rivi riviltä. Ensimmäisen argumentin arvo lukee muuttuja $1, mitä sisältää luettavan tiedoston nimen. Jos tiedosto on saatavilla määritetyissä paikassa, while-silmukka lukee tiedoston rivin rivinltä, ja tulostaa tiedoston sisällön

#varsinaisesti; kyllä lukaisee tiedoston sisäisen rivin ja muut taustat, mutta poistaa  tiedoston sisäisen viimeisemmän rivin tekstin esim. tiedoston sisällä on 5 riviä tekstiä, kun käynnistää tämän scripttauksen, niin tulostuu vain 4 riviä.

##esim 4)
#!/bin/bash  
  
file=$1  
while read line; do  
  
#Readind each line in sequence  
echo $line  
done <read_file.txt  

#Reading file by omitting Backslash Escape
#Jos haluamme lukea tiedoston jokaisen rivin rivi riviltä jättämällä pois kenoviivan poiston, meidän on käytettävä "-r"-vaihtoehtoa "read"-komennon kanssa "while"-silmukassa, esim.:

#varsinaisesti menee sama kuin esim 4, mutta pieni scripttauksen ero
##esim 5)
#!/bin/bash  
  
while read -r line; do  
  
echo $line  
done < read_file.txt  
