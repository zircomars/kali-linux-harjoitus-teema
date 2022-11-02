# scripttauksessa, että pyyttää käyttäjän valitsee neljästä vaihtoehdoista eli jos valitsee 3sta niin perään tulostuu pieni lyhyt teksti, ja jos 4 lopettaa kysellyn. Tässä scripttauksessa kysyy niin kauan kuin käyttäjä joko lopettaa tai valitsee 1-3 vaihtoehtoon

#!/bin/bash

echo "Enter a number corresponding to the term whose definition you'd like to view"
VALINTA="My selection is:"

select TERM in LAN-network WLAN WAN exit;
do
# TERM show user what user like  to choose and there wil with small text, example 1) cloud-computing is blah blah blah
    case $TERM in
        LAN-network) 
            echo "LAN-network on fyysinen verkko, missä käytettään kiinteä tarviketta"
            ;;
        WLAN)
            echo "WLAN langatton verkko, ei käytettä fyysistä laitetta, mutta tarvii sähköä"
            ;;
        WAN)
            echo "Laajaverkko eli suuralueverkko on tiedonsiirtoo toiselle yrityksen organisaatiolle"
            ;;
        exit)
            echo "Scriptti päättyy tähän asti."
                break # end the scripting
                ;;
        *) # ask  user select again like "for-loop" until break
            echo "Valitse uuestaan:"
    esac
done



