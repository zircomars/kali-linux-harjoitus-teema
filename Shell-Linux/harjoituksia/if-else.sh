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

if [[ $NUM -gt 10 ]]
then
  echo "Antamasi numero on suurempi kuin 10."
else
  echo "Antamasi numero on tasan tai pienmpi kuin 10."
fi

