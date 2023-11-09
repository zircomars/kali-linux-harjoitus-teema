#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 4. active information gathering
# sivu start here: 109 - 

# samat harjoitukset ja scriptit: https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/enumeration/active_information_gathering.md 

##############################################################################
# PORT SCANNING (start here)
# Porttien skannaus on prosessi, jossa tarkistetaan etäkoneen avoimet TCP- tai UDP-portit. Huomaa, että porttien skannaus on laitonta monissa maissa, eikä sitä tule suorittaa laboratorioiden ulkopuolella. Olemme kuitenkin siirtyneet passiivisesta vaiheesta aktiiviseen vaiheeseen, joka sisältää suorempaa vuorovaikutusta kohdepalvelimien kanssa.

# On erittäin tärkeää, että ymmärrämme porttitarkistuksen vaikutukset sekä vaikutukset, joita tietyillä porttitarkistuksilla voi olla verkkoon.


##########################
# connect scanning

# Yksinkertaisin TCP-portin skannaustekniikka, jota yleensä kutsutaan CONNECT-skannaukseksi, perustuu kolmisuuntaiseen TCP-kättelymekanismiin28 (handshake28). Tämä mekanismi on suunniteltu siten, että kaksi viestiä yrittävää host konetta voivat neuvotella verkon TCP-socket-yhteyden parametreista ennen tiedon lähettämistä.

# Yhdistä portin skannaus käsittää kolmisuuntaisen kättelyn (handsake) yrittämisen kohde host:issa kanssa määritetyissä porteissa. Jos kättely on valmis, tämä osoittaa, että portti on auki. Alla olevassa kuvakaappauksessa näkyy Wireshark-kaappaus TCP Netcat -portin skannauksesta porteissa 3388-3390.

root@kali:~# nc -nvv -w 1 -z 10.0.0.19 3388-3390
(UNKNOWN) [10.0.0.19] 3390 (?) : Connection refused
(UNKNOWN) [10.0.0.19] 3389 (?) open
(UNKNOWN) [10.0.0.19] 3388 (?) : Connection refused
sent 0, rcvd 0




