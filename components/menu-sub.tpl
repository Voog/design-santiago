{% for level_1 in site.menuitems %}
  {% if level_1.selected? and level_1.children? or editmode %}
    <nav class="menu-sub">
      <ul class="menu-sub__list">
        {% for level_2 in level_1.visible_children %}
          {% if hide_product_related_pages %}
            {% unless level_2.layout_title == product_list_layout or level_2.layout_title == product_layout %}
              {% menulink level_2 wrapper-tag="li" wrapper-class="menu-sub__item" selected-class="menu-sub__item--selected" current-class="menu-sub__item--current" untranslated-class="menu-sub__link--untranslated" %}
            {% endunless %}
          {% else %}
            {% menulink level_2 wrapper-tag="li" wrapper-class="menu-sub__item" selected-class="menu-sub__item--selected" current-class="menu-sub__item--current" untranslated-class="menu-sub__link--untranslated" %}
          {% endif %}
        {% endfor %}

        {% if editmode %}
          {% if level_1.hidden_children.size > 0 %}
            <li class="menu-sub__item menu-sub__item--cms">{% menubtn level_1.hidden_children %}</li>
          {% endif %}

          {%- include 'add-page-button' _menuItem: level_1 -%}
        {% endif %}
      </ul>
    </nav>
  {% endif %}
{% endfor %}
