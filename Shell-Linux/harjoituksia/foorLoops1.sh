# LOOPS
# for-loops

# jollekin toiminalle ja käytännön tyypiä. Silmukkaa käytetään suorittamaan titetttyn joukkon komentoa luettelon kullekin kohalle

for var-name in <list>
do
 <action to perform>
done

esim. jos shellissä suoritettaan jotakin pinggausta, ip-osoitteeseen nin se tekee sen 10.11.1.1 - 10.11.1.10 asti
siksi siinä on alkaminen 10.11.1.X jotakin
$for ip in $(seq 1 10); do echo 10.11.1.$ip; done
10.11.1.1
10.11.1.2
10.11.1.3
10.11.1.4
10.11.1.5
10.11.1.6
10.11.1.7
10.11.1.8
10.11.1.9
10.11.1.10


kali@kali:~$ for i in {1..10}; do echo 10.11.1.$i;done
10.11.1.1
10.11.1.2
10.11.1.3
10.11.1.4
10.11.1.5
10.11.1.6
10.11.1.7
10.11.1.8
10.11.1.9
10.11.1.10
