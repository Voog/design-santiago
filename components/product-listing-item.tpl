{% comment %}TODO: Restore cropping system if element image width and height can be read using Liquid.{% endcomment %}
{% if element.illustration == "" %}
  {% assign article_image_state = "without-image" %}
{% else %}
  {% assign article_image_state = "with-image" %}
  {% assign article_image_orientation = "image-landscape" %}
  {% assign article_image_crop_state = "is-cropped" %}
{% endif %}

<a class="blog-article-newer {{ article_image_state }} js-blog-article-newer" href="{{ element.url }}">
  <div class="article-top">
    <div class="top-inner aspect-ratio-inner">
      {% if element.illustration != "" %}
        <div class="loader js-loader"></div>
        <img class="article-image {{ article_image_orientation }} {{ article_image_crop_state }} js-lazyload" data-original="{{ element.illustration }}">
      {% else %}
        <div class="article-placeholder">{{ element.title | truncate: 50 }}</div>
      {% endif %}
    </div>
  </div>

  <h2 class="article-title">
    <div class="article-title-name"{% if element.illustration == "" %} data-state--display="none"{% endif %}>{{ element.title }}</div>
    {% unless element.price == 0 or element.price == "" %}
      <div class="article-title-price">€ {{ element.price }}</div>
    {% endunless %}
  </h2>
</a>
