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

      <div class="layout-body layout-body--narrow layout-body--padded">
        {% include "blog-list-tags" %}

        {% if editmode %}
          <div class="btns-container">{% addbutton %}</div>
        {% endif %}

        <main class="articles-container">
          {% for article in articles %}
            {% include "blog-article" list_item: true %}
          {% endfor %}
        </main>
      </div>

      {% include "layout-footer" %}

      {% if show_language_menu_popover %}
        {% include "menu-language-popover" %}
      {% endif %}
    </div>

    {% include "template-javascripts" %}
    {% include "template-tools" %}
  </body>
</html>
