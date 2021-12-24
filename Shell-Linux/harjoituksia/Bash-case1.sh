#!/bin/bash
#Bash case , vähä kuin C# switch-case tai JavaScript switch case string tilanne, mutta bash:llä on oma methodi/parametri/funktio tekijänsä

#Bash case tilanteessa kulkeutuu IF-THEN-ELSE, tai jos välissä on useita tapahtumia mitä käytettään ELIF elementtiä. Tapauslausekkeen käyttäminen tekee bash-skriptistämme luettavamman ja helpommin ylläpidettävän. Näitä käytetään yleensä yksinkertaistamaan monimutkaisia ehtoja, joissa on useita erilaisia vaihtoehtoja.

#Bash-tapauslause ottaa arvon kerran ja testaa sen useita kertoja. Se lopettaa kuvion etsimisen, kun se on löytänyt sen ja suorittanut siihen linkitetyn käskyn, mikä on melkein päinvastainen C-kytkinkäskyn tapauksessa.

#Jokaisen case - että, tilanne tai jokin tapauslause alkaa avainsanalla "in" ja case päättyminen on aina "esac"

#Useita kuvion erotettuihin / operaatiota osoittaa kuvioluettelon päättymistä
#operaatin sisältää mallia kutsutaan lauseeksi, ja se on päätettävä kaksoispuolipisteellä ;;

#Asteriski-symbolia (*) käytetään viimeisenä kuviona määrittämään oletuskoko. Sitä käytetään oletustapauksena, kun sitä käytetään viimeisenä tapauksena. 

#Case tilanteen syntaksi

echo "Do you know Linux Penguin?"  
read -p "Y/N? : " Answer  

#read user input answer, if first answer is upper or lower, or full answer as yes or no characters
case $Answer in  
    Yes|yes|y|Y)  
        echo "Cool."  
        echo  
        ;;  
    No|no|N|n)  
        echo "Alright, and time to hacking."  
        ;;  
esac  #case running software ENDS HERE
