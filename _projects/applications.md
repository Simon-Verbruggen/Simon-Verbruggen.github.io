---
layout: default
title: "Applications"
thumbnail: "assets/manual_figures/thumbnails/microstrip_patch_antenna.svg"
excerpt: "Applications of computational electromagnetics in communication systems, medical technology, and defence."  
---
<h1>{{ page.title }}</h1>

Computational electromagnetism plays an essential role in the development of modern technology. Increasing performance demands lead to increasingly complex technologies, making it more difficult to accurately model the electromagnetic fields in state-of-the-art electronic devices and systems.

Efficient and flexible computational methods are therefore essential. Accurate electromagnetic simulations make technology development more efficient by reducing the need for costly and time–intensive prototyping, thereby lowering material waste, energy consumption, and development time. 

Below are some prominent application fields for computational electromagnetism, along with examples.

<style>
.app-section {
  margin: 2.5rem 0;
}

.app-box {
  background: #dce8f5;
  border: 3px solid #2266cc;
  border-radius: 28px;
  padding: 1rem 2rem;
}
.app-box h3 {
  color: #1a7a1a;
  margin: 0 0 0.5rem 0;
}
.app-box ul {
  margin: 0;
  padding-left: 1.2rem;
}

.app-figures {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  gap: 1.5rem;
  margin-top: 1.5rem;
}
.app-figures img {
  max-height: 220px;
  max-width: 100%;
  height: auto;
  width: auto;
}

.app-figures figcaption {
  text-align: center;
  margin-top: 0.5rem;
}

</style>

<div class="app-section">
  <div class="app-box">
    <h3>Communication</h3>
    <ul>
      <li>Antennas (e.g. 6G)</li>
      <li>Microchips</li>
      <li>Mobile devices</li>
      <li>Wi-Fi coverage</li>
      <li>GPS/Satellite navigation</li>
    </ul>
  </div>
  <div class="app-figures">
    <figure>
      <img src="/assets/manual_figures/applications/communication_systems/microstrip_patch_antenna.svg" alt="microstrip patch antenna array radiation pattern">
      <figcaption>
        Microstrip antenna array <a href="https://www.trellisign.com/emag-solution">(Trellisign)</a>
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/communication_systems/GPS.jpeg" alt="GPS Satellite">
      <figcaption>
        Satellite <a href="https://www.ema3d.com/blog/surface-to-surface-discharges-satellite-antenna-transients/">(EMA)</a>
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/communication_systems/image_antenna_design.png" alt="antenna design">
      <figcaption>
        Antenna design <a href="https://help.altair.com/2021/feko/topics/feko/user_guide/introduction/antenna_design_feko_c.htm">(Altair Feko)</a>
      </figcaption>
    </figure>
  </div>
</div>

<div class="app-section">
  <div class="app-box">
    <h3>Medical</h3>
    <ul>
      <li>Device design (e.g. MRI)</li>
      <li>Imaging</li>
      <li>Exposure calculation</li>
      <li>Neurostimulation</li>
    </ul>
  </div>

  <div class="app-figures">
    <figure>
      <img src="/assets/manual_figures/applications/medical/MRI.png" alt="EM fields in MRI">
      <figcaption>
        EM fields in MRI <a href="https://plmtechtalk.com/2023/02/24/simulation-of-magnetic-fields-in-mri-machines/">(plm tech talk)</a>
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/medical/emc011.png" alt="brain imaging device">
      <figcaption>
        Design of a brain-imaging device <a href="https://wipl-d.com/applications/emc/">(WIPL-D)</a>
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/medical/phone.png" alt="SAR exposure (phone)">
      <figcaption>
        Exposure calculation (SAR)
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/medical/image_brain.png" alt="Neurostimulation">
      <figcaption>
        Neurostimulation
      </figcaption>
    </figure>
  </div>
</div>

<div class="app-section">
  <div class="app-box">
    <h3>Military</h3>
    <ul>
      <li>Radar cross section (RCS)</li>
      <li>Communication systems</li>
    </ul>
  </div>
  <div class="app-figures">
    <figure>
      <img src="/assets/manual_figures/applications/military/RCS_002.png" alt="Radar cross section fighter jet">
      <figcaption>
        RCS of a fighter jet <a href="https://wipl-d.com/applications/rcs-scattering/">(WIPL-D)</a>
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/military/RCS_001.png" alt="Radar cross section submarine">
      <figcaption>
        RCS of a submarine <a href="https://wipl-d.com/applications/rcs-scattering/">(WIPL-D)</a>
      </figcaption>
    </figure>
    <figure>
      <img src="/assets/manual_figures/applications/military/Ticra_defence_APC_Platform_scattering.png" alt="Military vehicle and ship">
      <figcaption>
        Electromagnetic scattering from military vehicles <a href="https://www.ticra.com/sectors/defence/">(ticra)</a>
      </figcaption>
    </figure>
  </div>
</div>