# marketplace
# kuin sovelluksien kauppa, josta voi; "install", "remove", "search", "info", "refresh" ja jne
#

[recon-ng][default] > marketplace 
info     install  refresh  remove   search   

# ensimmäisenä tarkistellaan mitä sieltä löytyy (haettaan, search)
[recon-ng][default] > marketplace search

  +---------------------------------------------------------------------------------------------------+
  |                        Path                        | Version |     Status    |  Updated   | D | K |
  +---------------------------------------------------------------------------------------------------+
  | discovery/info_disclosure/cache_snoop              | 1.1     | not installed | 2020-10-13 |   |   |
  | discovery/info_disclosure/interesting_files        | 1.2     | not installed | 2021-10-04 |   |   |
  | exploitation/injection/command_injector            | 1.0     | not installed | 2019-06-24 |   |   |
  | exploitation/injection/xpath_bruter                | 1.2     | not installed | 2019-10-08 |   |   |
  | import/csv_file                                    | 1.1     | not installed | 2019-08-09 |   |   |
  | import/list                                        | 1.1     | not installed | 2019-06-24 |   |   |
  | import/masscan                                     | 1.0     | not installed | 2020-04-07 |   |   |
  | import/nmap                                        | 1.1     | not installed | 2020-10-06 |   |   |
  | recon/companies-contacts/bing_linkedin_cache       | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/companies-contacts/censys_email_address      | 2.0     | not installed | 2021-05-11 | * | * |
  | recon/companies-contacts/pen                       | 1.1     | not installed | 2019-10-15 |   |   |
  | recon/companies-domains/censys_subdomains          | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/companies-domains/pen                        | 1.1     | not installed | 2019-10-15 |   |   |
  | recon/companies-domains/viewdns_reverse_whois      | 1.1     | not installed | 2021-08-24 |   |   |
  | recon/companies-domains/whoxy_dns                  | 1.1     | not installed | 2020-06-17 |   | * |
  | recon/companies-hosts/censys_org                   | 2.0     | not installed | 2021-05-11 | * | * |
  | recon/companies-hosts/censys_tls_subjects          | 2.0     | not installed | 2021-05-11 | * | * |
  | recon/companies-multi/github_miner                 | 1.1     | not installed | 2020-05-15 |   | * |
  | recon/companies-multi/shodan_org                   | 1.1     | not installed | 2020-07-01 | * | * |
  | recon/companies-multi/whois_miner                  | 1.1     | not installed | 2019-10-15 |   |   |
  | recon/contacts-contacts/abc                        | 1.0     | not installed | 2019-10-11 | * |   |
  | recon/contacts-contacts/mailtester                 | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/contacts-contacts/mangle                     | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/contacts-contacts/unmangle                   | 1.1     | not installed | 2019-10-27 |   |   |
  | recon/contacts-credentials/hibp_breach             | 1.2     | not installed | 2019-09-10 |   | * |
  | recon/contacts-credentials/hibp_paste              | 1.1     | not installed | 2019-09-10 |   | * |
  | recon/contacts-domains/migrate_contacts            | 1.1     | not installed | 2020-05-17 |   |   |
  | recon/contacts-profiles/fullcontact                | 1.1     | not installed | 2019-07-24 |   | * |
  | recon/credentials-credentials/adobe                | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/credentials-credentials/bozocrack            | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/credentials-credentials/hashes_org           | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-companies/censys_companies           | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/domains-companies/pen                        | 1.1     | not installed | 2019-10-15 |   |   |
  | recon/domains-companies/whoxy_whois                | 1.1     | not installed | 2020-06-24 |   | * |
  | recon/domains-contacts/hunter_io                   | 1.3     | not installed | 2020-04-14 |   | * |
  | recon/domains-contacts/metacrawler                 | 1.1     | not installed | 2019-06-24 | * |   |
  | recon/domains-contacts/pen                         | 1.1     | not installed | 2019-10-15 |   |   |
  | recon/domains-contacts/pgp_search                  | 1.4     | not installed | 2019-10-16 |   |   |
  | recon/domains-contacts/whois_pocs                  | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-contacts/wikileaker                  | 1.0     | not installed | 2020-04-08 |   |   |
  | recon/domains-credentials/pwnedlist/account_creds  | 1.0     | not installed | 2019-06-24 | * | * |
  | recon/domains-credentials/pwnedlist/api_usage      | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-credentials/pwnedlist/domain_creds   | 1.0     | not installed | 2019-06-24 | * | * |
  | recon/domains-credentials/pwnedlist/domain_ispwned | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-credentials/pwnedlist/leak_lookup    | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-credentials/pwnedlist/leaks_dump     | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-domains/brute_suffix                 | 1.1     | not installed | 2020-05-17 |   |   |
  | recon/domains-hosts/binaryedge                     | 1.2     | not installed | 2020-06-18 |   | * |
  | recon/domains-hosts/bing_domain_api                | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-hosts/bing_domain_web                | 1.1     | not installed | 2019-07-04 |   |   |
  | recon/domains-hosts/brute_hosts                    | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-hosts/builtwith                      | 1.1     | not installed | 2021-08-24 |   | * |
  | recon/domains-hosts/censys_domain                  | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/domains-hosts/certificate_transparency       | 1.2     | not installed | 2019-09-16 |   |   |
  | recon/domains-hosts/google_site_web                | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-hosts/hackertarget                   | 1.1     | not installed | 2020-05-17 |   |   |
  | recon/domains-hosts/mx_spf_ip                      | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-hosts/netcraft                       | 1.1     | not installed | 2020-02-05 |   |   |
  | recon/domains-hosts/shodan_hostname                | 1.1     | not installed | 2020-07-01 | * | * |
  | recon/domains-hosts/spyse_subdomains               | 1.1     | not installed | 2021-08-24 |   | * |
  | recon/domains-hosts/ssl_san                        | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-hosts/threatcrowd                    | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-hosts/threatminer                    | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/domains-vulnerabilities/ghdb                 | 1.1     | not installed | 2019-06-26 |   |   |
  | recon/domains-vulnerabilities/xssed                | 1.1     | not installed | 2020-10-18 |   |   |
  | recon/hosts-domains/migrate_hosts                  | 1.1     | not installed | 2020-05-17 |   |   |
  | recon/hosts-hosts/bing_ip                          | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-hosts/censys_hostname                  | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/hosts-hosts/censys_ip                        | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/hosts-hosts/censys_query                     | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/hosts-hosts/ipinfodb                         | 1.2     | not installed | 2021-08-24 |   | * |
  | recon/hosts-hosts/ipstack                          | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-hosts/resolve                          | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-hosts/reverse_resolve                  | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-hosts/ssltools                         | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-hosts/virustotal                       | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-locations/migrate_hosts                | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-ports/binaryedge                       | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-ports/shodan_ip                        | 1.2     | not installed | 2020-07-01 | * | * |
  | recon/locations-locations/geocode                  | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/locations-locations/reverse_geocode          | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/locations-pushpins/flickr                    | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/locations-pushpins/shodan                    | 1.1     | not installed | 2020-07-07 | * | * |
  | recon/locations-pushpins/twitter                   | 1.1     | not installed | 2019-10-17 |   | * |
  | recon/locations-pushpins/youtube                   | 1.2     | not installed | 2020-09-02 |   | * |
  | recon/netblocks-companies/censys_netblock_company  | 2.0     | not installed | 2021-05-11 | * | * |
  | recon/netblocks-companies/whois_orgs               | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/netblocks-hosts/censys_netblock              | 2.0     | not installed | 2021-05-10 | * | * |
  | recon/netblocks-hosts/reverse_resolve              | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/netblocks-hosts/shodan_net                   | 1.2     | not installed | 2020-07-21 | * | * |
  | recon/netblocks-hosts/virustotal                   | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/netblocks-ports/census_2012                  | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/netblocks-ports/censysio                     | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/ports-hosts/migrate_ports                    | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/ports-hosts/ssl_scan                         | 1.1     | not installed | 2021-08-24 |   |   |
  | recon/profiles-contacts/bing_linkedin_contacts     | 1.2     | not installed | 2021-08-24 |   | * |
  | recon/profiles-contacts/dev_diver                  | 1.1     | not installed | 2020-05-15 |   |   |
  | recon/profiles-contacts/github_users               | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/namechk                    | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/profiler                   | 1.1     | not installed | 2019-10-16 |   |   |
  | recon/profiles-profiles/twitter_mentioned          | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/twitter_mentions           | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-repositories/github_repos           | 1.1     | not installed | 2020-05-15 |   | * |
  | recon/repositories-profiles/github_commits         | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/repositories-vulnerabilities/gists_search    | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/repositories-vulnerabilities/github_dorks    | 1.0     | not installed | 2019-06-24 |   | * |
  | reporting/csv                                      | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/html                                     | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/json                                     | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/list                                     | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/proxifier                                | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/pushpin                                  | 1.0     | not installed | 2019-06-24 |   | * |
  | reporting/xlsx                                     | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/xml                                      | 1.1     | not installed | 2019-06-24 |   |   |
  +---------------------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

# toinen esim. josta haettaan dns:ää
[recon-ng][default] > marketplace search dns
[*] Searching module index for 'dns'...

  +----------------------------------------------------------------------------------------------+
  |                      Path                     | Version |     Status    |  Updated   | D | K |
  +----------------------------------------------------------------------------------------------+
  | recon/companies-domains/viewdns_reverse_whois | 1.1     | not installed | 2021-08-24 |   |   |
  | recon/companies-domains/whoxy_dns             | 1.1     | not installed | 2020-06-17 |   | * |
  +----------------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

##########################
#toinen search esimerkki

[recon-ng][default] > marketplace search github
[*] Searching module index for 'github'...

  +------------------------------------------------------------------------------------------------+
  |                       Path                      | Version |     Status    |  Updated   | D | K |
  +------------------------------------------------------------------------------------------------+
  | recon/companies-multi/github_miner              | 1.1     | not installed | 2020-05-15 |   | * |
  | recon/profiles-contacts/github_users            | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/profiler                | 1.1     | not installed | 2019-10-16 |   |   |
  | recon/profiles-repositories/github_repos        | 1.1     | not installed | 2020-05-15 |   | * |
  | recon/repositories-profiles/github_commits      | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/repositories-vulnerabilities/github_dorks | 1.0     | not installed | 2019-06-24 |   | * |
  +------------------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

# pien huom!
# huomaa osassa on merkkitty K - kirjain kohdalla tähti * , johon vaatii valtuustietoja tai API-avaimia kolmannen osapuolen palvelutarjoajilta.
#  The recon-ng wiki maintains a short list of the keys used by its modules. Some of these keys are available to free accounts, while others require a subscription.

# käyttämällä "marketplace info" - jonka hakee moduuli vaativia API avainta eli jos tarkistellaan sama github moduulia ja toista googlea
[recon-ng][default] > marketplace info recon/profiles-repositories/github_repos

  +----------------------------------------------------------------------------------------------------------------------------------------------------+
  | path          | recon/profiles-repositories/github_repos                                                                                           |
  | name          | Github Code Enumerator                                                                                                             |
  | author        | Tim Tomes (@lanmaster53)                                                                                                           |
  | version       | 1.1                                                                                                                                |
  | last_updated  | 2020-05-15                                                                                                                         |
  | description   | Uses the Github API to enumerate repositories and gists owned by a Github user. Updates the 'repositories' table with the results. |
  | required_keys | ['github_api']                                                                                                                     |
  | dependencies  | []                                                                                                                                 |
  | files         | []                                                                                                                                 |
  | status        | not installed                                                                                                                      |
  +----------------------------------------------------------------------------------------------------------------------------------------------------+

# search google ja tarkistellaan infon kautta toi Path sisäisen moduuli tieto
[recon-ng][default] > marketplace search google
[*] Searching module index for 'google'...

  +------------------------------------------------------------------------------------+
  |                 Path                | Version |     Status    |  Updated   | D | K |
  +------------------------------------------------------------------------------------+
  | recon/domains-hosts/google_site_web | 1.0     | not installed | 2019-06-24 |   |   |
  +------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.


[recon-ng][default] > marketplace info recon/domains-hosts/google_site_web

  +---------------------------------------------------------------------------------------------------------------------------------+
  | path          | recon/domains-hosts/google_site_web                                                                             |
  | name          | Google Hostname Enumerator                                                                                      |
  | author        | Tim Tomes (@lanmaster53)                                                                                        |
  | version       | 1.0                                                                                                             |
  | last_updated  | 2019-06-24                                                                                                      |
  | description   | Harvests hosts from Google.com by using the 'site' search operator. Updates the 'hosts' table with the results. |
  | required_keys | []                                                                                                              |
  | dependencies  | []                                                                                                              |
  | files         | []                                                                                                              |
  | status        | not installed                                                                                                   |
  +---------------------------------------------------------------------------------------------------------------------------------+


##############################################################################################
# install - kokeillaan installaa jotakin ja poistettaan samantien (remove)

[recon-ng][default] > marketplace install recon/companies-domains/whoxy_dns
[*] Module installed: recon/companies-domains/whoxy_dns
[*] Reloading modules...
[!] 'whoxy_api' key not set. whoxy_dns module will likely fail at runtime. See 'keys add'.
[recon-ng][default] > 
[recon-ng][default] > marketplace remove  recon/companies-domains/whoxy_dns 
[*] Module removed: recon/companies-domains/whoxy_dns
[*] Reloading modules...


########
# toinen esim. josta install - tuota google path moduulia
# tuolla edellisessä komennossa josta tarkistettiin se marketplace info ($ marketplace info recon/domains-hosts/google_site_web) kohdassa / kuvauksessa mukaan tässä moduulissa hakee googlesta "site"-operaattorilla, eikä se vaadi API-avainta
# ( Harvests hosts from Google.com by using the 'site' search operator. Updates the 'hosts' table with the results)

[recon-ng][default] > marketplace install recon/domains-hosts/google_site_web
[*] Module installed: recon/domains-hosts/google_site_web
[*] Reloading modules...

####
# seuraavaksi;
# latauksen jälkeen niin ladataan (load) käyttämällä komentoa "module load" ja tarkistellaan sen "info" komennolla mitä sisällä on ladattu niin kuin checkkausta

[recon-ng][default] > modules load recon/domains-hosts/google_site_web

[recon-ng][default][google_site_web] > info

      Name: Google Hostname Enumerator
    Author: Tim Tomes (@lanmaster53)
   Version: 1.0

Description:
  Harvests hosts from Google.com by using the 'site' search operator. Updates the 'hosts' table with
  the results.

Options:
  Name    Current Value  Required  Description
  ------  -------------  --------  -----------
  SOURCE  default        yes       source of input (see 'info' for details)

Source Options:
  default        SELECT DISTINCT domain FROM domains WHERE domain IS NOT NULL
  <string>       string representing a single input
  <path>         path to a file containing a list of inputs
  query <sql>    database query returning one column of inputs










