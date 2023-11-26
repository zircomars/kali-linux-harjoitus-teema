# muuttujan (variable) arvo muuttaminen tai antaminen, tämä toimii periaatteessa yksi suora arvoisena, että pitää antaa "nimi=arvo" jotakin ja ilmoittamisessa edessä ja takana ei saa olla välilyöntiä, jos antaa niin se tositaa jokin pien error:in

~/variables-muuttujat$ first_name=Mikael
~/variables-muuttujat$ last_name=Doe_Hacker
~/variables-muuttujat$ last_name=Doe Hacker
bash: Hacker: command not found
~/variables-muuttujat$ last_name=Doe_Hacker
~/variables-muuttujat$ echo $first_name $last_name 
Mikael Doe_Hacker

# esim. toistettu echo niin kirjataan list listan sisään
~/variables-muuttujat$ echo $first_name $last_name >> list.txt
~/variables-muuttujat$ ls
harjoitus2.txt  list.txt  main.sh  muistio.txt
~/variables-muuttujat$ cat list.txt 
Mikael Doe_Hacker
