---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

<h2>Our Projects</h2>

<div class="projects">
  {% for project in site.projects %}
    <div class="project">
      <h3><a href="{{ project.url }}">{{ project.title }}</a></h3>
      <iframe src="{{ project.thumbnail }}" width="300" height="200"></iframe>
      <p>{{ project.excerpt }}</p>
    </div>
  {% endfor %}
</div>
