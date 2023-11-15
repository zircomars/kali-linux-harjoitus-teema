# Skannaus ja hallinta verkossa

# harjoitus; https://digtvbg.com/files//books-for-hacking/Hacking%20with%20Kali%20Linux%20-%20A%20Beginner%27s%20Guide%20to%20Ethical%20Hacking%20with%20Kali%20%26%20Cybersecurity%2C%20Includes%20Linux%20Command%20Line%2C%20Penetration%20Testing%2C%20Security%20Systems%20and%20Tools%20for%20Computer%20by%20Stephen%20Fletcher.pdf
# chapter 5. - Scanning and managing Networks
# sivu START HERE: 64 - 75

# On mahdollista etsiä muita verkkolaitteita ja muodostaa niihin yhteyden järjestelmä on ratkaisevan tärkeä menestyväksi hakkeriksi ja langattomasti Wi-Fi- ja Bluetooth-yhteyksien löytäminen ja hallinta on elintärkeää.

# Jos joku voi murtautua langattomiin yhteyteen, hän voi päästä laitteeseen ja saada luottamuksellisia tietoja. Tässä harjoituksessa tarkistellaan langatonta tekniikkaa Linux:ssa Wifi ja Bluetooth:issa

##########################################

# Verkkon skannaus;

# Suoritettaan skannauksen verkkoja ensisijaisesti auttamaan meitä järjestelmän ylläpidossa tai suojauksessa
# Hakkerit voivat myös suorittaa verkkoskannausharjoituksen ennen hyökkäysten aloittamista.

# Tärkeitä kohtia, jossa syy miksi skannaa verkoston;
  # Käytettävissä olevien UDP- ja TCP-verkkopalvelujen tunnistus jotka saattavat juosta kohteissa.

  # Ymmärtääksesi käytössä olevat suodatusjärjestelmät kohdeisäntien ja käyttäjän välillä.

  # Tutustu käyttöjärjestelmiin, joita käytetään IPR-vastaustensa arvioinnin.

  # Analysoi tietyn kohteena olevan isäntä sen TCP-sekvenssinumeron ennustettavuuden suhteen, jotta TCP-huijauksen ja hyökkäyssekvenssin ennustaminen on mahdollista.

# Verkkoskannauksien yksi keskeisiä vaiheita, jossa hyökkääjä voi mahdollista kerätä jotakin tietoja;

  # Network scanning with ifconfig
    # The ifconfig command is one of the essential tools that can be used for examining and interacting with active network interfaces. You can use it to query your active network connections by simply entering ifconfig in the terminal.

  # Scanning Wireless Networks with iwconfig
    # If you have a wireless adapter, you can use the iwconfig command to gather crucial information for wireless hacking such as the adapter’s IP address, its MAC address, what mode it’s in, and more. The information you can glean from this command is particularly important when you’re using wireless hacking tools like aircrackng. 

┌──(kali㉿kali)-[~]
└─$ ifconfig eth0
eth0:


                                                                                         
┌──(kali㉿kali)-[~]
└─$ ifconfig -s  
Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0             1500   796973      0      0 0        554993      0      0      0 BMRU
lo              65536  4523137      0      0 0       4523137      0      0      0 LRU

########################################################
######## Wi-Fi Networks #############

┌──(kali㉿kali)-[~]
└─$ ifconfig


┌──(kali㉿kali)-[~]
└─$ iwevent 


┌──(kali㉿kali)-[~]
└─$ iwlist 


┌──(kali㉿kali)-[~]
└─$ iwspy 



┌──(kali㉿kali)-[~]
└─$ ifrename



┌──(kali㉿kali)-[~]
└─$ iwgetid













