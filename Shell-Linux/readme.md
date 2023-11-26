<h1> Bash Shell Scripting</h1>

Perus shell-skripti eli komentotulki & vähä kuin odottaa käyttäjä antaa jotakin komentoa, että toistettaan se käyttäjän haluama toiminta mm. pwd, ls, ipconfig ja yms.
Myös sitä voi tallentaa usein käytettyihin komentosarjoihin tiedostoon ja tallennus muoto on .sh
Kun antaa komentotulkissa skriptin nimen, se suorittaa siinä olevat komennot. Joissain komentotulkeissa on ohjausrakenteita joilla voi ohjelmoida näitä skriptejä.

Bourne-Again Shell (Bash) lyhenne, joka on tehokas työympäristö ja komentosarja scripttaus moottori. Toimii pätevänä tietoturva-ammattilaisen hyödyntäen taitaviin Bash-komentosarjaan ja automatisoidakseen monia Linux tehtäviä ja menettelyihin. 

Bash voidaan mieltää ohjelmointikieleksi, ja sitä toteutetaan csh-komentotulkin tyylisen komentohistorialla.

Bash skription ohjelmointia toimii kuin kerran, että toistetaan vain kerran sisäisen ohjelman komennon/käskyn

$sudo su - mennään root käyttäjään, kun ollaan linux tai ubuntu komento cli:ssä

![Alt text](images/scripti.png?raw=true "None")

## Bash variable types

```
Variable Name | Description
$0              The name of the Bash script
$1 - $9         The first 9 arguments to the Bash script
$#              Number of arguments passed to the Bash script
$@              All arguments passed to the Bash script
$?              The exit status of the most recently run process
$$              The process ID of the current script
$USER           The username of the user running the script
$HOSTNAME       The hostname of the machine
$RANDOM         A random number
$LINENO         The current line number in the script
```
