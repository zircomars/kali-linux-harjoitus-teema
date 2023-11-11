#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu START HERE: 130

# samat harjoitukset, lyhyet ja ytimekäs kuvaus ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 

#######################################################################################################
##### SMTP Enumeration #####

# SMTP = Simple Mail Transfer Protocol
# tietyissä haavoittuvuuksissa kokoonpanoissa sähköpostipalvelimissa voidaan käyttää myös tieotjen keräämistä host tai verkosossa.
# SMTP tukee useita tärkeitä komentoja kuten "VRFY" ja "EXPN"
  # - VRFY pyyntö pyytää palvelinta vahvistamaan sähköpostiosoitteen
  # - EXPN kysyy palvelimelta postituslistan jäsenyyttää (membership of a mailing list)

# näitä voidaaan usein käyttää vääriin todentamisiin olemassa oleviin käyttäjiä sähköpostipalvelimella, mikä voi myöhemin auttaa hyökkääjää.

# esim. komento scripti
root@kali:~# nc -nv 10.11.1.215 25
(UNKNOWN) [10.11.1.215] 25 (smtp) open
220 redhat.acme.com ESMTP Sendmail 8.12.8/8.12.8; Wed, 12 Jun 2013 07:47:14 +0300
VRFY root
250 2.1.5 root <root@redhat.acme.com>
VRFY idontexist
550 5.1.1 idontexist... User unknown
^C
root@kali:~# 








