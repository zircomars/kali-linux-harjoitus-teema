# Offensive-Security-OSCP-by-Offensive-Security_2020
# https://blactec.biz/wp-content/uploads/2021/09/Offensive-Security-OSCP-by-Offensive-Security%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90%E2%AD%90.pdf

#tämä on sama idea kuin toi vanhempi 2018 julkaistettu versio, mutta tässä harjoituksessa käytettään sen esimerkkin linkkiä "megacorpone.com" 
#tätä voi periaatteessa suorittaa virallisesti omass kali linux:sessa, mutta testaan repl.it bash:in kautta

# PAGE START 121 - 125 (EXAMPLE 1)

##################
#wget komennolla ladataan tämä linkin index sivusto eli html
~/CircularFocusedProfiles$ wget www.megacorpone.com
wget: command not installed. Multiple versions of this command were found in Nix.
Select one to run (or press Ctrl-C to cancel):
Adding wget to replit.nix
success
/nix/store/kblplvpffcfn0zprj80vh41xchjx4jag-wget-1.21.3
--2023-12-02 08:57:53--  http://www.megacorpone.com/
Resolving www.megacorpone.com (www.megacorpone.com)... 149.56.244.87
Connecting to www.megacorpone.com (www.megacorpone.com)|149.56.244.87|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 14603 (14K) [text/html]
Saving to: ‘index.html’

index.html     100%  14.26K  --.-KB/s    in 0.07s       

2023-12-02 08:57:53 (202 KB/s) - ‘index.html’ saved [14603/14603]

Detected change in environment, reloading shell...

~/CircularFocusedProfiles$ ls
index.html

~/CircularFocusedProfiles$ ls -l index.html 
-rw-r--r-- 1 runner runner 14603 Nov  6  2019 index.html

##################
# seuraavaksi skannattana tiedostoa manuaalisesti, ja josta nähdään monia rivejä, joihin ei tarvita. Aletaan seuraavaksi kaivaa tarvisemia linjoja ja poistaa tarpeettomia linjoja (lines). Eli ensin otettaan grep "href=" - komentoa poimitakseen kaikki index.html rivit, jotka sisältävät HTML-linkkiä

# tulostuksena on ottaessa otettaan ensimmäiset rivit erinomaisiin esimerkkeihin, ja ne viittavat aliverkkotunnuksiin (subdomainiin)

~/CircularFocusedProfiles$ grep "href"  = index.html 
grep: =: No such file or directory
index.html:    <link rel="shortcut icon" href="assets/ico/favicon.ico">
index.html:    <link href="assets/css/bootstrap.css" rel="stylesheet">
index.html:    <link href="assets/css/style.css" rel="stylesheet">
index.html:    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
index.html:                <a class="navbar-brand" href="index.html">MegaCorp One</a>
index.html:                    <li class="active"><a href="//www.megacorpone.com/index.html">HOME</a></li>
index.html:                    <li><a href="https://www.megacorpone.com/about.html">ABOUT</a></li>
index.html:                    <li><a href="/contact.html">CONTACT</a></li>
index.html:                    <li><a href="http://support.megacorpone.com">SUPPORT</a></li>
index.html:                    <!--<li><a href="https://www.offensive-security.com/offensive-security-solutions/virtual-penetration-testing-labs/">SUPPORT</a></li>-->
index.html:                    <li><a href="http://www.megacorpone.com/jobs.html">CAREERS</a></li>
index.html:                    <!--<li><a href="http://www.megacorpone.com/jobs2.html">CAREERS</a></li>-->
index.html:                    <li><a href="http://intranet.megacorpone.com">LOG IN</a></li>
index.html:                    <!--<li><a href="https://cp.megacorpone.net/">LOG IN</a></li>-->
index.html:                    <p><br/><a href="about.html" class="btn btn-theme">More Info</a></p>
index.html:                    <p><br/><a href="about.html" class="btn btn-theme">More Info</a></p>
index.html:                    <p><br/><a href="about.html" class="btn btn-theme">More Info</a></p>
index.html:                    <li><a href="http://admin.megacorpone.com/admin/index.html">Cell Regeneration</a></li>
index.html:                    <li><a href="http://intranet.megacorpone.com/pear/">Immune Systems Supplements</a></li>
index.html:                    <li><a href="http://mail.megacorpone.com/menu/">Micromachine Cyberisation Repair</a></li>
index.html:                    <li><a href="http://mail2.megacorpone.com/smtp/relay/">Nanomite Based Weaponry Systems</a></li>
index.html:                    <li><a href="http://siem.megacorpone.com/home/">Nanoprobe Based Entity Assimilation</a></li>
index.html:                    <li><a href="http://support.megacorpone.com/ticket/requests/index.html">Nanoprocessors</a></li>
index.html:                    <li><a href="http://syslog.megacorpone.com/logs/sys/view.php">Perlin VanHook Chemical Dispersal</a></li>
index.html:                <p><br/><a href="about.html" class="btn btn-theme">More Info</a></p>
index.html:                    <li><a href="http://test.megacorpone.com/demo/index.php">What are the ethics behind MegaCorp One?</a></li>
index.html:                    <li><a href="http://vpn.megacorpone.com/diffie-hellman/">Is MegaCorp One being regulated by any goverment?</a></li>
index.html:                    <li><a href="http://www.megacorpone.com/aboutus.html">Where can I buy MegaCorp One products?</li>
index.html:                 <li><a href="http://www2.megacorpone.com/test/newsite/index.php">Is there any environmental concerns related to nanotechnology?</a></li>
index.html:                    <li><a href="http://www2.megacorpone.com/test/newsite/index.php">Can I suggest nanotechnology uses for the company to explore?</a></li>
index.html:                    <li><a href="http://www2.megacorpone.com/test/newsite/index.php">What are the specs behind MegaCorpOne nanoprocessors?</a></li>
index.html:                <p><a href="http://admin.megacorpone.com/news/today.php">MegaCorp One acquires new round of funding.</a></p>
index.html:                <p><a href="http://beta.megacorpone.com/util/files/news.html">Lawsuit against MegaCorp One is dropped when plaintiffs go missing.</a></p>
index.html:                <p><a href="http://beta.megacorpone.com/util/files/news.html">MegaCorp One CEO Joe Sheer nominated for Nobel Physics, Medicine, and Literature prizes.</a></p>
index.html:                    <p><small>This is a fictitious company, brought to you by <a href="https://www.offensive-security.com/" target="_blank">Offensive Security</a>.</small></p>
index.html:                        <a href="https://www.facebook.com/MegaCorp-One-393570024393695/" target="_blank"><i class="fa fa-facebook"></i></a>
index.html:                        <a href="https://twitter.com/joe_sheer/"><i class="fa fa-twitter"></i></a>
index.html:                        <a href="https://www.linkedin.com/company/18268898/" target="_blank"><i class="fa fa-linkedin"></i></a>
index.html:                        <a href="https://github.com/megacorpone" target="_blank"><i class="fa fa-github"></i></a>

#########
# seuraavaksi haetaan rivejä käyttämällä "grep", jotka sisältävät ".megacorpone", joka ilmaisee/viittaa aliverkkoon (subdomain) olemassaoloon, ja "grep -v" sisältäviin "www.megacorpone.com" domainia josta tiedetään jo. 

# tulostuksena näyttää paljon lähempänä sitä, mitä tarvitaan. Vähentämällä tietoja loogisella tavalla ja tekemällä peräkkäin pienempiä vähennyksiä jokaisella läpikäynnillä, johon keskellä yleisintä sykliä datan käsittelyyn

# lisäksi jokaisessa rivissä sisältää linkin ja aliverkkotunnuksensa (subdomain), mutta jotta voidaan päästäkseen eroon ylimääräisiä HTML koodista linkien ympärillänsä. Kaikkiin Bashissa suoritettavien tehtäviin löytyy usein lähestysmistapoja, mutta käytettään toista tapaa...

~/CircularFocusedProfiles$ grep "href=" index.html | grep "\.megacorpone" | grep -v "www\.megacorpone\.com" | head
<li><a href="http://support.megacorpone.com">SUPPORT</a></li>
<li><a href="http://intranet.megacorpone.com">LOG IN</a></li>
<!--<li><a href="https://cp.megacorpone.net/">LOG IN</a></li>-->
<li><a href="http://admin.megacorpone.com/admin/index.html">Cell Regeneration</a></li>
<li><a href="http://intranet.megacorpone.com/pear/">Immune Systems Supplements</a></li>
<li><a href="http://mail.megacorpone.com/menu/">Micromachine Cyberisation Repair</a></li>
<li><a href="http://mail2.megacorpone.com/smtp/relay/">Nanomite Based Weaponry Systems</a></li>
<li><a href="http://siem.megacorpone.com/home/">Nanoprobe Based Entity Assimilation</a></li>
<li><a href="http://support.megacorpone.com/ticket/requests/index.html">Nanoprocessors</a></li>
<li><a href="http://syslog.megacorpone.com/logs/sys/view.php">Perlin VanHook Chemical Dispersal</a></li>

#########
# eli lisätään "awk" "-F" -vaihtoehtoa, jolla asetakseen monimerkkisen erottamisen, toisin kuin "cut", joka on yksinkertainen ja kätevä, mutta se sallii vain yhden merkin erottamisen. Seuraavassa kommennossa tapahtuu erotettaan "http://" alkua ja kerrotaan "awk":lle, että halutaan toisen kentän  (‘{print $2}’) tai kaiken tämän erottamisen jälkeen..

# tulostuksessa jokaisen rivin alkuun osoittaa, että ollaan oikeassa suunnassa. 

~/CircularFocusedProfiles$ grep "href=" index.html | grep "\.megacorpone" | grep -v "www\.megacorpone\.com" | awk -F "http://" '{print $2}'
support.megacorpone.com">SUPPORT</a></li>
intranet.megacorpone.com">LOG IN</a></li>

admin.megacorpone.com/admin/index.html">Cell Regeneration</a></li>
intranet.megacorpone.com/pear/">Immune Systems Supplements</a></li>
mail.megacorpone.com/menu/">Micromachine Cyberisation Repair</a></li>
mail2.megacorpone.com/smtp/relay/">Nanomite Based Weaponry Systems</a></li>
siem.megacorpone.com/home/">Nanoprobe Based Entity Assimilation</a></li>
support.megacorpone.com/ticket/requests/index.html">Nanoprocessors</a></li>
syslog.megacorpone.com/logs/sys/view.php">Perlin VanHook Chemical Dispersal</a></li>
test.megacorpone.com/demo/index.php">What are the ethics behind MegaCorp One?</a></li>
vpn.megacorpone.com/diffie-hellman/">Is MegaCorp One being regulated by any goverment?</a></li>
www2.megacorpone.com/test/newsite/index.php">Is there any environmental concerns related to nanotechnology?</a></li>
www2.megacorpone.com/test/newsite/index.php">Can I suggest nanotechnology uses for the company to explore?</a></li>
www2.megacorpone.com/test/newsite/index.php">What are the specs behind MegaCorpOne nanoprocessors?</a></li>
admin.megacorpone.com/news/today.php">MegaCorp One acquires new round of funding.</a></p>
beta.megacorpone.com/util/files/news.html">Lawsuit against MegaCorp One is dropped when plaintiffs go missing.</a></p>
beta.megacorpone.com/util/files/news.html">MegaCorp One CEO Joe Sheer nominated for Nobel Physics, Medicine, and Literature prizes.</a></p>


#########
# seuraavaksi käytettään "cut" optiota, johon asettakseen erottimen arvoon kauttaviiva "/" ja "-d", ja tulostettaan ensimmäisen kentän (-f 1), jolloin jää vain koko aliverkkotunnus (full subdomain name)

~/CircularFocusedProfiles$ grep "href=" index.html | grep "\.megacorpone" | grep -v "www\.megacorpone\.com" | awk -F "http://" '{print $2}' | cut -d "/" -f 1
support.megacorpone.com">SUPPORT<
intranet.megacorpone.com">LOG IN<

admin.megacorpone.com
intranet.megacorpone.com
mail.megacorpone.com
mail2.megacorpone.com
siem.megacorpone.com
support.megacorpone.com
syslog.megacorpone.com
test.megacorpone.com
vpn.megacorpone.com
www2.megacorpone.com
www2.megacorpone.com
www2.megacorpone.com
admin.megacorpone.com
beta.megacorpone.com
beta.megacorpone.com

