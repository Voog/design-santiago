<!DOCTYPE html>
{% include "template-variables" layout_blog: true %}
{% include "blog-article-variables" %}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <div class="layout-body layout-body--narrow">
        <div class="content-area content-area--padded content-area--overflowed-images" {{ edy_intro_edit_text }}>{% content %}</div>

        {% include "blog-list-tags" %}

        {% if editmode %}
          <div class="btns-container">{% addbutton %}</div>
          {% include "blog-settings-editor" %}
        {% endif %}

        <div class="layout-body__content">
          <main class="articles-container">

            {% for article in articles %}
              {% include "blog-article" list_item: true %}
            {% endfor %}
          </main>
        </div>
      </div>

      {% include "layout-footer" %}

      {% if show_language_menu_popover %}
        {% include "menu-language-popover" %}
      {% endif %}
    </div>

    {% include "site-signout" %}
    {% include "template-javascripts" %}
    {% include "template-tools" %}
  </body>
</html>
