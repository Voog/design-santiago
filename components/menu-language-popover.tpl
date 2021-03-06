<nav class="menu-language menu-language-popover menu-popover js-menu-language-popover" data-sideclick="prevent">
  <ul class="menu menu-vertical menu-public">
    {% for language in site.languages %}
      {% if language.code == page.language_code %}
        <li class="menu-item">
          <a class="ico-flags ico-flag-{{ language.code }}{% if language.selected? %} selected{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">
            <span class="menu-language-name">{{ language.title }}</span>
            {% if language.selected? %}
              <svg class="menu-language-btn-circle" width="9" height="9" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
                <use xlink:href="#ico-circle"></use>
              </svg>
            {% endif %}
          </a>
        </li>
        {% break %}
      {% endif %}
    {% endfor %}

    {% for language in site.languages %}
      {% unless language.code == page.language_code %}
        <li class="menu-item">
          <a class="ico-flags ico-flag-{{ language.code }}{% if language.selected? %} selected{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">
            <span class="menu-language-name">{{ language.title }}</span>
            {% if language.selected? %}
              <svg class="menu-language-btn-circle" width="9" height="9" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
                <use xlink:href="#ico-circle"></use>
              </svg>
            {% endif %}
          </a>
        </li>
      {% endunless %}
    {% endfor %}
  </ul>

  {% if editmode %}
    <ul class="menu menu-vertical menu-cms js-menu-language-popover-setting-parent">
      <li class="menu-item menu-item-cms-add">{% languageadd %}</li>

      {% if language_menu_mode == "language-menu-mode-popover" %}
        <li class="menu-item menu-item-cms-settings js-menu-language-settings">
          <button class="btn btn-js-styled js-menu-language-settings-toggle" data-sideclick="prevent"></button>
        </li>
      {% endif %}
    </ul>
  {% endif %}
</nav>
