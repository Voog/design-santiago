<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" layout_product_list: true %}
  </head>

  <body class="layout-container item-list-page">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <div class="layout-body">
        <div class="layout-body__content">
          {% include "menu-breadcrumbs" %}

          {%- assign content_default_title = "content" | lce -%}
          {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
          <div class="content-area content-area--padded content-area--overflowed-images" data-search-indexing-allowed="true">{% content title=content_default_title title_tooltip=content_default_title_tooltip %}</div>

          <main class="content-item-boxes">
            {% if site.root_item.selected? %}
              {% for level_1 in site.visible_menuitems_with_data %}
                {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                  {% include "product-list-item" menu_level: level_1 %}
                {% endif %}
              {% endfor %}
            {% else %}
              {% if editmode %}
                {% assign productListMenuItem = site.menuitems %}
              {% else %}
                {% assign productListMenuItem = site.visible_menuitems %}
              {% endif %}

                {% include "product-list-loop" %}
            {% endif %}

            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
            <div class="content-item-box content-item-box--placeholder"></div>
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
    {% include "content-item-tools" %}

    <script>template.initItemsPage();</script>
  </body>
</html>
