#############
# harjoitus; https://edu.anarcho-copy.org/Against%20Security%20-%20Self%20Security/Offensive%20Security%20-%20Pentesting%20with%20Kali%20(PWK).pdf
# chapter 6. - Buffer Overflows
# sivu START HERE: 148 - 

# samat harjoitukset ja kuvaukset; https://github.com/muckitymuck/OSCP-Study-Guide/blob/master/buffer_overflow/buffer_overflows.md

#######################################################################################################
####### Buffer Overflows ##########

#There are three main ways of identifying flaws in applications
    # If the source code of the application is available, then source code review is probably the easiest way to identify bugs.
    # If the application is closed source, you can use reverse engineering techniques, or fuzzing, to find bugs.

# Puskurin ylivuoto (butter overflows)
  # Usein on aina kiehtovaa ajatella/mietiä tarkkoja toimenpiteitä, joita tapahtuu, kun hyväksikäyttöä käytetään koodin suorittamista etänä uhrinkoneelle 

# Usein kun suoritettaan jokin puskurin ylivuoto, joihin usein mietittään ensimmäisenä "miten nämä virheet löydetään?" ja "Mistä tiesit, että x bytes ja Y komento kataa sovelluksen ja johtaa puskurin ylivuotoa?"

# Yleisen sovellusten puutteiden tunnistamisessa on kolme tapaa.
  # Jos sovelluksen lähdekoodi on saatavilla, lähdekoodi tarkistus on luultavasti helpoin tapa tunnistaa vikoja
  # Jos sovellus on suljetun lähde koodi (application is closed source), voidaan käyttää käänteissuunnittelutekniikoita (reverse engineering techniques), tai sumeaa vikoja etsimisessä

######################
#### Fuzzing #######

# Fuzzing tarkoittaa virheellisten tietojen lähettämistä sovelluksen syötteeseen ja odottamattomien kaatumisten tarkkailua. 
# Odottamaton kaatuminen osoittaa, että sovellus ei ehkä suodata tiettyä syötettä oikein. 
# Tämä voi johtaa hyödynnettävän haavoittuvuuden löytämiseen.

# Fuzzing involves sending malformed data into application input and watching for unexpected crashes.
# An unexpected crash indicates that the application might not filter certain input correctly. 
# This could lead to discovering an exploitable vulnerability.

####### A Word About DEP and ASLR  #######

# DEP (Data Execution Prevention) is a set of hardware, and software, technologies that perform additional checks on memory, to help prevent malicious code from running on a system.

# The primary benefit of DEP is to help prevent code execution from data pages, by raising an exception, when execution occurs.

# ASLR (Address Space Layout Randomization) randomizes the base addresses of loaded applications, and DLLs, every time the Operating System is booted.

############################
### Interacting with the POP3 Protocol ####







