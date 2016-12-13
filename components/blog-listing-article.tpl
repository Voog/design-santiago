{% if forloop.index < articles_newer_limit %}
  {% include "blog-listing-article-newer" %}
{% else %}
  {% if forloop.index == articles_newer_limit %}
    <div class="blog-articles-older">
  {% endif %}

  {% include "blog-listing-article-older" %}

  {% if forloop.last %}
    </div>
  {% endif %}
{% endif %}
