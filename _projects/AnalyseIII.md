---
layout: default
title: "Analyse III"
thumbnail: "assets/AnalyseIII/AnalyseIII_thumbnail.png"
figures_data: "AnalyseIII_figures"
excerpt: "<strong>Vector analysis</strong>: curves, fields , line- and surface integrals... <br>
<strong>Complex analysis</strong>: holomorphic functions, series, residue theorem..."  
---
<h1>Analyse III</h1>

<h2>Trial</h2>
 <img src="{{ site.baseurl }}/assets/AnalyseIII/4.1.1.png" style="max-width: 70%; height: auto;" />

{% assign figures = site.data[page.figures_data] %}
<div class="figures-gallery">
  {% for figure in figures %}
    <div class="figure-item">
      <img src="{{ site.baseurl }}/{{ figure.image }}" />
      <p>Subject: {{ figure.properties.subject }}</p>
    </div>
  {% endfor %}
</div>

<h2>PDF of all the figures:</h2>

<html>
  <head>
    <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width">
  </head>
  <body>
    <object data="{{ site.baseurl }}/assets/AnalyseIII/AnalyseIII.pdf" type="application/pdf" style="min-height:100vh;width:100%"></object>
  </body>
</html>


