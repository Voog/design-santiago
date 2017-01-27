<!DOCTYPE html>
{% include "template-variables" %}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" layout_product_list: true %}
  </head>

  <body class="layout-container item-list-page">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <div class="layout-body">
        <div class="content-area content-area--padded" {{ edy_intro_edit_text }}>{% content %}</div>

        {% include "menu-breadcrumbs" layout_product_list: true %}

        <main class="content-item-boxes">
          {% if site.root_item.selected? %}
            {% for level_1 in site.visible_menuitems_with_data %}
              {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                {% include "product-list-item" menu_level: level_1 %}
              {% endif %}
            {% endfor %}
          {% else %}
            {% for level_1 in site.visible_menuitems %}
              {% if level_1.selected? %}
                {% for level_2 in level_1.visible_children_with_data %}
                  {% if level_1.current? %}
                    {% if level_2.layout_title == product_list_layout or level_2.layout_title == product_layout %}
                      {% include "product-list-item" menu_level: level_2 %}
                    {% endif %}
                  {% else %}
                    {% if level_2.selected? %}
                      {% for level_3 in level_2.visible_children_with_data %}
                        {% if level_3.layout_title == product_list_layout or level_3.layout_title == product_layout %}
                          {% include "product-list-item" menu_level: level_3 %}
                        {% endif %}
                      {% endfor %}
                    {% endif %}
                  {% endif %}
                {% endfor %}
              {% endif %}
            {% endfor %}
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

      {% include "layout-footer" %}

      {% if show_language_menu_popover %}
        {% include "menu-language-popover" %}
      {% endif %}
    </div>

    {% include "template-javascripts" %}
    {% include "template-tools" %}
    {% include "content-item-tools" %}

    <script>template.initItemsPage();</script>
  </body>
</html>
