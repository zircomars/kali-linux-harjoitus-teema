# Nessus

Ohjelmistosovellu, jossa vaadittaan sisään kirjautumista sallii ohjelmiston käyttöä eli tunnuksia sisään ja nessus on oma haavoittuvuuden skanneri. 

Esim. haavoittuvuuksista ja altistumisesta, josta Nessus voi etsiä mm;
- haavoittuvuuden, jotka voivat sallia luvattoman hallinnan tai pääsyn johonkin järjestelmän arkisto tietoihin
- virheellisiä määrityksiä kuten avoimet sähköpostit, puuttuvia korjaustietoja ja jne.
- oletussalasanat (admin : secret) tai muutamia yleisiä salasanoja ja tyhjiä/puuttuvia salasanoja joillakin järjestelmillä. Myös yleisiä helppoja salasanoja vaikappa: password, admin, admin123, 1234 ja jne. Nessus voi myös kutsus Hydran (ulkoisen työkalua) käynnistäkseen sanakirjanhyökkäyksen.
- Palvelun DDos hyökkäyksien haavoittuvuuksia kieltäminen.

Nessus periaatteessa skannaa kattavia laajan valikoman tekniikoita mm. käyttöjärjestelmät, verkkolaitteet, hypervisorit, tietokannat, verkkopalvleimet ja kriittisiä infrastruktuuria. 