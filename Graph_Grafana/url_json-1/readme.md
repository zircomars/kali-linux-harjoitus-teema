<h1>URL JSON esim. Covid<h1>
 
<!--tutoriaali linkki: https://www.youtube.com/watch?v=Wmgs1E9Ry-s -->
  
![Alt text](images/Grafana-json-Dashboard.PNG?raw=true "None")

  <h1>Grafana JSON välivaiheet</h1>
  1) Mene sivuston linkkiin, ja scrolla alas kuin "Documentation On Postman" <br>
  
  ![Alt text](images/Sieppaa-1API-url.PNG?raw=true "None")

  ![Alt text](images/Sieppaa-2API-url.PNG?raw=true "None") <br>
  
  <br> 2) Postman sivustossa näkyy valmiiksi COVID 19 API, ja mene valikkoon kuin "Summary"
  
  ![Alt text](images/Sieppaa-3Postman-GET.PNG?raw=true "None") <br>
    
  ![Alt text](images/Sieppaa-3Postman-GETSummary.PNG?raw=true "None") <br>
  
  <b>3) Takaisin Grafanaan </b>, ja avaa itselle uusi projekti / Data Source & Nimeä oma haluamanssa nimi tai jätä oletus asetukset
  
  ![Alt text](images/Sieppaa-4addSources.PNG?raw=true "None") <br>
  
  <b>4) Takaisin Postman sivustoon </b>, ja mene Postman sivuston summary sivustoon, mitä näkyi 3-vaiheen kuvan oikeassa covid19api.com/summary linkissä
  Kopioi sisäisen JSON formaatti setti, ja liitä se toiseen välilehteen
  
  ![Alt text](images/Sieppaa-5CopyJSON-1.PNG?raw=true "None") <br>
  
  <b>4.1) Toinen välilehti </b>, mitä liität tänne summary sisäisen JSON datan, ja formaattin avulla kuin suorittaa helpommaksi datan järjestelmän luettavaksi
  <b>Before </b>
  ![Alt text](images/Sieppaa-5CopyJSON-2Before.PNG?raw=true "None") <br>
  
  <b>After </b>
  ![Alt text](images/Sieppaa-5CopyJSON-3After.PNG?raw=true "None") <br>
  
  <b>5) Viimeisenä </b> muokkaa dashboard panelin ja määrittää itse haluamansa tyyppin grafiikkan ja luettavaksi näköiseksi
  ![Alt text](images/Grafana-CovidPanel-1.PNG?raw=true "None") <br>
