<header class="layout-header">
  <div class="layout-header__container">
    <div class="layout-header__title">
      {% comment %}
      <!-- TODO: Convert to text with the same looking font. -->
      {% if editmode %}
        <div class="content-area">{% editable site.header %}</div>
      {% else %}
        <a class="layout-header__link" href="{{ site.root_item.url }}">
          <div class="content-area">{{ site.header }}</div>
        </a>
      {% endif %}
      {% endcomment %}

      <a class="layout-header__link" href="{{ site.root_item.url }}">
        <img class="layout-header__logo" src="{{ images_path }}/logo-tuul.png" alt="{{ page.site_title }}">
      </a>
    </div>

    <button class="layout-header__menu-toggle hamburger hamburger--slider" data-behavior="toggle-menu-main" data-sideclick="prevent">
      <span class="hamburger-box">
        <span class="hamburger-inner"></span>
      </span>
    </button>

    <nav class="menu-main">
      {% include "menu-main" %}
    </nav>
  </div>
</header>
