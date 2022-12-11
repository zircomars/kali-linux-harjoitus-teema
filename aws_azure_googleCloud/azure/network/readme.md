# Network muistiinpanoja

## NSG
network security group - mitä tyyppillisesti tarvii jokin säännön verkkojen resursseihin. Näiden sääntö määrittää mitä tietoliikenne virtaa pois virtuaalikoneesta. 
Käyttäjä voi määrittää portit, protokollat ja ip-osoitteet ovat sallitttu ja mihin suntaan. Joten nämä sallii ryhmitksen säännön jotta sallii yksittäisen tietoverkko käyttöliittymän tai koko aliverkkon subnet.
Tämän joustavuuden avulla voit tarkasti hallita, miten ja milloin sääntöjä sovelletaan sovelluksesi tietoturvatarpeiden täyttämiseksi. Myös NSG kutsutaan verkon suodatimeksi (network filter), että sitä se on palomuurin osa, koska palomuuri tekee enemmän toimintaa kuin verkko filtteri. NSG on listan sääntö, että vastaa kyllä tai ei verkkoliikennelle niin kuin luoneen resurssien virtuaalikoneet.  NSG voi hallinoida saapuvia ja lähteviä liikenteitä joten listaukset NSG menevät määriteltäviin sääntöihin.

<img src="image/azure-network-nsg.PNG?raw=true" width="500">

Resurssista voi käyttää lähde ja kohteen IP-osoite (source and destination), että käytteän tcp tai udp protokollaa. Azure NSG luomisessa kantsii antaa jokin luku sille, koska sitä lukua kutsutaan prioriteetiksi, mitä alempi numero sitä korkeampi prioriteetti ja luvun aloittamisesta alkaen 100:sta kohti 4096 asti. Säännöstä prioriteetti lähellä 100 laitaa täytöön/pakollinen (enforced) tai tulee olemaan vaikuttava (effective). 
- Lower value - higher priority
- priority values start from 100 to 4096

<img src="image/azure-nsg-1.PNG?raw=true" width="600">

Uuden NSG sääntöjen luomisessa käytettään oletus sääntöjä saatavilla, mutta alhaisin prioriteetti luku. Uusien sääntöjen luomisessa peräisestä oleva liikenteestä ja päätyvä virtuaalikoneessa sallii saapuvan ja lähtevän suunnan (inbound & outbound direction). Oletuksena verkko sallii virtuaalikoneen, ja koska virtuaalikone lähtevä liikenne on sallittu, mutta saapuva liikenne on suojattu/blokattu, joten tarvitaan load balancer (työkalu). Microsoft load balancer tukee virtuaalikoneen ja tukee instanssia. Jos ei käytä load balancer:ia niin tulee ohittaa nsg säännön luomista.

- virtual network - vnet (inbound and outbound traffice inside vnet is enabled by default)
- internet (outbound traffic is allowed, but outbound traffic is blocked)
- load balancer (microsoft one of resources, it allow azure's load balancer to probe the health of user VMs and role instances)

<img src="image/azure-nsg-2.PNG?raw=true" width="500">
