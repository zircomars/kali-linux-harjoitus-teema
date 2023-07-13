# Metasploit

msfconsole on pelkkä Metasploit Framework:in komentorivien käyttöliittymä. Msfconsole saattaa aluksi näyttää hieman monimutkaiselta, se on kuulemma helpoin ja joustavin tapa olla vuorovaikutuksessa Metasploit Framework:in kanssa. <b>msf</b> on periaatteessa sana <ins> metasploit framework </ins>.

* [Muutama esimerkki komentoja](#muutama-esimerkki-komentoja)
* [muuttujat variables](#muuttujat-variables)
  * [päivitys](#päivitys)
- [linkkei harjoitukseen ja komentoja, että kirjoja](#linkkei-harjoitukseen-ja-komentoja-että-kirjoja)
 * [pdf kirjoja](#pdf-kirjoja)
  

## Muutama esimerkki komentoja <br>

```
msf6 > version <br> 
Framework: 6.3.4-dev
Console  : 6.3.4-dev 
```

```
msf6 > date <br> 
[*] exec: date <br>
<br>
Sun Apr 30 10:22:52 AM EDT 2023
```

perus tallentaminen jostakin projektista tai harjoituiksesta 
```
msf6 > save 
Saved configuration to: /home/kali/.msf4/config
```

<hr>
<br> 
Session komento, tarkoittaa kohtamista hyödyntämään onnistuneesti saamasta jokin shell-istunnon kohdejärjestelmästä. Jos työskentely on useita kohtia samanaikaisesti, voi olla useita istuntoja aktiivisen auki samanaikaisesti eli ikkunoita. metasploit framework:it avulla voi vaihtaa useita istuntoja välillä tarpeiden mukaan. Sessio komento listaa kaikki tämän hetkisen aktiivisiset istunnot, jotka on muodostettu eri kohdejärjestelemiin.

```
msf6 > sessions 

Active sessions 
=============== 

No active sessions.
```

<hr>
Spool komento, kuten muissa sovelluksissa on virheekojauslokeja, jotka auttavat korjausvirheissä, että spool komento tulostaa kaiken lähdön käyttäjän määrittämän tiedostoon konsolin mukaan eli kaikki historia komennot ja tulostiedosto voi myöhemmin analysoida tarvittaessa<br>

```
msf6 > spool 
Usage: spool <off>|<filename> 

Example: 
  spool /tmp/console.log 
```


```
msf6 > show nops

NOP Generators
==============

   #   Name                 Disclosure Date  Rank    Check  Description
   -   ----                 ---------------  ----    -----  -----------
   0   nop/aarch64/simple                    normal  No     Simple
   1   nop/armle/simple                      normal  No     Simple
   2   nop/cmd/generic                       normal  No     Generic Command Nop Generator
   3   nop/mipsbe/better                     normal  No     Better
   4   nop/php/generic                       normal  No     PHP Nop Generator
   5   nop/ppc/simple                        normal  No     Simple
   6   nop/sparc/random                      normal  No     SPARC NOP Generator
   7   nop/tty/generic                       normal  No     TTY Nop Generator                                     
   8   nop/x64/simple                        normal  No     Simple                                                
   9   nop/x86/opty2                         normal  No     Opty2
   10  nop/x86/single_byte                   normal  No     Single Byte

```

```
msf6 > info payload/windows/meterpreter/reverse_tcp

       Name: Windows Meterpreter (Reflective Injection), Reverse TCP Stager
     Module: payload/windows/meterpreter/reverse_tcp
   Platform: Windows
       Arch: x86
Needs Admin: No
 Total size: 296
       Rank: Normal

Provided by:
  skape <mmiller@hick.org>
  sf <stephen_fewer@harmonysecurity.com>
  OJ Reeves
  hdm <x@hdm.io>

Basic options:
Name      Current Setting  Required  Description
----      ---------------  --------  -----------
EXITFUNC  process          yes       Exit technique (Accepted: '', seh, thread, process, none)
LHOST                      yes       The listen address (an interface may be specified)
LPORT     4444             yes       The listen port

Description:
  Inject the Meterpreter server DLL via the Reflective Dll Injection 
  payload (staged). Requires Windows XP SP2 or newer. Connect back to 
  the attacker

View the full module info with the info -d command.

```

```
msf6 > search vls

Matching Modules
================

   #  Name                                           Disclosure Date  Rank    Check  Description
   -  ----                                           ---------------  ----    -----  -----------
   0  auxiliary/dos/windows/smb/rras_vls_null_deref  2006-06-14       normal  No     Microsoft RRAS InterfaceAdjustVLSPointers NULL Dereference


Interact with a module by name or index. For example info 0, use 0 or use auxiliary/dos/windows/smb/rras_vls_null_deref

msf6 > search vlc

Matching Modules
================

   #  Name                                        Disclosure Date  Rank     Check  Description
   -  ----                                        ---------------  ----     -----  -----------
   0  post/multi/gather/saltstack_salt                             normal   No     SaltStack Salt Information Gatherer
   1  exploit/windows/browser/vlc_amv             2011-03-23       good     No     VLC AMV Dangling Pointer Vulnerability
   2  exploit/windows/browser/vlc_mms_bof         2012-03-15       normal   No     VLC MMS Stream Handling Buffer Overflow
   3  exploit/windows/fileformat/vlc_mkv          2018-05-24       great    No     VLC Media Player MKV Use After Free
   4  exploit/windows/fileformat/vlc_realtext     2008-11-05       good     No     VLC Media Player RealText Subtitle Overflow
   5  exploit/windows/fileformat/vlc_smb_uri      2009-06-24       great    No     VideoLAN Client (VLC) Win32 smb:// URI Buffer Overflow
   6  exploit/windows/fileformat/vlc_webm         2011-01-31       good     No     VideoLAN VLC MKV Memory Corruption
   7  exploit/windows/fileformat/vlc_modplug_s3m  2011-04-07       average  No     VideoLAN VLC ModPlug ReadS3M Stack Buffer Overflow
   8  exploit/windows/fileformat/videolan_tivo    2008-10-22       good     No     VideoLAN VLC TiVo Buffer Overflow


```

```
hakee Microsoftin tietoturvatiedotteen MS13-069 haavoittuvuus
msf6 > search MS13-069

Matching Modules
================

   #  Name                                    Disclosure Date  Rank    Check  Description
   -  ----                                    ---------------  ----    -----  -----------
   0  exploit/windows/browser/ms13_069_caret  2013-09-10       normal  No     MS13-069 Microsoft Internet Explorer CCaret Use-After-Free


Interact with a module by name or index. For example info 0, use 0 or use exploit/windows/browser/ms13_069_caret
```
```
CVE (common vulnerabilities and Exposures) ID number:
msf6 > search cve:2013-3660

Matching Modules
================

   #  Name                                   Disclosure Date  Rank     Check  Description
   -  ----                                   ---------------  ----     -----  -----------
   0  exploit/windows/local/ppr_flatten_rec  2013-05-15       average  Yes    Windows EPATHOBJ::pprFlattenRec Local Privilege Escalation
```

## muuttujat (Variables)

Muuttujia metasploit:ssa, useissa on käyttämiä hyväksikäyttöinen johon on asetettava arvo joillekin muuttujille. Alemmassa taulukossa on yleisiä ja tärkeimpiä muuttujia Metasploit framework toiminnassa.

Ennen kuin ottaa muuttujan haltuun ennen sitä pitää olla lokaalit "get" , "getg", "set", "unset" ja "unsetg" - edessä, koska ikäänkuin käytettäisi sisältämään arvon noutamista tiettyissä paikallisessa muuttujissa metasploit ympäristössä. Esim. haluttaisi tarkistaa kohdejärjestelmän IP-osoitetta tietyille methodille.

![Alt text](metasploit-image/metasploit-variables.PNG)

```
esimerkkejä
msf6 > set RHOSTS 10.23.158.180                                                                          
RHOSTS => 10.23.158.180                                                                                                     
msf6 > unset RHOTS
>
msf6 > get
Usage: get var1 [var2...]  

```

### päivitys

Rapid7 (developer:it, yritys nimi) tukee metasploit framework:ia yhteistyönä/kauppallisesti ja paljon kehitysyhteisöä. Uusia haavoittuvuuksia löytyy lähes päivittäin erissä järjestelmistä. Jokaiseesta tällaisissa löydetyissä haavoittuvuuden osalta on melko todennäköistä, että saa käyttöönvalmiin hyväksikäytön metasploin framework:it. Tärkeänä pysyy ajantasalla uusimmista haavoittuvuuksista ja käyttää hyväkseen, että on työkalua metasploit framework:ia. 

Ei tarvitse varusta kehystä uuden johtonmukaista (ellei ole läpäisytestaus osa päivittäistä työtä). ns. voi pyrkiä päivittää esim. viikottain. Päivittämiseen menee perus simppeli koodi kali linux:sessa eli "msfupdate".

Tai vaihtoehtona on voi käyttää "$sudo apt install metasploit framework" komentoa, että päivittäkseen sen metasploit frameowrk uusimpaan saatavilla olevaa versiota.

```
root@kali:~# msfupdate
[]
[] Attempting to update the Metasploit Framework...
[*]

[] Checking for updates via the APT repository
[] Note: expect weekly(ish) updates using this method
/usr/bin/msfupdate:275:in update_apt!': undefined method blank?' for nil:NilClass (NoMethodError)
from /usr/bin/msfupdate:140:in block in run!' from /usr/bin/msfupdate:134:in chdir'
from /usr/bin/msfupdate:134:in run!' from /usr/bin/msfupdate:326:in 

'
I read somewhere that Kali is 1 month behind the latest releases?

```

<hr>

# linkkei harjoitukseen ja komentoja, että kirjoja <br>

https://www.makeuseof.com/beginners-guide-metasploit-kali-linux/ <br>

## pdf kirjoja

http://mogesec.com/wp-content/uploads/2021/12/Metasploit-5.0-for-Beginners.pdf <br>
