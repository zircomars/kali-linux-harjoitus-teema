#command substitution
#Komentojen korvaaminen on mekanismi, jolla kuori suorittaa tietyn komentojoukon ja korvaa sitten niiden tulosteen komentojen tilalle.

#periaatteessa special merkit, että käyttää `` , ja jotta toistetaan se määritetty komento

DATE=`date`
echo "Date is $DATE"
echo -e "\n"

USERS=`who | wc -l`
echo "Logged in user are $USERS"

echo -e "\n"
UP=`date ; uptime`
echo "Uptime is $UP"

#outputs/console
#
# Date is Mon Dec  6 14:26:21 UTC 2021

# Logged in user are 0


#Uptime is Mon Dec  6 14:26:21 UTC 2021
# 14:26:21  up   0:34,  0 users,  load average: 3.54, 3.10, 2.88
#
