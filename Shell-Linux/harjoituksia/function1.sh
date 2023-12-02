# Function

# bash scriptiin sisään voi ajatella jotakin funktiota , mikä on hyödyllinen, kun scriptin tekijä tai käyttäjä/joku suorittaa saman koodin useita kertoja scriptissä. Sijaan joutuisi kirjoittaa saman uudelleen toista kertaa jälkeen, kirjoittamisessa sen vain kerran funktiota ja kutsutaan sitten funktio tarpeen mukaan

# funktiota on alirutiini (subroutine) ja koodilohko (codeblock), joka totuetuu joukon operaatiota - black box, joka suorittaa tietyn tehtävän. funktiota voidaaan kirjoittaa erissä muodossa.

##################
# esim. yleinen bash scripti muoto;
function function_name {
commands...
}

# ja toinen esim. joka on C ohjelmointikielessä muodossa;
function_name () {
commands...
}

# The formats are functionally identical and are a matter of personal preference (esim1)
# function example script
#!/bin/bash
# function example1
print_me () {
 echo "You have been printed!"
}
print_me

# printout:
~/BooleanLogicalOperations$ ./main.sh 
You have been printed!

##################
# Functions can also accept arguments: example2

#!/bin/bash
# passing arguments to functions
# $function (pseudorandom) int value range 0 - 32767 (signed 16-bit integer)
pass_arg() {
 echo "Today's random number is: $1"
}
pass_arg $RANDOM

# tässä esim. 2:ssa on random funktio, joka tulostu muodossa $1 jotakin, ja viittaa ensimmäisen ergumenttiin.

# funktiota määritellään pass_arg() sisään sulkeita, mutta virallisesti tämä tapahtuu C ohjelmointikielessä ja siihen argumentiin, mutta Bash scriptissä ei tarvitse kun loogisesti Bash:issä voi kutsua jotakin muuta ja siksi ei tarvitse määrittää sulkua



#####################
# return value example
# lisäksi voidaan välittää argumenttia Bash-funktiolla ja sillä voidaan palautta arvoja Bash funktiosta, ja funktion itsensä eivät anna käyttäjälle palauttaa arbitrary arvoja.


# Instead, a Bash function can return an exit status (zero for success, non-zero for failure) or some other arbitrary value that we can later access from the $? global variable

#!/bin/bash
# function return value example
return_me() {
 echo "Oh hello there, I'm returning a random value!"
 return $RANDOM
}
return_me
echo "The previous function returned a value of $?"


# output example of the return value
~/BooleanLogicalOperations$ ./main.sh 
Oh hello there, I'm returning a random value!
The previous function returned a value of 140
~/BooleanLogicalOperations$ 
~/BooleanLogicalOperations$ ./main.sh 
Oh hello there, I'm returning a random value!
The previous function returned a value of 154
~/BooleanLogicalOperations$ 
~/BooleanLogicalOperations$ ./main.sh 
Oh hello there, I'm returning a random value!
The previous function returned a value of 229

# Notice that a random number is returned every time we run the script, because we returned the
special global variable $RANDOM (into $?). If we used the return statement without the $RANDOM
argument, the exit status of the function (0 in this case) would be returned instead.

# Now that we have a basic understanding of variables and functions, we can dig deeper and discuss variable scope.

# The scope of a variable is simply the context in which it has meaning. By default, a variable has a global scope, meaning it can be accessed throughout the entire script. In contrast, a local variable can only be seen within the function, block of code, or subshell in which it is defined. We can “overlay” a global variable, giving it a local context, by preceding the declaration with the local keyword, leaving the global variable untouched. The general syntax is:

# periaatteessa toi name_change() funktio toistuu siinä välissä
#!/bin/bash
# var scope example
name1="John"
name2="Jason"

name_change() {
 local name1="Edward"
 echo "Inside of this function, name1 is $name1 and name2 is $name2"
 name2="Lucas"
}

echo "Before the function call, name1 is $name1 and name2 is $name2"
name_change
echo "After the function call, name1 is $name1 and name2 is $name2"

# output:
Before the function call, name1 is John and name2 is Jason
Inside of this function, name1 is Edward and name2 is Jason
After the function call, name1 is John and name2 is Lucas








