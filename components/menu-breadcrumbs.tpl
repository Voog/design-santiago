<ul class="menu-breadcrumbs">
  {% for level_1 in site.menuitems %}
    {% if level_1.selected? %}
      {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
        {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-breadcrumbs__item" selected-class="menu-breadcrumbs__item--selected" current-class="menu-breadcrumbs__item--current" %}
        <span class="menu-breadcrumbs__separator">/</span>
        {% menulink level_1 wrapper-tag="li" wrapper-class="menu-breadcrumbs__item" selected-class="menu-breadcrumbs__item--selected" current-class="menu-breadcrumbs__item--current" %}
      {% endif %}

      {% if level_1.children? %}
        {% for level_2 in level_1.children %}
          {% if level_2.selected? %}
            {% unless site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="menu-breadcrumbs__item" selected-class="menu-breadcrumbs__item--selected" current-class="menu-breadcrumbs__item--current" %}
            {% endunless %}

            <span class="menu-breadcrumbs__separator">/</span>
            {% menulink level_2 wrapper-tag="li" wrapper-class="menu-breadcrumbs__item" selected-class="menu-breadcrumbs__item--selected" current-class="menu-breadcrumbs__item--current" %}

            {% if level_2.children? %}
              {% for level_3 in level_2.children %}
                 {%if level_3.selected? %}
                    <span class="menu-breadcrumbs__separator">/</span>
                    {% menulink level_3 wrapper-tag="li" wrapper-class="menu-breadcrumbs__item" selected-class="menu-breadcrumbs__item--selected" current-class="menu-breadcrumbs__item--current" %}
                 {% endif %}
              {% endfor %}
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}

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
    {% for level_1 in site.visible_menuitems %}
      {% if level_1.selected? %}
        {% if level_1.current? and editmode %}
          {% if level_1.untranslated_children.size > 0 %}
            <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menubtn level_1.untranslated_children %}</li>
          {% endif %}

          {% if level_1.hidden_children.size > 0 %}
            <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menubtn level_1.hidden_children %}</li>
          {% endif %}

          {% unless level_1.layout_title == product_layout %}
            <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menuadd parent="level_1" %}</li>
          {% endunless %}
        {% endif %}

        {% for level_2 in level_1.visible_children_with_data %}
          {% if level_2.selected? %}
            {% if level_2.current? and editmode %}
              {% if level_2.untranslated_children.size > 0 %}
                <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menubtn level_2.untranslated_children %}</li>
              {% endif %}

              {% if level_2.hidden_children.size > 0 %}
                <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menubtn level_1.hidden_children %}</li>
              {% endif %}

              {% unless level_2.layout_title == product_layout %}
                <li class="menu-breadcrumbs__item menu-breadcrumbs__item--cms">{% menuadd parent="level_2" %}</li>
              {% endunless %}
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endfor %}
  {% endif %}
</ul>
