# We can alter the behavior of the read command with various command line options. Two of the most commonly used options include -p, which allows us to specify a prompt, and -s, which makes the user input silent. The latter is ideal for capturing user credentials

~/variables-muuttujat$ cat ./input2.sh 
#!/bin/bash
# Prompt the user for credentials

read -p 'Username: ' username
read -sp 'Password: ' password
echo "Thanks, your creds are as follows: " $username " and " $password
~/variables-muuttujat$ ./input2.sh

# input out example;;;;;
# Username: john123
# Password: Thanks, your creds are as follows:  john123  and  password1238888





