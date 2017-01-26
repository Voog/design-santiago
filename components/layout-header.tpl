    {{ content_title }}
<header class="layout-header">
  <div class="layout-header__container">
    <div class="layout-header__top">
      <div class="layout-header__title">
        {% if editmode %}
          <div class="content-area">{% editable site.header %}</div>
        {% else %}
          <a class="layout-header__link" href="{{ site.root_item.url }}">
            <div class="content-area">{{ site.header }}</div>
          </a>
        {% endif %}
      </div>

      <div class="layout-header__options">
        {% if show_language_menu_popover %}
          <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-toggle-menu-language js-menu-language-popover-btn" data-lang-code="{{ page.language_code }}" data-sideclick="prevent" {{ edy_intro_add_lang }}>
            <span>{{ current_language_title }}</span>
            <svg class="menu-language-btn-circle" width="9" height="9" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
              <use xlink:href="#ico-circle"></use>
            </svg>
          </button>
        {% endif %}

        {% include "menu-language-list" %}

        {% include "site-search" %}

        <button class="menu-btn" data-behavior="toggle-menu-main" data-sideclick="prevent">
          <span class="menu-btn__inner">
            <span class="menu-btn__stripes"></span>
          </span>
        </button>
      </div>
    </div>

    {% include "menu-main" %}
  </div>
</header>
