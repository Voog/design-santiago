{% unless article.image %}
  {% assign article_image_state = "without-image" %}
{% else %}
  {% assign article_image_state = "with-image" %}

  {% if article.image.width > article.image.height %}
    {% assign article_image_orientation = "image-landscape" %}
  {% elsif article.image.width == article.image.height %}
    {% assign article_image_orientation = "image-square" %}
  {% else %}
    {% assign article_image_orientation = "image-portrait" %}
  {% endif %}

  {% if article.data.image_crop_state %}
    {% assign article_image_crop_state = article.data.image_crop_state %}
  {% else %}
    {% assign article_image_crop_state = "not-cropped" %}
  {% endif %}
{% endunless %}

{% if editmode %}
  <div class="blog-article-newer {{ article_image_state }} js-blog-article-newer" data-article-id="{{ article.id }}">
    <div class="article-top js-bg-picker-area">
      <button class="btn bg-picker-btn js-bg-picker-btn" data-bg-key="image" data-bg-picture-boolean="true" data-bg-color-boolean="false" data-bg-image="{{ article.image.for-width-680.url }}" data-bg-target-width="680"></button>

      <button class="btn bg-crop-btn {% if article_image_orientation == "image-square" or article.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
        <svg width="45" height="45" viewBox="0 0 45 45" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-toggle"></use>
        </svg>
      </button>

      <div class="top-inner aspect-ratio-inner image-drop-area {{ article_image_orientation }} {{ article_image_crop_state }} js-img-drop-area" data-image="{{ article.image.for-width-680.url }}"></div>
    </div>

    <h2 class="article-title">
      <a class="article-link" href="{{ article.url }}">{{ article.title }}</a>
    </h2>
  </div>
{% else %}
  <a class="blog-article-newer {{ article_image_state }} js-blog-article-newer" href="{{ article.url }}">
    <div class="article-top">
      <div class="top-inner aspect-ratio-inner">
        {% if article.image %}
          <div class="loader js-loader"></div>
          <img class="article-image {{ article_image_orientation }} {{ article_image_crop_state }} js-lazyload" data-original="{{ article.image.for-width-680.url }}">
        {% else %}
          <div class="article-placeholder">{{ article.title | truncate: 50 }}</div>
        {% endif %}
      </div>
    </div>

    <h2 class="article-title">{{ article.title }}</h2>
  </a>
{% endif %}
