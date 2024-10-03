# Encryption

Salaus tarkoittaa lukittaan kyseinen tiedosto jollakin koodilla, ja avatessa vain se tiedoston vaadittaan todentamista (just se koodi) täsmennys niin voidaan avatta. Tätä käytetään tietojen turvalliseen talentamiseen. Salausta käytettään erityyppisiä salauksia ja yhtä tai useampaa avainta. Avaimen koko on yksitekijä määritettäessä salausuotteen vahvuutta.

Esim. salauksesta salainen (txt) niin lisätään joku salainen koodi (avain) se on sitten lukittu, jos haluttaan lukea niin tarvitaan se avain koodi niin näin päästään lukea se txt tiedosto. 

Salauksenalgoritmi on prosessi, joka muuntaa datan lukukelvottomaksi käyttäen avainta. Tavanomaisesti esimerkiksi AES (Advanced Encryption Standard) -algoritmi käyttää symmetristä avainta muuntaakseen selvätekstin salatekstiksi, jonka voi purkaa takaisin vain oikealla avaimella.

- Symmetrinen salaus (secret key) - samaa salausavainta käytetään viestin salaamiseksi ja purkamisessa.
- Asymmetrinen salus (public key) - tarkoittaa data salataan ja puretaan eri avaimella, jolloin salausavaimen voi laittaa julkiseksi jakoon, ja purettaan avaimen tietävä voi purkaa viestin. 

Salaus tyyppisiä ohjelmia on paljon mm. ccrypt, opensl, AESCrypt ja jne. 

## esim CCrypt salausalgoritmi konffaus

```
┌──(testi㉿kali)-[~/Documents/harjoitus/varmuuskopiot] 
└─$ ccrypt -h                                 

ccrypt 1.11. Secure encryption and decryption of files and streams.

Usage: ccrypt [mode] [options] [file...] 

       ccencrypt [options] [file...] 

       ccdecrypt [options] [file...] 

       ccat [options] file...

Modes: 

    -e, --encrypt         encrypt 

    -d, --decrypt         decrypt 

    -c, --cat             cat; decrypt files to stdout 

    -x, --keychange       change key 

    -u, --unixcrypt       decrypt old unix crypt files 

Options: 

    -h, --help            print this help message and exit 

    -V, --version         print version info and exit 

    -L, --license         print license info and exit 

    -v, --verbose         print progress information to stderr 

    -q, --quiet           run quietly; suppress warnings 

    -f, --force           overwrite existing files without asking 

    -m, --mismatch        allow decryption with non-matching key 

    -E, --envvar var      read keyword from environment variable (unsafe) 

    -K, --key key         give keyword on command line (unsafe) 

    -k, --keyfile file    read keyword(s) as first line(s) from file 

    -P, --prompt prompt   use this prompt instead of default 

    -S, --suffix .suf     use suffix .suf instead of default .cpt 

    -s, --strictsuffix    refuse to encrypt files which already have suffix 

    -F, --envvar2 var     as -E for second keyword (for keychange mode) 

    -H, --key2 key        as -K for second keyword (for keychange mode) 

    -Q, --prompt2 prompt  as -P for second keyword (for keychange mode) 

    -t, --timid           prompt twice for encryption keys (default) 

    -b, --brave           prompt only once for encryption keys 

    -y, --keyref file     encryption key must match this encrypted file 

    -r, --recursive       recurse through directories 

    -R, --rec-symlinks    follow symbolic links as subdirectories 

    -l, --symlinks        dereference symbolic links 

    -T, --tmpfiles        use temporary files instead of overwriting (unsafe) 

    --                    end of options, filenames follow 
```

Konffaus - START HERE;
```
┌──(testi㉿kali)-[~/Documents/harjoitus/varmuuskopiot] 
└─$ ccrypt kopio.txt  

Enter encryption key:  
Enter encryption key: (repeat)  

  

┌──(testi㉿kali)-[~/Documents/harjoitus/varmuuskopiot] 
└─$ ls             
kopio.txt.cpt 

┌──(testi㉿kali)-[~/Documents/harjoitus/varmuuskopiot] 
└─$ cat kopio.txt.cpt  

�jSI��ޗ�[��wa,����q�z�'�                                                                                                     


┌──(testi㉿kali)-[~/Documents/harjoitus/varmuuskopiot] 
└─$ ccat kopio.txt.cpt  

Enter decryption key:  
moi 
1 
2 
3 
4 
                                                                                                                 

┌──(testi㉿kali)-[~/Documents/harjoitus/varmuuskopiot] 
└─$ cat kopio.txt.cpt  

�jSI��ޗ�[��wa,����q�z�'�                                                                                                                             

```















