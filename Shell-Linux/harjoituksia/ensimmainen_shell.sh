#perus lukaisee käyttäjän komennon, eli näppyttää jotain

#esim1) 
echo "What is your name?"
read PERSON
echo "Hello, $PERSON"

#tyhjä rivi vähä kuin html br, koodauksessa \n
echo -e "\n"

#esim2)
echo "Firstname please?"
read firstName
echo "and lastname"
read lastName
echo "age?"
read age
echo "Hello, $firstName , $lastName & age is: $age"

#console/outputs::::::
# What is your name?
# qwer
# Hello, qwer


# Firstname please?
# John 
# and lastname
# Smith
# age?
# 22
# Hello, John , Smith & age is: 22
