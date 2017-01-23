<nav class="menu-main" data-sideclick="prevent">
  <ul class="menu-main__list">
    {% unless site.root_item.hidden? %}
      {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
        {% if page.layout_title == product_list_layout or page.layout_title == product_layout %}
          {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-main__item menu-main__item--selected" %}
        {% else %}
          {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" %}
        {% endif %}
      {% else %}
        {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" %}
      {% endif %}
    {% endunless %}

    {% for level_1 in site.visible_menuitems %}
      {% if site.root_item.layout_title == product_list_layout %}
        {% if editmode %}
          {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
            {% unless show_product_related_pages_in_main_menu %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item menu-main__item--hidden js-menu-item-products" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
            {% else %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item js-menu-item-products" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
            {% endunless %}
          {% else %}
            {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
          {% endif %}
        {% else %}
          {% unless show_product_related_pages_in_main_menu %}
            {% unless level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
            {% endunless %}
          {% else %}
            {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
          {% endunless %}
        {% endif %}
      {% else %}
        {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
      {% endif %}
    {% endfor %}
  </ul>

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="menu-main__item menu-main__item--cms">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="menu-main__item menu-main__item--cms" {{ edy_intro_add_page }}>{% menuadd %}</li>
  {% endif %}
</nav>
