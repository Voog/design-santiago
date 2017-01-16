<nav class="menu-main" data-sideclick="prevent">
  <ul class="menu-main__list">
    {% unless site.root_item.hidden? %}
      {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" %}
    {% endunless %}

    {% for level_1 in site.visible_menuitems %}
      {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__link--untranslated" %}
    {% endfor %}

    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li class="menu-main__item menu-main__item--cms">{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li class="menu-main__item menu-main__item--cms">{% menuadd %}</li>
    {% endif %}
  </ul>
</nav>
