<!DOCTYPE html>
{% include "template-variables" %}

<html class="layout-root" lang="{{ page.language_code }}" data-state--view-mode="{{ view_mode }}" data-state--menu-main="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--narrow layout-body--padded">
        {% include "blog-list-tags" %}

        {% for article in articles %}
          {% include "blog-article" list_item: true %}
        {% endfor %}
      </main>

      {% include "layout-footer" %}
    </div>

    {% include "template-javascripts" %}
  </body>
</html>
