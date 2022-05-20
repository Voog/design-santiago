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

      <main class="layout-body">
        {%- assign content_default_title = "content" | lce -%}
        {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
        <section class="content-area content-area--padded content-area--overflowed-images">{% content title=content_default_title title_tooltip=content_default_title_tooltip %}</section>

        {%- assign bottom_content_title = "additional_content" | lce -%}
        {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
        <section class="content-area content-area--overflowed-images">{% content name="gallery" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}</section>
      </main>

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
