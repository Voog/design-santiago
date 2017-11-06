{% comment %}TEMPLATE META DATA{% endcomment %}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first: "/" }}{% elsif element %}{{ element.url | remove_first: "/" }}{% else %}{{ page.url | remove_first: "/" }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if article %}
  {% if article.image? %}
    {% assign og_image = article.image.for-width-1200 %}
  {% endif %}
{% elsif element %}
  {% unless element.illustration == "" %}
    {% assign og_image = element.illustration %}
  {% endunless %}
{% elsif page.image? %}
  {% assign og_image = page.image.for-width-1200 %}
{% endif %}

{% if og_image %}
  {% if element %}
    <meta property="og:image" content="http:{{ og_image }}">
  {% else %}
    {% if og_image.url %}<meta property="og:image" content="{{ og_image.url }}">{% endif %}
    {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
    {% if og_image.width %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
    {% if og_image.height %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
  {% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}
  {% assign description = article.description %}
{% elsif element %}
  {% assign description = element.description | strip_html | truncate: 300 %}
{% else %}
  {% assign description = page.description %}
{% endif %}

{% if description != nil and description != "" %}
  <meta property="og:description" content="{{ description | escape }}">
  <meta name="description" content="{{ description | escape }}">
{% endif %}

{% comment %}SEO pagination for blog articles.{% endcomment %}
{% if article %}
  {% if article.older %}
    <link rel="prev" href="{{ article.older.url }}">
  {% endif %}

  {% if article.newer %}
    <link rel="next" href="{{ article.newer.url }}">
  {% endif %}
{% endif %}
