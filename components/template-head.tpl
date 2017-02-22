{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}META INFO{% endcomment %}
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">

{% comment %}FAV ICON{% endcomment %}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}

{% comment %}STYLESHEETS{% endcomment %}
{% if editmode %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
{% endif %}
<link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
{% comment %}Remove the "".min" from the stylesheet below to use unminified version.{% endcomment %}
{% stylesheet_link "main.min.css" %}

{% comment %}Custom fonts{% endcomment %}
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Fira+Sans:400,400i,700,700i|Lato:400,400i,700,700i|Montserrat:400,700|Open+Sans:400,400i,700,700i|Roboto:400,400i,700,700i|Source+Sans+Pro:400,400i,700,700i|Ubuntu:400,400i,700,700i|Arvo:400,400i,700,700i|Crimson+Text:400,400i,700,700i|Lora:400,400i,700,700i|Noto+Serif:400,400i,700,700i|Playfair+Display:400,400i,700i,700|PT+Serif:400,400i,700,700i|Roboto+Slab:400,700|Anonymous+Pro:400,400i,700,700i|Cousine:400,400i,700,700i|Roboto+Mono:400,400i,700,700i|Ubuntu+Mono:400,400i,700,700i&subset=latin,greek,cyrillic-ext,latin-ext,cyrillic,greek-ext,vietnamese,hebrew">

{% customstyle %}
  {% include "template-cs-main-styles" %}
  {% include "template-cs-menus" %}
  {% include "template-cs-headings" %}

  {% if layout_product_list %}
    {% include "template-cs-product-list" %}
  {% endif %}

  {% include "template-cs-content" %}
  {% include "template-cs-button" %}
  {% include "template-cs-table" %}
  {% include "template-cs-form" %}
  {% include "template-cs-footer" %}

  {% include "template-cs-style-rules" %}
{% endcustomstyle %}

{% comment %}SITE TITLE{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }}{% unless page.site_title == "" %} — {{ page.site_title }}{% endunless %}{% else %}{% if site.root_item.selected? and page.site_title != "" %}{{ page.site_title }}{% else %}{{ page.title }}{% unless page.site_title == "" %} — {{ page.site_title }}{% endunless %}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}MISC{% endcomment %}
{% include "template-meta" %}

{% if blog %}{{ blog.rss_link }}{% endif %}

{{ site.stats_header }}
