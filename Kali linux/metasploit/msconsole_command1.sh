# tarkistaminen erilaisien hyötyohjelmien, apumoduulit, hyötykuormat (payloads), ja laajennuksia, joista MSF tarjoaa käyttäjille msfconsole käyttämällä käyttöliittymänsä
msf6 > show -h
[*] Valid parameters for the "show" command are: all, encoders, nops, exploits, payloads, auxiliary, post, plugins, info, options, favorites
[*] Additional module-specific parameters are: missing, advanced, evasion, targets, actions


###########

# MSF syntax
# Metasploit Framework sisältyy satoja lisämooduleja, jotka tarjoavat toimintoja, kuten protokollien luetteloinnin, porttien skannausta, fuzzing, sniffing ja jne.

# kaikki moduulit noudattavat yleisiä synktaksien käyttöä, mikä tekee niistä helppoja tutkia ja käyttää. Esim. muutamista yleisien MSF-apumoduulia saadakseen käsityksien MSF:n käyttämistä tarvittaessa syntaksia:

# Show auxiliary - komento näyttää pitkän listan periaatteessa kaikista MSF:n erilaisien apumoduulien, joihin voidaan käyttää erilisien tehtäviin, kuten tietojen keräämistä (kerräys/hierarkeen), skannaus ja eri palvleujen luettelointi (skannerin/hierakiin) ja jne.


msf > show auxiliary
msf6 > show auxiliary 

Auxiliary
=========

   #     Name                                                                     Disclosure Date  Rank    Check  Description
   -     ----                                                                     ---------------  ----    -----  -----------
   0     auxiliary/admin/2wire/xslt_password_reset                                2007-08-15       normal  No     2Wire Cross-Site Request Forgery Password Reset Vulnerability
   1     auxiliary/admin/android/google_play_store_uxss_xframe_rce                                 normal  No     Android Browser RCE Through Google Play Store XFO
   2     auxiliary/admin/appletv/appletv_display_image                                             normal  No     Apple TV Image Remote Control
   3     auxiliary/admin/appletv/appletv_display_video                                             normal  No     Apple TV Video Remote Control
   4     auxiliary/admin/atg/atg_client                                                            normal  No     Veeder-Root Automatic Tank Gauge (ATG) Administrative Client
   5     auxiliary/admin/aws/aws_launch_instances                                                  normal  No     Launches Hosts in AWS
   6     auxiliary/admin/backupexec/dump                                                           normal  No     Veritas Backup Exec Windows Remote File Access
   7     auxiliary/admin/backupexec/registry                                                       normal  No     Veritas Backup Exec Server Registry Access
   8     auxiliary/admin/chromecast/chromecast_reset                                               normal  No     Chromecast Factory Reset DoS
   9     auxiliary/admin/chromecast/chromecast_youtube                                             normal  No     Chromecast YouTube Remote Control
#  ....
   1192  auxiliary/voip/cisco_cucdm_speed_dials                                                    normal  No     Viproy CUCDM IP Phone XML Services - Speed Dial Attack Tool
   1193  auxiliary/voip/sip_deregister                                                             normal  No     SIP Deregister Extension
   1194  auxiliary/voip/sip_invite_spoof                                                           normal  No     SIP Invite Spoof
   1195  auxiliary/voip/telisca_ips_lock_control                                  2015-12-17       normal  No     Telisca IPS Lock Cisco IP Phone Control
   1196  auxiliary/vsploit/malware/dns/dns_mariposa                                                normal  No     VSploit Mariposa DNS Query Module
   1197  auxiliary/vsploit/malware/dns/dns_query                                                   normal  No     VSploit DNS Beaconing Emulation
   1198  auxiliary/vsploit/malware/dns/dns_zeus                                                    normal  No     VSploit Zeus DNS Query Module
   1199  auxiliary/vsploit/pii/email_pii                                                           normal  No     VSploit Email PII
   1200  auxiliary/vsploit/pii/web_pii                                                             normal  No     VSploit Web PII

####  seuraava harjoitus; #####
# seuraavaksi jos käytettäisi jotakin apumoduulia (auxiliary modules) luodakseen uudelleen joitakin aiempaa suorittujen luettelointi toimenpiteitä. Jos aikoo käyttäää mitä tahansa auxiliary module, exploit tai plugins niin anna komento "use" saadakseen liitettynä siihen moduuliin nimi.

# Sitten voi käyttää "info" - komentoa saadakseen lisätietoja tiettyyn moduuliin.
# kantsii käyttää jotakin tietoisia työkalupakkia kyvykyyksiin ja rajoituksiin.


# esim. komennossa suoritettaan yksinkertaisella SNMP enumeration moduulia ja tarkistmalla sen tietoa;

msf> use auxiliary/scanner/snmp/snmp_enum
msf auxiliary(snmp_enum) > info
 Name: SNMP Enumeration Module
 Module: auxiliary/scanner/snmp/snmp_enum
 Version: 0
 License: Metasploit Framework License (BSD)
 Rank: Normal
...

# seuraavaksi, tarkistettaan/selvitettään kuinka auxiliary moduuli käytetään "show options" komennolla näyttää kaikki tämän kyseisen moduulien suorittamisen tarvittavat parametrit

msf6 auxiliary(scanner/snmp/snmp_enum) > show options

Module options (auxiliary/scanner/snmp/snmp_enum):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   COMMUNITY  public           yes       SNMP Community String
   RETRIES    1                yes       SNMP Retries
   RHOSTS                      yes       The target host(s), see https://docs.metasploit.com/docs/using-metaspl
                                         oit/basics/using-metasploit.html
   RPORT      161              yes       The target port (UDP)
   THREADS    1                yes       The number of concurrent threads (max one per host)
   TIMEOUT    1                yes       SNMP Timeout
   VERSION    1                yes       SNMP Version <1/2c>


View the full module info with the info, or info -d command.

##################
# en tiedä toimiiko tästä jos määrittää tommoisen IP-osoite rajan/alueen kuin 10.11.1.1-254 , harjoituksen kannalta ehkä voi toimia..
# ja tämä on joku yksityinen IP-osoite 

┌──(kali㉿kali)-[~]
└─$ whois 10.11.1.1

# ARIN WHOIS data and services are subject to the Terms of Use
# available at: https://www.arin.net/resources/registry/whois/tou/
#
# If you see inaccuracies in the results, please report at
# https://www.arin.net/resources/registry/whois/inaccuracy_reporting/
#
# Copyright 1997-2023, American Registry for Internet Numbers, Ltd.
#


NetRange:       10.0.0.0 - 10.255.255.255
CIDR:           10.0.0.0/8
NetName:        PRIVATE-ADDRESS-ABLK-RFC1918-IANA-RESERVED
NetHandle:      NET-10-0-0-0-1
Parent:          ()
NetType:        IANA Special Use
OriginAS:       
Organization:   Internet Assigned Numbers Authority (IANA)

###############################
########## harjoitus START HERE #########
# https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# pages: 309 - 316

# eli jotkin parametrit ovat pakollisia, ennen kuin moduuli voidaan suorittaa onnistuneeksi. Tässä keissisä käytetään lisättävinä kuin "RHOTS"-arvoa tai IP-osoiteen aluetta, jonka haluttaisi skannata. Kun asetukset on määritetty, niin voidaan ajaa moduuli "run"-komentoa. Sitten voidaan asettaa "THREADS" - määritelmän arvoon 10 nopeuttakseen skannausta.

msf6 auxiliary(scanner/snmp/snmp_enum) > 
msf6 auxiliary(scanner/snmp/snmp_enum) > set RHOSTS 10.11.1.1-254
RHOSTS => 10.11.1.1-254
msf6 auxiliary(scanner/snmp/snmp_enum) > set THREADS 10
THREADS => 10
msf6 auxiliary(scanner/snmp/snmp_enum) > show options 

Module options (auxiliary/scanner/snmp/snmp_enum):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   COMMUNITY  public           yes       SNMP Community String
   RETRIES    1                yes       SNMP Retries
   RHOSTS     10.11.1.1-254    yes       The target host(s), see https://docs.metasploit.com/docs/using-metaspl
                                         oit/basics/using-metasploit.html
   RPORT      161              yes       The target port (UDP)
   THREADS    10               yes       The number of concurrent threads (max one per host)
   TIMEOUT    1                yes       SNMP Timeout
   VERSION    1                yes       SNMP Version <1/2c>


View the full module info with the info, or info -d command.

# tässä alkaa skannata ja suorittaa jokaisen IP-osoitteen aluetta eli kaikki ja välissä on tietty prosentti, etät paljon se on skannanut
msf6 auxiliary(scanner/snmp/snmp_enum) > run

[-] 10.11.1.6 SNMP request timeout.
[-] 10.11.1.2 SNMP request timeout.
[-] 10.11.1.7 SNMP request timeout.
[-] 10.11.1.5 SNMP request timeout.
...
[-] 10.11.1.27 SNMP request timeout.
[-] 10.11.1.30 SNMP request timeout.
[*] Scanned  26 of 254 hosts (10% complete)
[-] 10.11.1.31 SNMP request timeout.
[-] 10.11.1.32 SNMP request timeout.
...
[-] 10.11.1.254 SNMP request timeout.
[*] Scanned 254 of 254 hosts (100% complete)
[*] Auxiliary module execution completed
msf6 auxiliary(scanner/snmp/snmp_enum) > 

msf6 auxiliary(scanner/snmp/snmp_enum) > use auxiliary/scanner/smb/smb_version 
msf6 auxiliary(scanner/smb/smb_version) > show options

Module options (auxiliary/scanner/smb/smb_version):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOSTS                    yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploi
                                       t/basics/using-metasploit.html
   THREADS  1                yes       The number of concurrent threads (max one per host)


View the full module info with the info, or info -d command.

msf6 auxiliary(scanner/smb/smb_version) > 

# MSF ei kuljeta määritettyjiä muuttujia moduulien välillä. RHOSTS ja THREADS arvot ovat tyhjät "smb_version" tarkistus moduulia . Joten voidaan muuttaa tätä käyttämistä käyttämällä yleisiä istuntoarvoja käyttämällä "setg" -komentoa

msf6 auxiliary(scanner/smb/smb_version) > setg RHOSTS 10.11.1.1-254
RHOSTS => 10.11.1.1-254
msf6 auxiliary(scanner/smb/smb_version) > setg THREADS 10
THREADS => 10
msf6 auxiliary(scanner/smb/smb_version) > run

[*] 10.11.1.1-254:        - Scanned  29 of 254 hosts (11% complete)
[*] 10.11.1.1-254:        - Scanned  51 of 254 hosts (20% complete)
[*] 10.11.1.1-254:        - Scanned  77 of 254 hosts (30% complete)
[*] 10.11.1.1-254:        - Scanned 102 of 254 hosts (40% complete)
[*] 10.11.1.1-254:        - Scanned 127 of 254 hosts (50% complete)
[*] 10.11.1.1-254:        - Scanned 153 of 254 hosts (60% complete)
[*] 10.11.1.1-254:        - Scanned 179 of 254 hosts (70% complete)
[*] 10.11.1.1-254:        - Scanned 204 of 254 hosts (80% complete)
[*] 10.11.1.1-254:        - Scanned 230 of 254 hosts (90% complete)
[*] 10.11.1.1-254:        - Scanned 254 of 254 hosts (100% complete)
[*] Auxiliary module execution completed


msf6 auxiliary(scanner/http/webdav_scanner) > show options

Module options (auxiliary/scanner/http/webdav_scanner):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   PATH     /                yes       Path to use
   Proxies                   no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS   10.11.1.1-254    yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploi
                                       t/basics/using-metasploit.html
   RPORT    80               yes       The target port (TCP)
   SSL      false            no        Negotiate SSL/TLS for outgoing connections
   THREADS  10               yes       The number of concurrent threads (max one per host)
   VHOST                     no        HTTP server virtual host


View the full module info with the info, or info -d command.







