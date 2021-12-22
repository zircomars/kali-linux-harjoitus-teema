#!/bin/bash
#if...elif...else - statements
#jos on useampi jos tai kun, jotain muuta vastaava toistettaan sitä proesessia tai tekijänsä

#if TEST-COMMAND1
# then
  #STATEMENTS1
# elif TEST-COMMAND2
# then
  #STATEMENTS2
# else
  #STATEMENTS3
#fi

echo -n "Anna jokin luku: "
read NUM

if [[ $NUM -gt 10 ]] #-gt tarkoittaa kokonaisluku (integer), mutta viiva edessä on jokin merkitys

then
  echo "The variable is greater than 10."
elif [[ $NUM -eq 10 ]]
then
  echo "The variable is equal to 10."
else
  echo "The variable is less than 10."
fi
