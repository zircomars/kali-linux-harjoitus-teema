#!/bin/bash
#if...elif...else - statements
#jos on useampi jos tai kun, jotain muuta vastaava toistettaan sitä proesessia tai tekijänsä

read -p "Anna joku luku, yli tai alle tämän rajan 100 - 200: " num  

#jos yli tämän 200-numeroisen rajan 
if [ $num -gt 200 ];  
then  
  echo "Yli maksimi luvun"  

#jos käyttäjä syöttää täsmällisen luvun ja toistettaan se täsmäys
elif [[ $num == 200 || $num == 100 ]];  
  then  
    echo "Bingo!"  
    echo "Luvun täsmäys"  

#jos käyttäjä syöttää 100 - 200 väliltä tai alle tämän 100 numeroisen
elif [[ $num -gt 100 && $num -lt 200 ]];  
  then  
    echo "Maksimi ja minimin väliltä"  

#jos alle 100
elif [ $num -lt 100 ];  
  then  
    echo "Alle minimi"  
fi  
