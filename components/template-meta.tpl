{% comment %}TEMPLATE META DATA{% endcomment %}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">

{%- if article -%}
  {%- assign og_obj = article -%}
{%- elsif product -%}
  {%- assign og_obj = product -%}
{%- else -%}
  {%- assign og_obj = page -%}
{%- endif -%}

<meta property="og:url" content="{{ site.url }}{{ og_obj.url | remove_first: "/" }}">
<meta property="og:title" content="{% title %}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if og_obj.og_image? %}
  {% assign og_image = og_obj.og_image.for-width-1200 %}
{% endif %}

{% if og_image %}
  {% comment %}"http:" and "https:" strings are removed and readded to ensure that older bg-picker images will have protocol.{% endcomment %}
  {% if og_image.url %}<meta property="og:image" content="{{ og_image.url | replace_first: "http:", "" | replace_first: "https:", "" | prepend: "https:" }}">{% endif %}
  {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
  {% if og_image.width %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
  {% if og_image.height %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}
  {% assign description = article.description %}
{% else %}
  {% assign description = page.description %}
{% endif %}

{%- if og_obj.og_description != blank -%}
  <meta property="og:description" content="{{ og_obj.og_description | strip_html | escape_once }}">
  <meta name="description" content="{{ og_obj.og_description | strip_html | escape_once }}">
{%- endif -%}

{% comment %}SEO pagination for blog articles.{% endcomment %}
{% if article %}
  {% if article.older %}
    <link rel="prev" href="{{ article.older.url }}">
  {% endif %}

  {% if article.newer %}
    <link rel="next" href="{{ article.newer.url }}">
  {% endif %}
{% endif %}
