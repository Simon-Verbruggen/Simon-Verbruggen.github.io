---
layout: default
title: "Analyse III"
thumbnail: "assets/AnalyseIII/AnalyseIII_thumbnail.png"
figures_data: "AnalyseIII_figures"
excerpt: "<strong>Vector analysis</strong>: curves, fields , line- and surface integrals... <br>
<strong>Complex analysis</strong>: holomorphic functions, series, residue theorem..."  
---
<h1>Analyse III<h1>

{% assign figures = site.data[page.figures_data] %}
<div class="figures-gallery">
  {% for figure in figures %}
    <div class="figure-item">
      <img src="{{ figure.image }}" alt="{{ figure.title }}" style="max-width: 70%; height: auto;" />
      <p>Subject: {{ figure.properties.subject }}</p>
      <p>Resolution: {{ figure.properties.resolution }}</p>
    </div>
  {% endfor %}
</div>

PDF of all the figures.

<html>
  <head>
    <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width">
  </head>
  <body>
    <object data="{{ site.baseurl }}/assets/AnalyseIII/AnalyseIII.pdf" type="application/pdf" style="min-height:100vh;width:100%"></object>
  </body>
</html>


