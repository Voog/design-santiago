<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <div class="layout-body layout-body--narrow">
        {% include "menu-sub" %}

        <div class="layout-body__content">
          {%- assign content_default_title = "content" | lce -%}
          {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
          <main class="content-area content-area--overflowed-images">{% content title=content_default_title title_tooltip=content_default_title_tooltip %}</main>
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
