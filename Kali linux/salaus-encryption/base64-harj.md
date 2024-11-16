# base64 
Base64 on encoding-menetelmä, joka muuntaa binääridataksi just kuvat, tiedosto tai muu tiedostot tai jopa url linkkiäkin. 

## base64 koodaus

Base64 ei ole salausmenetelmä vaan koodausmenetelmä, mikä tarkoituksena on muuntaa binääridataksi tekstimuotoon just mm. tiedostoja ja tai merkkijonoa. Jonka kautta voi turvallisesti siirtää tekstipohjoisessa ympäristössä vaikkapa .txt , sähköpostissa tai URL-osoitteissa. Vaikka se muuttaisikin ja esittää binääridata tai merkeinä, mutta se ei suojaa dataa- se ei ole salusta, koska sen voi helposti purkaa takaisin lakuperäiseen muotoonsa.

Base64 toimii siis enemmänkin koodauksena kuin salauksena, eikä se tarjoa mitään suojaa tiedon sisällölle. Jos halutaan suojata dataa salaamalla se, tarvitaan oikeita salausalgoritmeja, kuten AES, RSA tai muita vastaavia salausmenetelmiä.

Base64 toimii Linux komennolla (Bash terminaalissa) ja vastaavasti voi toki hyvinkin rakentaa jos on koodauksessa hyvä niin koodaa Python kielellä.


Esim1. binäärinen "kissa" sana, muuntaisi Base64 muotoon, ensimmäisessä tapahtuu <b>encode</b> ja muutetun takaisin on <b>decode</b>
```
┌──(kali㉿kali)-[~]
└─$ echo "kissa" | base64
a2lzc2EK
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ echo "a2lzc2EK" | base64 -d
kissa
```
<hr>

toinen esim. linkkejä ja toi `base64 -d` tarkoittaa --decode eli muunnettaan sitä takaisin ja sama idea kuin kissa
```
┌──(kali㉿kali)-[~]
└─$ echo "https://iltalehti.fi" | base64 
aHR0cHM6Ly9pbHRhbGVodGkuZmkK
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ echo "aHR0cHM6Ly9pbHRhbGVodGkuZmkK" | base64 -d
https://iltalehti.fi

```

<hr>

esimerkki muutettaisiin tämä <b>decode</b> takaisin tekstiksi 
```
┌──(kali㉿kali)-[~]
└─$ echo "dMOkbcOkIG9uIGhhdXNrYWEh" | base64 -d
tämä on hauskaa!
```

<hr>

Esim. <b>Powershell terminaalissa </b> , sekä ensimmäinen tapahtuu <b>enkoodaus</b> ja toisena <b>dekoodaus</b>

```
PS C:\> [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("merkkijono"))
bWVya2tpam9ubw==
PS C:\>
PS C:\> [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("SGVsbG8gV29ybGQ="))
Hello World
```

## enkoodaus ja dekoodaus

- Enkoodaus tarkoittaa sitä, että binääridata muunnetaan johonkin toiseen formaattiin (kuten Base64 ) siten, että se on helpommin käsiteltävissä, erityisesti tekstipohjaisissa ympäristöissä.

- Dekoodaus puolestaan on prosessi, jossa tämä tekstimuotoinen (esimerkiksi Base64-koodattu) data muutetaan takaisin alkuperäiseen binäärimuotoonsa.

Eli base64 koodattava "kissa" muutettuna on `a2lzc2EK` ja jos muutettaan takaisin se on <b>dekoodausta</b>, niin palautumisessa menee alkuperäiseksi tekstiksi.
