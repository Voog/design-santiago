<ul class="menu-main" data-sideclick="prevent">
  {% unless site.root_item.hidden? %}
    {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__item--untranslated" %}
  {% endunless %}

  {% for level_1 in site.visible_menuitems %}
    {% menulink level_1 wrapper-tag="li" wrapper-class="menu-main__item" selected-class="menu-main__item--selected" current-class="menu-main__item--current" untranslated-class="menu-main__item--untranslated" %}
  {% endfor %}

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="menu-main__item menu-main__item--cms-button">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="menu-main__item menu-main__item--cms-button">{% menuadd %}</li>
  {% endif %}
</ul>
