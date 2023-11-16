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
msf6 auxiliary(scanner/snmp/snmp_enum) > info

       Name: SNMP Enumeration Module
     Module: auxiliary/scanner/snmp/snmp_enum
    License: Metasploit Framework License (BSD)
       Rank: Normal

Provided by:
  Matteo Cantoni <goony@nothink.org>

Check supported:
  No

Basic options:
  Name       Current Setting  Required  Description
  ----       ---------------  --------  -----------
  COMMUNITY  public           yes       SNMP Community String
  RETRIES    1                yes       SNMP Retries
  RHOSTS                      yes       The target host(s), see https://docs.metasploit
                                        .com/docs/using-metasploit/basics/using-metaspl
                                        oit.html
  RPORT      161              yes       The target port (UDP)
  THREADS    1                yes       The number of concurrent threads (max one per h
                                        ost)
  TIMEOUT    1                yes       SNMP Timeout
  VERSION    1                yes       SNMP Version <1/2c>

Description:
  This module allows enumeration of any devices with SNMP protocol 
  support. It supports hardware, software, and network information. 
  The default community used is "public".

References:
  https://en.wikipedia.org/wiki/Simple_Network_Management_Protocol
  https://net-snmp.sourceforge.io/docs/man/snmpwalk.html
  http://www.nothink.org/codes/snmpcheck/index.php


View the full module info with the info -d command.

# RHOSTS - kohdassa tyhjä siksi otettaan pieni huomio siihen melkein kuin kohde ja siihen kohdenneettaan kyseinen IP-osoite tai voidaan tarkistaa $show options - kommennon kauttakin

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

# RHOSTS - kohdassa tyhjä siksi otettaan pieni huomio siihen melkein kuin kohde ja siihen kohdenneettaan kyseinen IP-osoite

##################

# en tiedä toimiiko tästä jos määrittää tommoisen IP-osoite rajan/alueen kuin 10.11.1.1-254 , mutta harjoituksen kannalta käytettään toi "Badstore" iso tiedostoa tähän projektiin

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

msf6 auxiliary(scanner/snmp/snmp_enum) > set RHOSTS 192.168.240.120-129
RHOSTS => 192.168.240.120-129
msf6 auxiliary(scanner/snmp/snmp_enum) > set THREADS 10
THREADS => 10
msf6 auxiliary(scanner/snmp/snmp_enum) > show options 

Module options (auxiliary/scanner/snmp/snmp_enum):

   Name       Current Setting      Required  Description
   ----       ---------------      --------  -----------
   COMMUNITY  public               yes       SNMP Community String
   RETRIES    1                    yes       SNMP Retries
   RHOSTS     192.168.240.120-129  yes       The target host(s), see https://docs.metasploit.c
                                             om/docs/using-metasploit/basics/using-metasploit.
                                             html
   RPORT      161                  yes       The target port (UDP)
   THREADS    10                   yes       The number of concurrent threads (max one per hos
                                             t)
   TIMEOUT    1                    yes       SNMP Timeout
   VERSION    1                    yes       SNMP Version <1/2c>


View the full module info with the info, or info -d command.


# tässä alkaa skannata ja suorittaa jokaisen IP-osoitteen aluetta eli kaikki ja välissä on tietty prosentti, etät paljon se on skannanut
msf6 auxiliary(scanner/snmp/snmp_enum) > run

msf6 auxiliary(scanner/snmp/snmp_enum) > run

[-] Unknown error: Errno::ECONNREFUSED Connection refused - recvfrom(2)
[*] Scanned  1 of 10 hosts (10% complete)
[-] 192.168.240.122 SNMP request timeout.
[-] 192.168.240.120 SNMP request timeout.
[-] 192.168.240.128 SNMP request timeout.
[-] 192.168.240.123 SNMP request timeout.
[-] 192.168.240.124 SNMP request timeout.
[-] 192.168.240.121 SNMP request timeout.
[-] 192.168.240.127 SNMP request timeout.
[-] 192.168.240.125 SNMP request timeout.
[-] 192.168.240.126 SNMP request timeout.
[*] Scanned  9 of 10 hosts (90% complete)
[*] Scanned 10 of 10 hosts (100% complete)
[*] Auxiliary module execution completed

msf6 auxiliary(scanner/snmp/snmp_enum) > 

msf6 auxiliary(scanner/snmp/snmp_enum) > use auxiliary/scanner/smb/smb_version 
msf6 auxiliary(scanner/smb/smb_version) > show options 

Module options (auxiliary/scanner/smb/smb_version):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOSTS                    yes       The target host(s), see https://docs.metasploit.com/doc
                                       s/using-metasploit/basics/using-metasploit.html
   THREADS  1                yes       The number of concurrent threads (max one per host)


View the full module info with the info, or info -d command.

msf6 auxiliary(scanner/smb/smb_version) > 

# MSF ei kuljeta määritettyjiä muuttujia moduulien välillä. RHOSTS ja THREADS arvot ovat tyhjät "smb_version" tarkistus moduulia . Joten voidaan muuttaa tätä käyttämistä käyttämällä yleisiä istuntoarvoja käyttämällä "setg" -komentoa

msf6 auxiliary(scanner/smb/smb_version) > 
msf6 auxiliary(scanner/smb/smb_version) > setg RHOSTS 192.168.240.120-129
RHOSTS => 192.168.240.120-129
msf6 auxiliary(scanner/smb/smb_version) > setg THREADS 10
THREADS => 10
msf6 auxiliary(scanner/smb/smb_version) > run

[*] 192.168.240.120-129:  - Scanned  1 of 10 hosts (10% complete)
[*] 192.168.240.120-129:  - Scanned 10 of 10 hosts (100% complete)
[*] Auxiliary module execution completed
msf6 auxiliary(scanner/smb/smb_version) > 

msf6 auxiliary(scanner/smb/smb_version) > show options 

Module options (auxiliary/scanner/smb/smb_version):

   Name     Current Setting      Required  Description
   ----     ---------------      --------  -----------
   RHOSTS   192.168.240.120-129  yes       The target host(s), see https://docs.metasploit.com
                                           /docs/using-metasploit/basics/using-metasploit.html
   THREADS  10                   yes       The number of concurrent threads (max one per host)


View the full module info with the info, or info -d command.

msf6 auxiliary(scanner/smb/smb_version) > 

######

# Seuraavassa lataamassa moduulissa pitäisi olla RHOSTS- ja THREADS-arvot säilytettynä

# Tarkistettaan varmuuden vuoksi käyttämällä tätä yhtä lisäskanneria, WebDAV-palvelun skanneri. 
# WebDAV-palvelin on usein huonosti määritettyjä/konfiguroituja, ja ne voivat usein johtaa nopeaan ja helppoon uhriin käsiksi.

msf6 auxiliary(scanner/smb/smb_version) > use auxiliary/scanner/http/webdav_scanner 
msf6 auxiliary(scanner/http/webdav_scanner) > show options 

Module options (auxiliary/scanner/http/webdav_scanner):

   Name     Current Setting      Required  Description
   ----     ---------------      --------  -----------
   PATH     /                    yes       Path to use
   Proxies                       no        A proxy chain of format type:host:port[,type:host:p
                                           ort][...]
   RHOSTS   192.168.240.120-129  yes       The target host(s), see https://docs.metasploit.com
                                           /docs/using-metasploit/basics/using-metasploit.html
   RPORT    80                   yes       The target port (TCP)
   SSL      false                no        Negotiate SSL/TLS for outgoing connections
   THREADS  10                   yes       The number of concurrent threads (max one per host)
   VHOST                         no        HTTP server virtual host


View the full module info with the info, or info -d command.

msf6 auxiliary(scanner/http/webdav_scanner) > 

msf6 auxiliary(scanner/http/webdav_scanner) > run

[*] 192.168.240.129 (Apache/1.3.28 (Unix) mod_ssl/2.8.15 OpenSSL/0.9.7c) WebDAV disabled.
[*] Scanned  3 of 10 hosts (30% complete)
[*] Scanned  8 of 10 hosts (80% complete)
[*] Scanned 10 of 10 hosts (100% complete)
[*] Auxiliary module execution completed

###########################
### FTP Brute Force #####

# Useat Metasploitin lisälaajennukset sisältävät raa'an voiman vaihtoehtoja tässä esimerkissä ja harjoituksesa;
# eli mennään takaisin msf alkuun tai avaa uusi metasploit komentorivi

┌──(kali㉿kali)-[~]
└─$ msfconsole -q
msf6 > search type:auxiliary login

Matching Modules
================

   #    Name                                                              Disclosure Date  Rank    Check  Description
   -    ----                                                              ---------------  ----    -----  -----------
   0    auxiliary/scanner/http/advantech_webaccess_login                                   normal  No     Advantech WebAccess Login
   1    auxiliary/scanner/http/axis_login                                                  normal  No     Apache Axis2 Brute Force Utility
   2    auxiliary/scanner/ssh/apache_karaf_command_execution              2016-02-09       normal  No     Apache Karaf Default Credentials Command Execution
   3    auxiliary/scanner/ssh/karaf_login                                                  normal  No     Apache Karaf Login Utility
   4    auxiliary/scanner/acpp/login                                                       normal  No     Apple Airport ACPP Authentication Scanner
   5    auxiliary/scanner/afp/afp_login                                                    normal  No     Apple Filing Protocol Login Utility
....

msf6 > use auxiliary/scanner/ftp/ftp_login 
msf6 auxiliary(scanner/ftp/ftp_login) > show options 

Module options (auxiliary/scanner/ftp/ftp_login):

   Name              Current Setting  Required  Description
   ----              ---------------  --------  -----------
   BLANK_PASSWORDS   false            no        Try blank passwords for all users
   BRUTEFORCE_SPEED  5                yes       How fast to bruteforce, from 0 to 5
   DB_ALL_CREDS      false            no        Try each user/password couple stored in the current database
   DB_ALL_PASS       false            no        Add all passwords in the current database to the list
   DB_ALL_USERS      false            no        Add all users in the current database to the list
   DB_SKIP_EXISTING  none             no        Skip existing credentials stored in the current database (Accepted: none, user, user&realm)
   PASSWORD                           no        A specific password to authenticate with
   PASS_FILE                          no        File containing passwords, one per line
   Proxies                            no        A proxy chain of format type:host:port[,type:host:port][...]
   RECORD_GUEST      false            no        Record anonymous/guest logins to the database
   RHOSTS                             yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.ht
                                                ml
   RPORT             21               yes       The target port (TCP)
   STOP_ON_SUCCESS   false            yes       Stop guessing when a credential works for a host
   THREADS           1                yes       The number of concurrent threads (max one per host)
   USERNAME                           no        A specific username to authenticate as
   USERPASS_FILE                      no        File containing users and passwords separated by space, one pair per line
   USER_AS_PASS      false            no        Try the username as the password for all users
   USER_FILE                          no        File containing usernames, one per line
   VERBOSE           true             yes       Whether to print output for all attempts


View the full module info with the info, or info -d command.



msf6 auxiliary(scanner/ftp/ftp_login) > 
msf6 auxiliary(scanner/ftp/ftp_login) > set PASS_FILE /root/password-file.txt
PASS_FILE => /root/password-file.txt
msf6 auxiliary(scanner/ftp/ftp_login) > set USERPASS_FILE /root/users.txt
USERPASS_FILE => /root/users.txt
msf6 auxiliary(scanner/ftp/ftp_login) > set RHOSTS 192.168.240.120-129
RHOSTS => 192.168.240.120-129
msf6 auxiliary(scanner/ftp/ftp_login) > run







