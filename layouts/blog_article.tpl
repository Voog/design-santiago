<!DOCTYPE html>
{% include "template-variables" %}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

        <div class="layout-body layout-body--narrow">
          <main class="layout-body__content">
          {% include "blog-article" %}

          {% include "blog-article-tags" %}

          {% include "blog-article-navigation" %}

          {% include "blog-article-comments" %}
        </main>
      </div>

      {% include "layout-footer" %}

      {% if show_language_menu_popover %}
        {% include "menu-language-popover" %}
      {% endif %}
    </div>

    {% include "template-javascripts" %}
  </body>
</html>
