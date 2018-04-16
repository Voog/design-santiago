<nav class="menu-sub">
  <ul class="menu-sub__list">
    {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
      {% if page.level > 0 %}
        {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-sub__item" selected-class="menu-sub__item--selected" current-class="menu-sub__item--current" %}
      {% endif %}
    {% endif %}

    {% include "menu-breadcrumbs-items-loop" menu_items: site.menuitems_with_hidden %}

    {% if site.root_item.selected? %}
      {% if editmode %}
        {% if site.root_item.untranslated_children.size > 0 %}
          <li class="menu-sub__item menu-sub__item--cms">{% menubtn site.root_item.untranslated_children %}</li>
        {% endif %}

        {% if site.root_item.hidden_children.size > 0 %}
          <li class="menu-sub__item menu-sub__item--cms">{% menubtn site.root_item.hidden_children %}</li>
        {% endif %}

        {% unless site.root_item.layout_title == product_layout %}
          <li class="menu-sub__item menu-sub__item--cms">{% menuadd %}</li>
        {% endunless %}

        {% if site.root_item.selected? and site.root_item.layout_title == product_list_layout %}
          <li class="menu-sub__item menu-sub__item--cms">
            <a class="js-root-item-settings-toggle"></a>
          </li>
        {% endif %}
      {% endif %}
    {% else %}
      {% include "menu-breadcrumbs-buttons-loop" menu_items: site.visible_menuitems %}
    {% endif %}
  </ul>
</nav>
