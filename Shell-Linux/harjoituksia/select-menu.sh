# You can use the "select" statement to create menu systems in your bash scripts that users can interact with. When you combine "select" with the "case" statement you can create more sophisticated menu options. This section will provide three examples that use select to create menus. If you are not familiar with the case statement, you can refer to our Getting Started with Bash Shell Scripting guide.

# esimerkki
# select WORD [in LIST];
# do COMMANDS;
# done

# valitse/menu valinta, että kysyy niin kauan kuin käyttäjä vastaa 

#esim 1)
#!/bin/bash

echo "mikä on suosikki värisi: ?"

select VARI in sininen punainen keltainen vihreä musta valkoinen 
do
    echo "Valintasi on: $VARI" #objekti
    break
done

### output:

#mikä on suosikki värisi: ?
#1) sininen    3) keltainen  5) musta
#2) punainen   4) vihreä     6) valkoinen
#? 4
#Valintasi on: vihreä
