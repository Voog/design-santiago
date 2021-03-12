{% for i in (1..5) %}
  {% assign level_str = 'menuitems_on_level_' | append: i %}
  {% for item in site[level_str] %}
    {% if item.selected? %}
      {% if item.current? and editmode %}
        {% if item.untranslated_children.size > 0 %}
          <li class="menu-sub__item menu-sub__item--cms">{% menubtn item.untranslated_children %}</li>
        {% endif %}

        {% if item.hidden_children.size > 0 %}
          <li class="menu-sub__item menu-sub__item--cms">{% menubtn item.hidden_children %}</li>
        {% endif %}

        {% unless item.layout_title == product_layout %}
          <li class="menu-sub__item menu-sub__item--cms">
            {% include 'add-page-button', _menuItem: item %}
          </li>
        {% endunless %}
      {% endif %}
    {% endif %}
  {% endfor %}
{% endfor %}
