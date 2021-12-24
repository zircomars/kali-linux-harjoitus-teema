#tässä esim. määritetään yhdistetyn skenaarioksi, että on myös oletustapaus,kun esimerkkin 1 harjotus, ja vastaava tapausta ei löydy

echo "Mitä käyttöjärjestelmää käytät ja valitse vaihtoehto."  
echo "A) Windows, B) Android, C) Chrome, D) Linux, E) Muu?"  
read -p "Vastaus:: " softAnswer  
  
#read user inputs characters, even first is upper or not, and full characters
case $softAnswer in  
    A|a|Windows|windows)  
        echo "Windows"  
        echo  
        ;;  
    B|b|Android|android)  
        echo "Android"  
        echo  
        ;;  
    C|c|Chrome|chrome)  
        echo "Chrome selain"  
        echo  
        ;;  
    D|d|Linux|linux)  
        echo "Linux Pingiivini"  
        echo  
        ;;  
    #input others if not match A - D
    e|*)  
        echo "Muu.."  
        ;;  
esac  #case ENDS HERE
