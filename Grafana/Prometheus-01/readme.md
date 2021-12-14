<h1>Grafana & Prometheus 28.11.2021</h1>
<b> Lisä vaihe kuvia löytyy kansio prometheus & images </b>

<h1> Mikä on prometheus sovellus? </h1>
Ilmainen ohjelmisto sovellus, mitä käytettään tapahtumien seurannassa ja hälytyksissä. Sitä voi tallentaa reaaliaikaisia mittarrien diagrammia kuten ympyrät, viivakaaviot, pylväskaavio, taulukkot ja maapallo kartta tietokannan. Myös diagrammin seurannassa tulostuu luvun mittayksikkköt, että esim. lämpötilan celcsius ja fahrenheit. Aikasarjantietokannat, mitä rakentuu käyttämällä HTTP protokollaa, mitä joustaa kyseisen ja reaaliaikaisen hälytyksen. <br>

<br>
Prometheus sovelluksessa, mitä pitää aktivoida päälle, jotta voi suorittaa reaaliaikaisen ajan seurannan. Ennen sitä pitää ensin asentaa se paketti sovellus, ja tarkistaa HTTP polusta, että se toimii ja oletus polku loppu osa on 9090 eli <oma_IP>:9090 <br>

<h2> Linux install prometheus ALKAA TÄSTÄ </h2>

![Alt text](images/Sieppaa1-prometheusDownload.PNG?raw=true "None")
![Alt text](images/Sieppaa2-install&purkaus.PNG?raw=true "None")

<h3>Prometheus software running </h3> <br>

![Alt text](images/Sieppaa3-aktivoiPrometheus.PNG?raw=true "None")

![Alt text](images/Sieppaa4-PrometheusPolku.PNG?raw=true "None")
![Alt text](images/Sieppaa5-TargetPolku.PNG?raw=true "None")
![Alt text](images/Sieppaa6-metricSivu.PNG?raw=true "None")

![Alt text](images/Sieppaa7-valitaanJokuLuku.PNG?raw=true "None")
![Alt text](images/Sieppaa8-pieniKuvaus.PNG?raw=true "None")
![Alt text](images/Sieppaa9-haekohde.PNG?raw=true "None")

![Alt text](images/Sieppaa10-haekohde.PNG?raw=true "None")
![Alt text](images/Sieppaa11-haeKohdeGrafiikka.PNG?raw=true "None")

