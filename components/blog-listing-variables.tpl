{% capture dont_render %}
  {% capture tags_title %}
    {% if tags == empty %}
      {{ "no_posts_tagged" | lc }}
    {% else %}
      {{ "posts_tagged" | lc }} ‘{{ tags | sort: "name" | map: "name" | join: "', '"}}’
    {% endif %}
  {% endcapture %}

  {% if editmode %}
    {% assign articles_newer_limit = 24 %}
  {% else %}
    {% assign articles_newer_limit = 25 %}
  {% endif %}
{% endcapture %}
