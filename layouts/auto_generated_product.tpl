<!DOCTYPE html>
{% include "template-variables" layout_product: true %}
{% include "product-variables" %}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" layout_product: true %}
  </head>

  <body class="layout-container item-page">

    {%- capture _button_attributes %}
      data-product-id="{{ product.id }}"
      data-product="{{ product | json | escape }}"
      data-settings="{&quot;title&quot;:&quot;{{ "add_to_cart" | lc | escape_once }}&quot;,&quot;button_style&quot;:&quot;with_price&quot;}"
    {% endcapture -%}

    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--narrow">

        <div class="content-inner product-content">
          <div class="layout-body__content">
            <div class=" items-body" {{ edy_intro_edit_text }}>
              <div class="content-illustrations">
                {% assign productImage = product.image %}

                {% if productImage != blank %}
                  {% assign item_image_state = "with-image" %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif %}

                <div class="content-item-box {{ item_image_state }} js-content-item-box">
                  <div class="item-top">
                    {%- if productImage != blank -%}
                      <div class="loader js-loader"></div>
                      <div class="top-inner aspect-ratio-inner">
                      {%- assign imageClass = "item-image " | append: "not-cropped " | append: "top-inner" -%}
                      {% image productImage target_width: "1280" class: imageClass loading: "lazy" %}
                      </div>
                    {%- endif -%}
                  </div>
                </div>
                <div class="content-gallery content-area" data-search-indexing-allowed="true">
                  {% content bind=product name="gallery" %}
                </div>
              </div>

              <div class="content-body-inner">
                <header class="content-header">
                  <div class="content-item-title content-area" data-search-indexing-allowed="true">
                    <h1>{%- editable product.name -%}</h1>
                    </div>
                </header>

                <div class="content-area area-normal" data-search-indexing-allowed="true">
                  {%- if editmode or product.description != blank -%}
                    <div class="content-product-description">
                      {%- editable product.description -%}
                    </div>
                  {% endif %}

                  {% content bind=product %}

                  {% include "buy-button" %}
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>

      {% include "layout-footer" %}

      {% if show_language_menu_popover %}
        {% include "menu-language-popover" %}
      {% endif %}
    </div>

    {% include "site-signout" %}
    {% include "template-javascripts" %}
    {% include "template-tools" %}
    {% include "content-item-tools" %}

  </body>
</html>
