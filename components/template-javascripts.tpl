{% comment %} ==================================================================
TEMPLATE'S JAVASCRIPTS
=============================================================== {% endcomment %}
{% comment %}TEMPLATE'S GLOBAL JAVASCRIPTS{% endcomment %}
{% include "template-tools" %}

{% comment %}Main template functionality.{% endcomment %}
{% comment %}TODO: Use minified verion when going to live.{% endcomment %}
<script src="{{ javascripts_path }}/main.js"></script>

{% comment %}Google analytics initiation.{% endcomment %}
{{ site.analytics }}
