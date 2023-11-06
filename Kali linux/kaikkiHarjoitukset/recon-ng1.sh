# recon-ng - on on Pythonilla kirjoitettu monipuolinen verkkotutkintakehys (framework). 
#
# Complete with independent modules, database interaction, built in convenience functions, interactive help, and command completion, Recon-ng provides a powerful environment in which open source web-based reconnaissance can be conducted quickly and thoroughly. 

# Recon-ng has a look and feel similar to the Metasploit Framework, reducing the learning curve for leveraging the framework”. 
# huom. kali linux sovelluksen pohjaan (sisällä) on rakennettu "Recon-ng" niin sitä löytyy sieltä vasemman yläkulmasta haulla "recon-ng" sillä on erillinen komentosarja, toki tätä voi suorittaa perus kali linux terminaalin alla

# lisää harjoituksia; https://hackertarget.com/recon-ng-tutorial/


┌──(kali㉿kali)-[~]
└─$ recon-ng
[*] Version check disabled.

    _/_/_/    _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/
   _/    _/  _/        _/        _/      _/  _/_/    _/            _/_/    _/  _/       
  _/_/_/    _/_/_/    _/        _/      _/  _/  _/  _/  _/_/_/_/  _/  _/  _/  _/  _/_/_/
 _/    _/  _/        _/        _/      _/  _/    _/_/            _/    _/_/  _/      _/ 
_/    _/  _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/    


                                          /\
                                         / \\ /\
    Sponsored by...               /\  /\/  \\V  \/\
                                 / \\/ // \\\\\ \\ \/\
                                // // BLACK HILLS \/ \\
                               www.blackhillsinfosec.com

                  ____   ____   ____   ____ _____ _  ____   ____  ____
                 |____] | ___/ |____| |       |   | |____  |____ |
                 |      |   \_ |    | |____   |   |  ____| |____ |____
                                   www.practisec.com

                      [recon-ng v5.1.2, Tim Tomes (@lanmaster53)]                       

[*] No modules enabled/installed.

[recon-ng][default] > marketplace search virustotal                                                                                             
[*] Searching module index for 'virustotal'...                                                                                   
  +---------------------------------------------------------------------------------+                                                           
  |               Path               | Version |     Status    |  Updated   | D | K |                                                           
  +---------------------------------------------------------------------------------+                                                           
  | recon/hosts-hosts/virustotal     | 1.0     | not installed | 2019-06-24 |   | * |                                                           
  | recon/netblocks-hosts/virustotal | 1.0     | not installed | 2019-06-24 |   | * |                                                           
  +---------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

##########################################################################################
##### MUITA ESIM: START HERE

#
[recon-ng][default] > marketplace search hosts-domains
[*] Searching module index for 'hosts-domains'...

  +----------------------------------------------------------------------------------+
  |                Path               | Version |     Status    |  Updated   | D | K |
  +----------------------------------------------------------------------------------+
  | recon/hosts-domains/migrate_hosts | 1.1     | not installed | 2020-05-17 |   |   |
  +----------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.


############################################################################################
#

[recon-ng][default] > marketplace search censys_email_address
[*] Searching module index for 'censys_email_address'...

  +----------------------------------------------------------------------------------------------+
  |                      Path                     | Version |     Status    |  Updated   | D | K |
  +----------------------------------------------------------------------------------------------+
  | recon/companies-contacts/censys_email_address | 2.0     | not installed | 2021-05-11 | * | * |
  +----------------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

[recon-ng][default] > marketplace info censys_email_address

  +-----------------------------------------------------------------------------------------------------------------------------------+
  | path          | recon/companies-contacts/censys_email_address                                                                     |
  | name          | Censys emails by company                                                                                          |
  | author        | Censys Team                                                                                                       |
  | version       | 2.0                                                                                                               |
  | last_updated  | 2021-05-11                                                                                                        |
  | description   | Retrieves email addresses from the TLS certificates for a company. Updates the 'contacts' table with the results. |
  | required_keys | ['censysio_id', 'censysio_secret']                                                                                |
  | dependencies  | ['censys>=2.0.0']                                                                                                 |
  | files         | []                                                                                                                |
  | status        | not installed                                                                                                     |
  +-----------------------------------------------------------------------------------------------------------------------------------+


############################################################################################
#
















