{% comment %} ==================================================================
TEMPLATE'S JAVASCRIPTS
=============================================================== {% endcomment %}
{% comment %}Main template functionality.{% endcomment %}
{% comment %}TODO: Use minified verion when going to live.{% endcomment %}
<script src="{{ javascripts_path }}/main.js"></script>

{% comment %}Site search related javascript components.{% endcomment %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>template.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}', '{{ 'search_noresults' | lc }}');</script>
{% endif %}

{% comment %}Google analytics initiation.{% endcomment %}
{{ site.analytics }}
