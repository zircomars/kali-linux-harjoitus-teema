#tässä tulostuu useita käyttäjän syöttämiä komentoja, ja jotain esimerkkejä & 

#esim 1)

#simppeli lukaisee käyttäjän toistamisen
echo "Input name:"
read NAME1

#echo "Hello, $NAME1" #viittaa tohon, ja read, että käyttäjä syöttää haluamansa tekstin 

#////////////////////
#tämä on toinen vaihtoehto
#esim 2)

echo "enter name:"
read

echo "name: $REPLY"
#reply - että kuin tulkitsee "read" käskyn ja sama dollari merkki 

#////////////////////
#esimerkki 3.1) & tämä on kuin ensimmäinen & mutta -p on tarkoittaa PROMPT (kehote)

read -p "username:" user_var  
echo "The username is: " $user_var  

#esim 3.2.) & tämä on kuin 3.1, mutta edessä on -s mitä tarkoittaa (silent mode) vähä kuin antaisi komennon salasanakseen & 
#ja tässä komennossa toistuu, minkä salasanan käyttäjä antoi & silent mode prompt

read -p "username : " user_var  
read -sp "password : " pass_var  
echo  
echo "username : " $user_var  
echo "password : "  $pass_var 

#esim 3.3.) lukaisee käyttäjän syöttämisen array tekijän (taulukko), jos on useampi nimi tai objekti, ja tässä viittaa sen käyttäjän syöttämisen määrän. 

echo "Enter names : "  
read -a names  
echo "The entered names are : ${names[0]}, ${names[1]}."  


