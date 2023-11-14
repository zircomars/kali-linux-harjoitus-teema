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










