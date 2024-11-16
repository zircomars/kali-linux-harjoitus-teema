# base64 
Base64 on encoding-menetelmä, joka muuntaa binääridataksi just kuvat, tiedosto tai muu tiedostot tai jopa url linkkiäkin. 

```
┌──(kali㉿kali)-[~]
└─$ base64 --h
Usage: base64 [OPTION]... [FILE]
Base64 encode or decode FILE, or standard input, to standard output.

With no FILE, or when FILE is -, read standard input.

Mandatory arguments to long options are mandatory for short options too.
  -d, --decode          decode data
  -i, --ignore-garbage  when decoding, ignore non-alphabet characters
  -w, --wrap=COLS       wrap encoded lines after COLS character (default 76).
                          Use 0 to disable line wrapping
      --help        display this help and exit
      --version     output version information and exit

The data are encoded as described for the base64 alphabet in RFC 4648.
When decoding, the input may contain newlines in addition to the bytes of
the formal base64 alphabet.  Use --ignore-garbage to attempt to recover
from any other non-alphabet bytes in the encoded stream.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/base64>
or available locally via: info '(coreutils) base64 invocation'
                                                                                
```

## base64 koodaus

Base64 ei ole salausmenetelmä vaan koodausmenetelmä, mikä tarokituksena on muuntaa binääridataksi tekstimuotoon just mm. tiedostoja ja tai merkkijonoa. Jonka kautta voi turvallisesti siirtää tekstipohjoisessa ympäristössä vaikkapa .txt , sähköpostissa tai URL-osoitteissa. Vaikka se muuttaisikin ja esittää binääridataa vai nmerkkeinä, mutta se ei suojaa dataa- se ei ole salusta, koska sen voi helposti purkaa takaisin lakuperäiseen muotoonsa.

Base64 toimii siis enemmänkin koodauksena kuin salauksena, eikä se tarjoa mitään suojaa tiedon sisällölle. Jos halutaan suojata dataa salaamalla se, tarvitaan oikeita salausalgoritmeja, kuten AES, RSA tai muita vastaavia salausmenetelmiä.


Esim. binäärinen "kissa" sana, muuntaisi Base64 muotoon:
```
┌──(kali㉿kali)-[~]
└─$ echo "kissa" | base64
a2lzc2EK
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ echo "a2lzc2EK" | base64 -d
kissa
```


toinen esim. linkkejä ja toi `base64 -d` tarkoittaa --decode eli muunnettaan sitä takaisin
```
┌──(kali㉿kali)-[~]
└─$ echo "https://iltalehti.fi" | base64 
aHR0cHM6Ly9pbHRhbGVodGkuZmkK
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ echo "aHR0cHM6Ly9pbHRhbGVodGkuZmkK" | base64 -d
https://iltalehti.fi

```

esimerkki muutettaisiin tämä decode takaisin tekstiksi
```
┌──(kali㉿kali)-[~]
└─$ echo "dMOkbcOkIG9uIGhhdXNrYWEh" | base64 -d
tämä on hauskaa!
```
