# NMAP

Network Mapper, mitä tunnetaan parhaiten hakkerien työkalua. Toiminnaltaan suorittaa tietoliikenteen porttienskannusta, että jopa skannatta sisäisen  tietojärjestelmän eri tietoliikenneporteissa toimivia ohjelmia ja käyttöjärjestelmiä sekä niiden haavoittuvuutta. 

Skannaa monien verkkoprotokollien kautta, mukaan lukien TCP, UDP, ICMP, SNMP ja monet muut.

Se luo yksityiskohtaisia ​​karttoja verkosta, jotka sisältävät olennaista tietoa siinä olevista laitteista.
Se käyttää räätälöitäviä porttiskannausmenetelmiä verkkolaitteissa käynnissä olevien eri palveluiden tunnistamiseen.

* [komentoja](#komentoja)
   * [komentoja esim](#komentoja-esim)

- [lisätieoriaa mikä on nmap](#lisätieoriaa-mikä-on-nmap)
    * [huomiota skannauksessa](#huomiota-skannauksessa)
    * [pohdinta](#pohdinta)
    * [komentoja linkit](#komentoja-linkit)
    * [hyödyllisiä harjoituksia](#hyödyllisiä-harjoituksia)

![Alt text](images/nmap-1.PNG)

## komentoja

```
┌──(kali㉿kali)-[~]
└─$ nmap -h                
Nmap 7.93 ( https://nmap.org )
Usage: nmap [Scan Type(s)] [Options] {target specification}
TARGET SPECIFICATION:
  Can pass hostnames, IP addresses, networks, etc.
  Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254
  -iL <inputfilename>: Input from list of hosts/networks
  -iR <num hosts>: Choose random targets
  --exclude <host1[,host2][,host3],...>: Exclude hosts/networks
  --excludefile <exclude_file>: Exclude list from file
HOST DISCOVERY:
  -sL: List Scan - simply list targets to scan
  -sn: Ping Scan - disable port scan
  -Pn: Treat all hosts as online -- skip host discovery
  -PS/PA/PU/PY[portlist]: TCP SYN/ACK, UDP or SCTP discovery to given ports
  -PE/PP/PM: ICMP echo, timestamp, and netmask request discovery probes
  -PO[protocol list]: IP Protocol Ping
  -n/-R: Never do DNS resolution/Always resolve [default: sometimes]
  --dns-servers <serv1[,serv2],...>: Specify custom DNS servers
  --system-dns: Use OS's DNS resolver
  --traceroute: Trace hop path to each host
SCAN TECHNIQUES:
  -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scans
  -sU: UDP Scan
  -sN/sF/sX: TCP Null, FIN, and Xmas scans
  --scanflags <flags>: Customize TCP scan flags
  -sI <zombie host[:probeport]>: Idle scan
  -sY/sZ: SCTP INIT/COOKIE-ECHO scans
  -sO: IP protocol scan
  -b <FTP relay host>: FTP bounce scan
PORT SPECIFICATION AND SCAN ORDER:
  -p <port ranges>: Only scan specified ports
    Ex: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9
  --exclude-ports <port ranges>: Exclude the specified ports from scanning
  -F: Fast mode - Scan fewer ports than the default scan
  -r: Scan ports sequentially - don't randomize
  --top-ports <number>: Scan <number> most common ports
  --port-ratio <ratio>: Scan ports more common than <ratio>
SERVICE/VERSION DETECTION:
  -sV: Probe open ports to determine service/version info
  --version-intensity <level>: Set from 0 (light) to 9 (try all probes)
  --version-light: Limit to most likely probes (intensity 2)
  --version-all: Try every single probe (intensity 9)
  --version-trace: Show detailed version scan activity (for debugging)
SCRIPT SCAN:
  -sC: equivalent to --script=default
  --script=<Lua scripts>: <Lua scripts> is a comma separated list of
           directories, script-files or script-categories
  --script-args=<n1=v1,[n2=v2,...]>: provide arguments to scripts
  --script-args-file=filename: provide NSE script args in a file
  --script-trace: Show all data sent and received
  --script-updatedb: Update the script database.
  --script-help=<Lua scripts>: Show help about scripts.
           <Lua scripts> is a comma-separated list of script-files or
           script-categories.
OS DETECTION:
  -O: Enable OS detection
  --osscan-limit: Limit OS detection to promising targets
  --osscan-guess: Guess OS more aggressively
TIMING AND PERFORMANCE:
  Options which take <time> are in seconds, or append 'ms' (milliseconds),
  's' (seconds), 'm' (minutes), or 'h' (hours) to the value (e.g. 30m).
  -T<0-5>: Set timing template (higher is faster)
  --min-hostgroup/max-hostgroup <size>: Parallel host scan group sizes
  --min-parallelism/max-parallelism <numprobes>: Probe parallelization
  --min-rtt-timeout/max-rtt-timeout/initial-rtt-timeout <time>: Specifies
      probe round trip time.
  --max-retries <tries>: Caps number of port scan probe retransmissions.
  --host-timeout <time>: Give up on target after this long
  --scan-delay/--max-scan-delay <time>: Adjust delay between probes
  --min-rate <number>: Send packets no slower than <number> per second
  --max-rate <number>: Send packets no faster than <number> per second
FIREWALL/IDS EVASION AND SPOOFING:
  -f; --mtu <val>: fragment packets (optionally w/given MTU)
  -D <decoy1,decoy2[,ME],...>: Cloak a scan with decoys
  -S <IP_Address>: Spoof source address
  -e <iface>: Use specified interface
  -g/--source-port <portnum>: Use given port number
  --proxies <url1,[url2],...>: Relay connections through HTTP/SOCKS4 proxies
  --data <hex string>: Append a custom payload to sent packets
  --data-string <string>: Append a custom ASCII string to sent packets
  --data-length <num>: Append random data to sent packets
  --ip-options <options>: Send packets with specified ip options
  --ttl <val>: Set IP time-to-live field
  --spoof-mac <mac address/prefix/vendor name>: Spoof your MAC address
  --badsum: Send packets with a bogus TCP/UDP/SCTP checksum
OUTPUT:
  -oN/-oX/-oS/-oG <file>: Output scan in normal, XML, s|<rIpt kIddi3,
     and Grepable format, respectively, to the given filename.
  -oA <basename>: Output in the three major formats at once
  -v: Increase verbosity level (use -vv or more for greater effect)
  -d: Increase debugging level (use -dd or more for greater effect)
  --reason: Display the reason a port is in a particular state
  --open: Only show open (or possibly open) ports
  --packet-trace: Show all packets sent and received
  --iflist: Print host interfaces and routes (for debugging)
  --append-output: Append to rather than clobber specified output files
  --resume <filename>: Resume an aborted scan
  --noninteractive: Disable runtime interactions via keyboard
  --stylesheet <path/URL>: XSL stylesheet to transform XML output to HTML
  --webxml: Reference stylesheet from Nmap.Org for more portable XML
  --no-stylesheet: Prevent associating of XSL stylesheet w/XML output
MISC:
  -6: Enable IPv6 scanning
  -A: Enable OS detection, version detection, script scanning, and traceroute
  --datadir <dirname>: Specify custom Nmap data file location
  --send-eth/--send-ip: Send using raw ethernet frames or IP packets
  --privileged: Assume that the user is fully privileged
  --unprivileged: Assume the user lacks raw socket privileges
  -V: Print version number
  -h: Print this help summary page.
EXAMPLES:
  nmap -v -A scanme.nmap.org
  nmap -v -sn 192.168.0.0/16 10.0.0.0/8
  nmap -v -iR 10000 -Pn -p 80
SEE THE MAN PAGE (https://nmap.org/book/man.html) FOR MORE OPTIONS AND EXAMPLES

```

### komentojen esim

```
- tulostaa koko listan (-sl simple list) & varsinaisesti tämä ei tee mitään kuin skannaa ton /24 maskin kaikki IP-osoitteet ulos, periaatteessa järjestelmä hallitsee porttien scannausta verkkojen liikenteessä

nmap -sL 192.168.240.0/24                                   
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-02 14:15 EDT
Nmap scan report for 192.168.240.0
Nmap scan report for 192.168.240.1
Nmap scan report for 192.168.240.2
```


```
- tämä tulostaa tämän ip-osoitteen maski alueen, mitkä ovat varattu tai ns. pinggaa yhteyttä, vähä kuin hakee/metsästää laiteitta. Se palauttaa mahdollisen host koneiden skannattaviksi, "-sn" poistaa kyseisen käytöstä nmap-oletusyhdyskäyttävän (gateway), ja kuitenkin toistaa/yrittää pinggata host koneita 

┌──(kali㉿kali)-[~]
└─$ nmap -sn 192.168.240.0/24
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-02 14:16 EDT
Nmap scan report for 192.168.240.1
Host is up (0.0041s latency).
Nmap scan report for 192.168.240.2
Host is up (0.0022s latency).
Nmap scan report for 192.168.240.129
Host is up (0.0053s latency).
Nmap scan report for 192.168.240.130
Host is up (0.0052s latency).
Nmap done: 256 IP addresses (4 hosts up) scanned in 2.72 seconds
```

```
https://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/
- nmap porttien skannausta näiden tiettyjen IP-osoite alueesta just tämä 192.168.56.59 ja .102 väliltä, ja havaitseeko mm mitään protokollaa.
tämä tarkoittaa se ikään kuin löysi kullan/bingo osuman tämän host verkko alueelta avoimia verkkportteja.
tässä esimerkissä on 192.168.56.102 osoite on joku määritettyjen metasploitable haavoittuvuuden kone (katso linkki), minkä vuoksi tässä host-isäntä koneella on monta haavoittuvuutta porttia.
┌──(kali㉿kali)-[~]
└─$ nmap 192.168.56.1,50-102
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-02 14:41 EDT
Nmap scan report for 192.168.56.1
Host is up (0.0043s latency).
Not shown: 993 filtered tcp ports (no-response)
PORT     STATE SERVICE
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
443/tcp  open  https
445/tcp  open  microsoft-ds
902/tcp  open  iss-realsecure
912/tcp  open  apex-mesh
5357/tcp open  wsdapi

Nmap done: 54 IP addresses (1 host up) scanned in 25.22 seconds
```

<detail>
  
```
  ┌──(kali㉿kali)-[~]
└─$ nmap -v -A scanme.nmap.org                                      
Starting Nmap 7.93 ( https://nmap.org ) at 2023-11-05 19:43 EET
NSE: Loaded 155 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 19:43
Completed NSE at 19:43, 0.00s elapsed
Initiating NSE at 19:43
Completed NSE at 19:43, 0.00s elapsed
Initiating NSE at 19:43
Completed NSE at 19:43, 0.00s elapsed
Initiating Ping Scan at 19:43
Scanning scanme.nmap.org (45.33.32.156) [2 ports]
Completed Ping Scan at 19:43, 0.19s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 19:43
Completed Parallel DNS resolution of 1 host. at 19:43, 0.15s elapsed
Initiating Connect Scan at 19:43
Scanning scanme.nmap.org (45.33.32.156) [1000 ports]
Discovered open port 22/tcp on 45.33.32.156
Discovered open port 80/tcp on 45.33.32.156
Discovered open port 9929/tcp on 45.33.32.156
Discovered open port 31337/tcp on 45.33.32.156
Completed Connect Scan at 19:44, 39.80s elapsed (1000 total ports)
Initiating Service scan at 19:44
Scanning 4 services on scanme.nmap.org (45.33.32.156)
Completed Service scan at 19:44, 6.80s elapsed (4 services on 1 host)
NSE: Script scanning 45.33.32.156.
Initiating NSE at 19:44
Completed NSE at 19:44, 10.47s elapsed
Initiating NSE at 19:44
Completed NSE at 19:44, 0.81s elapsed
Initiating NSE at 19:44
Completed NSE at 19:44, 0.00s elapsed
Nmap scan report for scanme.nmap.org (45.33.32.156)
Host is up (0.19s latency).
Other addresses for scanme.nmap.org (not scanned): 2600:3c01::f03c:91ff:fe18:bb2f
Not shown: 996 filtered tcp ports (no-response)
PORT      STATE SERVICE    VERSION
22/tcp    open  ssh        OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.13 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   1024 ac00a01a82ffcc5599dc672b34976b75 (DSA)
|   2048 203d2d44622ab05a9db5b30514c2a6b2 (RSA)
|   256 9602bb5e57541c4e452f564c4a24b257 (ECDSA)
|_  256 33fa910fe0e17b1f6d05a2b0f1544156 (ED25519)
80/tcp    open  http       Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Go ahead and ScanMe!
|_http-favicon: Nmap Project
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
9929/tcp  open  nping-echo Nping echo
31337/tcp open  tcpwrapped
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 19:44
Completed NSE at 19:44, 0.00s elapsed
Initiating NSE at 19:44
Completed NSE at 19:44, 0.00s elapsed
Initiating NSE at 19:44
Completed NSE at 19:44, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 59.31 seconds

```

</detail>

# lisätieoriaa mikä on nmap

https://www.topsevenreviews.com/fi/nmap-review/ <br>
https://www.trucoteca.com/fi/mik%C3%A4-on-nmap/ <br>

## huomiota skannauksessa

Vaikka jos avoimet portit eivät välttämättä itsessään ole haavoittuvuus, ne sisältävät mahdollisen haavoittuvuuden, joita voidaan hyödyntää. Muistutus, jos portti on viestintäkanava kahden järjestelmien välillä ja voi olla ilmeinen hyökkäys vektori. joten haitallisen toimija voi hyldyntää avointa porttia, jossa on haavoittuvia palveluita ja käyttää sitä koodin suorittamiseen.

Jos on tiedossa mikä porti on auki niin kantsii suorittaa tarkistuksen kautta, voit määrittää, onko portin oltava auki ja jos on, niin kyseisiin palveluihin liittyvien haavoittuvuus vähentäimiseksi. Jos on epävarma, pitäisikö portin olla auki tai et pysty korjaamaan tai vähentämään haavoittuvuutta tyydyttävästi, on parasta sulkea ja tutkia portia. 

<b> onko haavoittuvuuden skannaus lailista? </b>
Onhan se laitonta eli siis kyllä, ilman omistajan lupaa voi olla laitonta. Siitä voi seurata jopa tiukoi laillisien rangaistusta sijainnista riippumatta. 

Jos käyttäjä on tietoturvatutkija, tietoturva-ammattilainen tai eettinen hakkeri, joka suorittaa valtuutetun penetraationtestauksen, verkon skannaus saattaa olla lailista. Parasta on kuitenkin ensin skannauksen tai testin parametrin ennen skannauksen suorittamista.

## pohdinta

Nmap on tehokas työkalu verkon haavoittuvuuden etimisessä, verkkokartan ymmärtämistä ja siinä käynnissä olevien palveluiden arvioimista. Nmap toiminnnalle on kuitenkin rajaa.

Se ei pysty yksinään hyödyntämään verkosta löydettyjä haavoittuvuutta. Vaikka se voi tarjota paljon tietoa, jonka avulla käyttäjä svoi suunnitella hyökkäyksiä hyökkääjän simuloimisessa ja suorittaa hyväksikäytön muiden työkalujen kautta.

Nmap ei ole myöskään idioottivarma (foolproof, erehtymätön) menetelmä haaavoittuvuuksien tunnistaminen. Vaikka komento scriptiä kuten <b>vuln</b>, <b>vulners</b>, <b>vulscan</b>, käyttö antaa paljon tietoa haavoittuvista palveluista, se ei voi taatata, että kaikki haavoittuvuudet on löydetty. Periaatteessa vaattii lisätutkimista saaattaa silti tarvita.

Muut verkkoelementit kuten palomuurit ja IDS, voivat estää haavoittuvuuden tarkistamisen onnistumista. Tärkeänä on tarkistaa huolellisesti skannauksen saamasta tietoa ja harkita epäonnistuneita portteja tai palveluita ja niiden merkistystä verkossa.

## komentoja linkit

https://www.linuxadictos.com/fi/nmap.html#Escaner_Xmas
https://kulonpaa.com/?p=259
https://tonivapalo.com/posts/tunkeutumistestaus/ptvt4/
https://owasp.org/www-pdf-archive/Analysing_Networks_with_NMAP.pdf

## hyödyllisiä harjoituksia

https://armerj.github.io/SQLi-BadStore/
https://cyb3r-cod3r.blogspot.com/2017/04/badstore-vulnerabilities.html
https://www.youtube.com/watch?v=jmYSAz8U08Q



