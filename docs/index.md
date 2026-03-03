---
title: Все статьи
nav_order: 1
---

# Все статьи

{% assign docs_pages = site.pages
	| where_exp: "p", "p.path contains 'docs/'"
	| where_exp: "p", "p.name != 'index.md'"
	| where_exp: "p", "p.ext == '.md'"
	| sort: "title" %}

{% for page in docs_pages %}
- [{{ page.title | default: page.name | replace: '.md', '' }}]({{ page.url | relative_url }})
{% endfor %}
