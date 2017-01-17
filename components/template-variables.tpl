{% capture dont_render %}
  {% comment %} ================================================================
  | Detects viewing mode.
  ============================================================= {% endcomment %}
  {% if editmode %}
    {% assign view_mode = "editmode" %}
  {% else %}
    {% assign view_mode = "publicmode" %}
  {% endif %}

  {% comment %} ================================================================
  | Product related layouts variables.
  ============================================================= {% endcomment %}
  {% assign product_list_layout = "Product list" %}
  {% assign product_layout = "Product" %}

  {% assign show_product_related_pages_in_main_menu = site.data.settings_root_item.show_product_related_pages_in_main_menu %}

  {% comment %}Sets current language title variable.{% endcomment %}
  {% for language in site.languages %}
    {% if language.selected? %}
      {% assign current_language_title = language.title %}
    {% endif %}
  {% endfor %}

  {% comment %}Detects language flags visibility setting.{% endcomment %}
  {% if site.data.settings_language_menu.item_state %}
    {% if site.data.settings_language_menu.item_state == "names_only" %}
      {% assign language_flags_mode = "language-flags-disabled" %}
    {% else %}
      {% assign language_flags_mode = "language-flags-enabled" %}
    {% endif %}
  {% else %}
    {% comment %}Fallback for older flags toggle button.{% endcomment %}
    {% if site.data.language_flags_enabled == true %}
      {% assign language_flags_mode = "language-flags-enabled" %}
    {% else %}
      {% assign language_flags_mode = "language-flags-disabled" %}
    {% endif %}
  {% endif %}

  {% comment %}Detects language flags visibility setting.{% endcomment %}
  {% if site.data.settings_language_menu.item_state == "flags_only" %}
    {% assign language_names_mode = "language-names-disabled" %}
  {% else %}
    {% assign language_names_mode = "language-names-enabled" %}
  {% endif %}

  {% comment %}Detects language menu mode setting.{% endcomment %}
  {% if site.data.settings_language_menu.type == "list" %}
    {% assign language_menu_mode = "language-menu-mode-list" %}
  {% else %}
    {% assign language_menu_mode = "language-menu-mode-popover" %}
  {% endif %}

  {% if editmode %}
    {% assign show_language_menu_popover = true %}
  {% else %}
    {% if language_menu_mode == "language-menu-mode-popover" and site.has_many_languages? %}
      {% assign show_language_menu_popover = true %}
    {% else %}
      {% assign show_language_menu_popover = false %}
    {% endif %}
  {% endif %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}
{% endcapture %}
