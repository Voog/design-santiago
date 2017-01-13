<header class="layout-header">
  <div class="layout-header__container">
    <div class="layout-header__top">
      <div class="layout-header__title">
        {% if editmode %}
          <div class="content-area">{% editable site.header %}</div>
        {% else %}
          <a class="layout-header__link" href="{{ site.root_item.url }}">
            <div class="content-area content-area--font-unformatted">{{ site.header }}</div>
          </a>
        {% endif %}
      </div>

      {% if show_language_menu_popover %}
        <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-toggle-menu-language js-menu-language-popover-btn js-prevent-sideclick" data-lang-code="{{ page.language_code }}" {{ edy_intro_add_lang }}>
          <span>{{ current_language_title }}</span>
          <svg class="menu-language-btn-circle" width="9" height="9" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
            <use xlink:href="#ico-circle"></use>
          </svg>
        </button>
      {% endif %}

      {% include "menu-language-list" %}

      <button class="layout-header__menu-toggle hamburger hamburger--slider" data-behavior="toggle-menu-main" data-sideclick="prevent">
        <span class="hamburger-box">
          <span class="hamburger-inner"></span>
        </span>
      </button>
    </div>

    {% include "menu-main" %}
  </div>
</header>
