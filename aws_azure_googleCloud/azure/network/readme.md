# Network muistiinpanoja

## Azure's load balancer

Suomeksi kuormituksen tasaaminen, mikä tietotekniikan käytettävä termi, tarkoittaa vaadittavan työmäärän jakamista kahden tai useamman palvelimille. Sen tarkoituksena on määrittely liikenteen jakaja, joka reitittää pyynnön ja tehtävät palvelimille. Tyypillisesti käyttökohteiden DNS-nimi palvelut ja verkkosivujen jakamista. Tasaisella voi varmistaa tehtävän valmistumista lyhyimmässä  ajassa (viiveen minimointia) ja palvelun laatujen parantamista. 

<img src="image/azure-loadbalancer-1.PNG?raw=true" width="500">

Se voidaan konfiguroida jakamaan kuormaa kolmansien osapuolien NVA-palveluiden kesken Azuressa. Gateway-kuormanjaka varmistaa symmetrisen verkkoliikenteen ja yhdenmukaisen reitin NVA:lle ilman manuaalista reititystä. NVA-palveluiden tarjoajat myyvät palveluitaan Azure Marketplacessa, ja kuormanjakaja huolehtii automaattisesti niiden skaalautuvuudesta, saatavuudesta sekä kuormanjaosta.

Load balancer toimii OSI-mallissa layer 4 (transport layer, käsittelee tietoverkon kuljetus kerroksessa on käsittelymenetelmä jako verkkopinon protokolla-arkkitehtuuria Internet-protokollan paketia) ja layer 7 (application layer - sovelluskerros)-  Load Balancer jakaa kuormituksen tasaajan etupään saapuvat virrat backend pool-esiintymiin. Nämä virrat ovat määritettyjen kuormituksen tasapainotus sääntöjen ja terveystarkastusten mukaisia. Taustavaraston ilmentymät voivat olla Azure Virtual Machines tai Virtual Machine Scale Set -esiintymiä.

<img src="image/azure-loadbalancer-2.PNG?raw=true" width="500">

### Load balancer komponentit

Julkisen load balancer:in outbound voi tarjota lähtevien yhteyksiä virtuaalikoneen sisäisen verkoon. Tämä yhteys voi saada aikaan kääntämällä yksityiset IP-osoiteensa julkiseksi IP-osoittekeis. Julkisen load balancer:in käytetään kuormitusta tasapainottamista internet-liikennettä virtuaalikoneelle.Myös julkisen IP-osoitetta virtuaalikoneen etäyhteyttä edellyttää SSH:lla tai RDP:llä tai verkkoselaimen virtuaalikoneella toimivaa verkkosivustoa käyttämiseen.

Sisäisen (internal) tai yksityisen (private) load balancer:it käytetään, kun yksityisiä IP-osoitetta tarvitaan vain fronted (käyttöliittymässä). Sisäisiä load balancer käytetään load balancer.in virtuaalikoneen sisällä. Load balancer:in fronted voi käyttää paikallista (on-premises) verkostoa hybridi skenaariossa. 

<img src="image/azure-loadbalancer-3.PNG?raw=true" width="500">

Kuormauksen koostuu muutamista pää komponentista
- Frontend IP  Pool -  sisääntulo piste load balancer:iin, jotta voi sallia pääsyn  osoitteesta internetiin. IP-osoite voi liittää käyttöliittymään frontend IP pool:iin, ja yksityisiä  IP-osoitteita voi liittää sisäisen kuormitukseen.

- Health probes - Monitori  liitettyjen virtuaalikoneiden tila, että varmistaakseen,  että liikenne on vain jaettava terveille (healthy) ja responsiivisialle (responsive) virtuaalikoneille.Tarkastuksen suorittamista säännöllisesti sen varmistaakseen, että virtuaalikone  reagoi oikeeseen liikenteeseen.

- Load-balancer rules - Jakaa liikenteen virtuaalikoneelle. Jokaista saapuvista paketista verrataan sääntöihin, jotka määrittelevät saapuvia  protokollia ja portit, ja jonka jälkeen jaetaan joukolle siihen liittyviä virtuaalikoneita. Jos mikäkin sääntö ei vastaa saapuvia liikennettä, joten liikenne katkeaa.

-  Network address translation (NAT) rules - NAT sääntö, mitä voi reititää liikenteen suoraan tieettyihin virtuaalikoneisiin. Jos esim. halutaan tarjota etäkäytön SSH:n tai RDP:n kautta, niin voi määrittää NAT säännön liikenteeseen välittämiseksi ulkoista portista yhteen virtuaalikoneeseen.

- Backend IP Pool - Missä sovellusta suorittavat virtuaalikonetta on liitetty. Load balancer - säännöt liittyvät backend pool:iin, ja sitä voi luoda erilaisia backend pooleja sovellusten eri osille.

### Rules

Load balancer sääntöjä käytetään määrittämään, kuinka saapuva liikenne jaetaan kaikille backend pool:ille esiintymiselle. load balancing rule  sääntö kartoittaa tietyn käyttöliittymän IP-konffauksen ja portin useisiin backend IP-osoitteisiin ja -portteihin. Load balancer säännöt koskevat vain saapuvaa liikennettä. 

Esim. käytettäisi portti 80 load balancer:in sääntöä liikenteen ohjaamista frontend (käyttöliittymän) IP-osoitteesta tausta-instenssien porttiin 80.

<img src="image/azure-loadbalancer-4.PNG?raw=true" width="500">

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
