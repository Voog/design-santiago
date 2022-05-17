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
        {%- assign page_title_content_title = "title" | lce -%}
        {%- assign page_title_content_title_tooltip = "content_tooltip_current_page_title" | lce -%}
        <section class="content-area content-area--padded content-area--overflowed-images" {{ edy_intro_edit_text }}>{% content title=page_title_content_title title_tooltip=page_title_content_title_tooltip %}</section>

        <section class="content-area content-area--overflowed-images">{% content name="gallery" %}</section>
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
