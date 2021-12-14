<h1> Grafana - Prometheus </h1>

Oman grafana sovelluksen sivustossa lisää oman data lähteen (data source) valikkon, ja tulee asentaa, jotta voidaan seurantaa sitä fyysisen Prometheus HTTP polkua. 
Yksi kuva vaiheesta, mitä vain lisää yksi ID-tunnus, ja ei tarvi copy-paste. <b> https://grafana.com/grafana/dashboards/1860 </b> kopioi vain polku liiitteen numeron ja viimeisenä (import) tuoda se sisältö.

![Alt text](images-prometheus/Sieppaa1-addPrometheus.PNG?raw=true "None")

![Alt text](images-prometheus/Sieppaa2-addPathUrl.PNG?raw=true "None")

tähän väliin, yritettään importtaa & yritettään hakea "prometheus node_exporter grafana"

hae alimmasta valikkosta "prometheus" ja muista tallentaa & viimeisen "import" & viimeisenä avautuu oma Dashboard

![Alt text](images-prometheus/Sieppaa3-importJsonNum.PNG?raw=true "None")

![Alt text](images-prometheus/Sieppaa5-saveAndNewDashboard.PNG?raw=true "None")

![Alt text](images-prometheus/Sieppaa8-backNodeExportFull_SelectLocalhost.PNG?raw=true "None")

![Alt text](images-prometheus/Sieppaa10-hiddenOwnGraphics.PNG?raw=true "None")
