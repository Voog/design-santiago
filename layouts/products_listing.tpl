<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-listing-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state--view-mode="{{ view_mode }}" data-state--menu-main="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-news-page blog-listing-page layout-container" data-search-indexing-allowed="false">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--wide layout-body--small-padded">
        <section class="blog-articles">
          {% if tags %}
            <h1>{{ tags_title }}</h1>
          {% endif %}

          {% if editmode %}
            {% include "product-listing-item-add" %}
          {% endif %}

          {% for element in elements %}
            {% include "product-listing-item" %}
          {% endfor %}
        </section>
      </main>

      {% include "layout-footer" %}
    </div>
    {% include "template-javascripts" %}
    {% include "blog-listing-tools" %}

    <script>template.initBlogPage();</script>
  </body>
</html>
