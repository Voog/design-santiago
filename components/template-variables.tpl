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
{% endcapture %}
