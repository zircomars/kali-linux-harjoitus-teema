# Encryption

Salaus tarkoittaa lukittaan kyseinen tiedosto jollakin koodilla, ja avatessa vain se tiedoston vaadittaan todentamista (just se koodi) täsmennys niin voidaan avatta. Tätä käytetään tietojen turvalliseen talentamiseen. Salausta käytettään erityyppisiä salauksia ja yhtä tai useampaa avainta. Avaimen koko on yksitekijä määritettäessä salausuotteen vahvuutta.

Esim. salauksesta salainen (txt) niin lisätään joku salainen koodi (avain) se on sitten lukittu, jos haluttaan lukea niin tarvitaan se avain koodi niin näin päästään lukea se txt tiedosto. 

Salauksenalgoritmi on prosessi, joka muuntaa datan lukukelvottomaksi käyttäen avainta. Tavanomaisesti esimerkiksi AES (Advanced Encryption Standard) -algoritmi käyttää symmetristä avainta muuntaakseen selvätekstin salatekstiksi, jonka voi purkaa takaisin vain oikealla avaimella.

- Symmetrinen salaus (secret key) - samaa salausavainta käytetään viestin salaamiseksi ja purkamisessa.
- Asymmetrinen salus (public key) - tarkoittaa data salataan ja puretaan eri avaimella, jolloin salausavaimen voi laittaa julkiseksi jakoon, ja purettaan avaimen tietävä voi purkaa viestin. 

Salaus tyyppisiä ohjelmia on paljon mm. ccrypt, opensl, AESCrypt ja jne. 


