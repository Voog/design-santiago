<ul class="menu-breadcrumbs">
  {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
    {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-breadcrumbs__item" selected-class="menu-breadcrumbs__item--selected" current-class="menu-breadcrumbs__item--current" %}
  {% endif %}

  {% include "menu-breadcrumbs-items-loop" menu_items: site.menuitems_with_hidden %}

  {% if site.root_item.selected? %}
    {% if editmode %}
      {% if site.root_item.untranslated_children.size > 0 %}
        <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menubtn site.root_item.untranslated_children %}</li>
      {% endif %}

      {% if site.root_item.hidden_children.size > 0 %}
        <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menubtn site.root_item.hidden_children %}</li>
      {% endif %}

      {% unless site.root_item.layout_title == product_layout %}
        <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menuadd %}</li>
      {% endunless %}

      {% if site.root_item.selected? and site.root_item.layout_title == product_list_layout %}
        <li class="menu-breadcrumbs__item menu-breadcrumbs__item--right-floated">
          <a class="js-root-item-settings-toggle"></a>
        </li>
      {% endif %}
    {% endif %}
  {% else %}
    {% include "menu-breadcrumbs-buttons-loop" menu_items: site.visible_menuitems %}
  {% endif %}
</ul>
