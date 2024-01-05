# email harvesting in kali linux (Find out login IDs to Bruteforce) , as the purporse of mass spamming or spear phishing, hackers use a module in metasploit that pulls email accounts of a particular organization from google, yahoo, bing and other search mode.

# https://www.amirootyet.com/post/email-harvesting-in-kali-linux-find-out/
# exmaple practice this can try own kali linux

# first set a 'domain' of the organization and the 'output' file where want the results "email address" saved and "execute" the module
# first $banner , some funny photo first :D
# back to pratice
msf6 > banner
                          ########                  #
                      #################            #
                   ######################         #
                  #########################      #
                ############################
               ##############################
               ###############################
              ###############################
              ##############################
                              #    ########   #
                 ##        ###        ####   ##
                                      ###   ###
                                    ####   ###
               ####          ##########   ####
               #######################   ####
                 ####################   ####
                  ##################  ####
                    ############      ##
                       ########        ###
                      #########        #####
                    ############      ######
                   ########      #########
                     #####       ########
                       ###       #########
                      ######    ############
                     #######################
                     #   #   ###  #   #   ##
                     ########################
                      ##     ##   ##     ##
                            https://metasploit.com


       =[ metasploit v6.3.4-dev                           ]
+ -- --=[ 2294 exploits - 1201 auxiliary - 409 post       ]
+ -- --=[ 968 payloads - 45 encoders - 11 nops            ]
+ -- --=[ 9 evasion                                       ]

Metasploit tip: Writing a custom module? After editing your 
module, why not try the reload command
Metasploit Documentation: https://docs.metasploit.com/

msf6 > 
msf6 > use auxiliary/gather/search_email_collector 
msf6 auxiliary(gather/search_email_collector) > show options 

Module options (auxiliary/gather/search_email_collector):

   Name           Current Setting  Required  Description
   ----           ---------------  --------  -----------
   DOMAIN                          yes       The domain name to locate email addresses for
   OUTFILE                         no        A filename to store the generated email list
   SEARCH_BING    true             yes       Enable Bing as a backend search engine
   SEARCH_GOOGLE  true             yes       Enable Google as a backend search engine
   SEARCH_YAHOO   true             yes       Enable Yahoo! as a backend search engine


View the full module info with the info, or info -d command.

msf6 auxiliary(gather/search_email_collector) > set domain xtenai.com
domain => xtenai.com
msf6 auxiliary(gather/search_email_collector) > set outfile xtenai_logsin.txt
outfile => xtenai_logsin.txt
msf6 auxiliary(gather/search_email_collector) > exploit

[*] Harvesting emails .....
[*] Searching Google for email addresses from xtenai.com
[*] Extracting emails from Google search results...
[*] Searching Bing email addresses from xtenai.com
[*] Extracting emails from Bing search results...
[*] Searching Yahoo for email addresses from xtenai.com
[*] Extracting emails from Yahoo search results...
[*] Located 0 email addresses for xtenai.com
[*] Writing email address list to xtenai_logsin.txt...
[*] Auxiliary module execution completed
msf6 auxiliary(gather/search_email_collector) > 

###########################################################################
# another example (FAILED result...) 

msf6 auxiliary(gather/search_email_collector) > set DOMAIN microsoft.com
DOMAIN => microsoft.com
msf6 auxiliary(gather/search_email_collector) > run

[*] Harvesting emails .....
[*] Searching Google for email addresses from microsoft.com
[-] Auxiliary failed: SocketError Failed to open TCP connection to www.google.com:80 (getaddrinfo: Temporary failure in name resolution)
[-] Call stack:
[-]   /usr/lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo'
[-]   /usr/lib/ruby/3.1.0/socket.rb:227:in `foreach'
[-]   /usr/lib/ruby/3.1.0/socket.rb:632:in `tcp'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:998:in `connect'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:976:in `do_start'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:965:in `start'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:1530:in `request'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:1440:in `request_get'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:49:in `block in search_google'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:48:in `each'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:48:in `search_google'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:127:in `run'
[*] Auxiliary module execution completed
msf6 auxiliary(gather/search_email_collector) > 
msf6 auxiliary(gather/search_email_collector) > set DOMAIN debagent.nl
DOMAIN => debagent.nl
msf6 auxiliary(gather/search_email_collector) > run

[*] Harvesting emails .....
[*] Searching Google for email addresses from debagent.nl
[*] Extracting emails from Google search results...
[*] Searching Bing email addresses from debagent.nl
[*] Extracting emails from Bing search results...
[*] Searching Yahoo for email addresses from debagent.nl
[-] Auxiliary failed: SocketError Failed to open TCP connection to search.yahoo.com:80 (getaddrinfo: Temporary failure in name resolution)
[-] Call stack:
[-]   /usr/lib/ruby/3.1.0/socket.rb:227:in `getaddrinfo'
[-]   /usr/lib/ruby/3.1.0/socket.rb:227:in `foreach'
[-]   /usr/lib/ruby/3.1.0/socket.rb:632:in `tcp'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:998:in `connect'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:976:in `do_start'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:965:in `start'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:1530:in `request'
[-]   /usr/lib/ruby/3.1.0/net/http.rb:1440:in `request_get'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:69:in `block in search_yahoo'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:68:in `each'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:68:in `search_yahoo'
[-]   /usr/share/metasploit-framework/modules/auxiliary/gather/search_email_collector.rb:129:in `run'
[*] Auxiliary module execution completed
msf6 auxiliary(gather/search_email_collector) >





###########################################################################
# another example





