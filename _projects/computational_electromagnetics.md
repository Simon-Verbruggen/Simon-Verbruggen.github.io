---
layout: default
title: "Computational electromagnetics"
thumbnail: "assets/figures/bunny_efie.png"
figures_data: "Analyse_III_figures"
excerpt: "Introduction on computational electromagnetics."  
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
\\[
\mathbf{A} \cdot \mathbf{x}=\mathbf{b},
\\]

<h2> Step 4: obtain the fields</h2>
Solve the matrix system to obtain the field $\mathbf{x}$.

The method can then be validated, below we compare the numerical solution for the electric current density $\mathbf{J}$ on the sphere to the analytical solution (Mie series).



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

After the method is validated, we can simulate on any geometry:

<div style="width: 140%; margin-left: -10%; display: flex; gap: 10px;">

<figure style="flex: 1; min-width: 0; margin: 0; text-align: center;">
    <iframe
        src="{{ '/assets/htmls/wireframe_bunny.html' | relative_url }}"
        width="100%"
        height="450"
        style="border: none;">
    </iframe>
</figure>

<figure style="flex: 1; min-width: 0; margin: 0; text-align: center;">
    <iframe
        src="{{ '/assets/htmls/bunny_efie.html' | relative_url }}"
        style="width: 100%; height: 400px; border: none;">
    </iframe>
</figure>

</div>