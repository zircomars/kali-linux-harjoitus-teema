nslookup Options
Find all the important nslookup options in the following table.


```
nslookup Option	                  Description
-domain=[domain-name]	            Change the default DNS name.
-debug	                          Show debugging information.
-port=[port-number]	              Specify the port for queries. The default port number is 53.
-timeout=[seconds]	              Specify the time allowed for the server to respond.
-type=a	                          View information about the DNS A address records.
-type=any	                        View all available records.
-type=hinfo	                      View hardware-related information about the host.
-type=mx	                        View Mail Exchange server information.
-type=ns	                        View Name Server records.
-type=ptr	                        View Pointer records. Used in reverse DNS lookups.
-type=soa	                        View Start of Authority records.

```

## esim.

```
┌──(kali㉿kali)-[~]
└─$ nslookup -port=53 google.fi
Server:         192.168.240.2
Address:        192.168.240.2#53

Non-authoritative answer:
Name:   google.fi
Address: 216.58.211.227
Name:   google.fi
Address: 2a00:1450:4026:803::2003
```

```
┌──(kali㉿kali)-[~]
└─$ nslookup -type=hinfo google.fi
Server:         192.168.240.2
Address:        192.168.240.2#53

Non-authoritative answer:
*** Can't find google.fi: No answer

Authoritative answers can be found from:
google.fi
        origin = ns1.google.com
        mail addr = dns-admin.google.com
        serial = 586958032
        refresh = 900
        retry = 900
        expire = 1800
        minimum = 60
```

```
┌──(kali㉿kali)-[~]
└─$ nslookup -debug megacorpone.com
Server:         192.168.240.2
Address:        192.168.240.2#53

------------
    QUESTIONS:
        megacorpone.com, type = A, class = IN
    ANSWERS:
    AUTHORITY RECORDS:
    ->  megacorpone.com
        origin = ns1.megacorpone.com
        mail addr = admin.megacorpone.com
        serial = 202102161
        refresh = 28800
        retry = 7200
        expire = 2419200
        minimum = 300
        ttl = 5
    ADDITIONAL RECORDS:
------------
Non-authoritative answer:
------------
    QUESTIONS:
        megacorpone.com, type = AAAA, class = IN
    ANSWERS:
    AUTHORITY RECORDS:
    ->  megacorpone.com
        origin = ns1.megacorpone.com
        mail addr = admin.megacorpone.com
        serial = 202102161
        refresh = 28800
        retry = 7200
        expire = 2419200
        minimum = 300
        ttl = 5
    ADDITIONAL RECORDS:
------------
*** Can't find megacorpone.com: No answer
```









