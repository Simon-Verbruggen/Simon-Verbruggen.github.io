---
layout: default
title: "Analyse III"
thumbnail: "assets/manual_figures/Analyse_III/Analyse_III_thumbnail.png"
figures_data: "Analyse_III_figures"
excerpt: "<strong>Vector analysis</strong>: curves, fields , line- and surface integrals... <br>
<strong>Complex analysis</strong>: holomorphic functions, series, residue theorem..."  
---
<h1>{{ page.title }}</h1>

<h2> Step 1: discretize the geometry</h2>
Approximate the geometry with elements (triangles, rectangles, etc.) forming a surface mesh.
<figure style="width: 100%; margin: 0; text-align: center;">
    <iframe
        src="{{ '/assets/htmls/wireframe_sphere.html' | relative_url }}"
        width="100%"
        height="450"
        style="border: none;">
    </iframe>
    <figcaption style="font-size: 0.9em; color: #666;">
        <strong>Figure 1:</strong> Example surface mesh of a sphere.
    </figcaption>
</figure>

<h2> Step 2: Expand the field in basis functions</h2>
Represent the unknown field as linear combination of basis functions.

<h2> Step 3: obtain matrix system</h2>
Rewrite the equations to obtain a system matrix system
[
\mathbf{A}\mathbf{x}=\mathbf{b},
]

Step 4: Solve the matrix system to obtain the field \mathbf{x}
Here we compare the numerical solution on the sphere to the analytical solution (Mie series).



<div style="width: 140%; margin-left: -10%; display: flex; gap: 10px;">

  <figure style="flex: 1; min-width: 0; margin: 0; text-align: center;">
      <iframe
          src="{{ '/assets/htmls/efie.html' | relative_url }}"
          style="width: 100%; height: 400px; border: none;">
      </iframe>
      <figcaption style="font-size: 0.9em; color: #666;">
          <strong>(a)</strong> Numerical solution (EFIE).
      </figcaption>
  </figure>

  <figure style="flex: 1; min-width: 0; margin: 0; text-align: center;">
      <iframe
          src="{{ '/assets/htmls/mie.html' | relative_url }}"
          style="width: 100%; height: 400px; border: none;">
      </iframe>
      <figcaption style="font-size: 0.9em; color: #666;">
          <strong>(b)</strong> Analytical solution (Mie series).
      </figcaption>
  </figure>

</div>
