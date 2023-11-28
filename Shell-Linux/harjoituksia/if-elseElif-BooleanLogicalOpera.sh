These operators can also be used in a test to compare variables or the results of other tests. When used this way, AND (&&) combines two simple conditions, and if they are both true, the combined result is success (or True or 0).

#/bin/bash
# and example
if [ $USER == 'runner' ] && [ $HOSTNAME == '791b6d5ff087' ]
then
 echo "Multiple statements are true!"
else
 echo "Not much to see here..."
fi


# check own shell
~/BooleanLogicalOperations$ echo $USER
runner

~/BooleanLogicalOperations$ echo $HOSTNAME 
791b6d5ff087
~/BooleanLogicalOperations$ ./main.sh 
Multiple statements are true!
~/BooleanLogicalOperations$ 

# jos $USER ja/tai $HOSTNAME on ihan muuta tuloksena siis täsmennettynä
~/BooleanLogicalOperations$ ./main.sh 
Not much to see here...

# perus jos toistettaan tarkistellaan sitä käyttistä ja hostnimi
~/BooleanLogicalOperations$ echo $USER && echo $HOSTNAME
runner
e1c145cc4889


##########################################################
# toinen esim josta käytettään || kaksi pipe viivaa, josta boolean operaattori testaamalla löytyyykö yhtä tai useampaa ehtoa, mutta vain yhden ehdon on oltava tosi


#!/bin/bash
# or example
# the real one if check the $ less  /etc/passwd; 
# runner:x:1000:1000:,,,:/home/runner:/bin/bash

# user = runner && hostname = e1c145cc4889
if [ $USER == 'asdf' ] || [ $HOSTNAME == 'pwn' ]
then
 echo "One condition is true, this line is printed"
else
 echo "You are out of luck!"
fi
