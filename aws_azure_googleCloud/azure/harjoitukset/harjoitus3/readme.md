# harjoitus 3
Resurssien luonti, että luodaan pieni virtuaalikone (VDI)

<!-- <img src="harjoitus1/azure-02.PNG" width="400"> -->

1. Avaa koneesi selaimesta portal.azure.com ja kirjaudu sisään. Klikkaa vasemmasta laidasta + Create a Resource -valintaa ja valitse Windows Server 2019 Datacenter. Anna seuraavat tiedot: <br>

Resource Group: Valitse create new ja anna sille joku yksilöllinen nimi <br>
Virtual Machine Name: Anna joku yksilöllinen nimi koneelle <br>
Region: (Europe) North Europe <br>

Size: Valitse Change size ja valitse listasta Standard B2ms <br>

Username: Joku tunnus pääkäyttäjäksi <br>
Password: Anna joku validi salasana, min. 12 merkkiä (älä unohda antamaasi salasanaa ) <br>
Vahvista salasanasi <br>

Klikkaa Next:Disks> <br>
Tarkista, että valinta on Premium SSD (locally-redundant storage). Ei luoda vielä datalevyjä. <br>
Klikkaa Next: Networking > <br>

Klikkaa Review + Create. Tarkista, että validointi meni läpi ja klikkaa Create. Odota, kunnes virtuaalikone on luotu. <br>

Tarkista, että virtuaalikoneresurssiin ei ole liitetty ongelmailmoituksia. Avaa virtuaalikoneen blade (overview) klikkaamalla sitä ja mene valikossa alaspäin kohtaan Help. Valitse Resource Health ja tarkista, ettei hälyttäviä ilmoituksia ole. <br>

<img src="images/harjoitus3-1.PNG">

<img src="images/harjoitus3-2.PNG">

<img src="images/harjoitus3-3.PNG">

<img src="images/harjoitus3-5-1.PNG">

<img src="images/harjoitus3-5-2.PNG">

<img src="images/harjoitus3-5-3.PNG">

<img src="images/harjoitus3-5-4.PNG">

<img src="images/harjoitus3-5.PNG">






