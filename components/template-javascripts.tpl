{% comment %} ==================================================================
TEMPLATE'S JAVASCRIPTS
=============================================================== {% endcomment %}
{% comment %}Main template functionality.{% endcomment %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery_lazyload/1.9.7/jquery.lazyload.min.js" integrity="sha256-gDUQmMJHiRi7gACNeDZJkwW/b01LKr90K4gjJVu7DY4=" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/main.min.js?v=santiago-1.2.2"></script>

{% comment %}Site search related javascript components.{% endcomment %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>template.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}', '{{ 'search_noresults' | lc | escape }}');</script>
{% endif %}

{% comment %}Google analytics initiation.{% endcomment %}
{{ site.analytics }}
