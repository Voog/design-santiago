<!DOCTYPE html>
{% include "template-variables" layout_product: true %}
{% include "product-variables" %}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" layout_product: true %}
  </head>

  <body class="layout-container item-page">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--narrow">

        <div class="content-inner product-content">
          <div class="layout-body__content">
            <div class=" items-body">
              <div class="content-illustrations">
                {% assign productImage = product.image %}

                {% if productImage != blank %}
                  {% assign item_image_state = "with-image" %}

                  {% if productImage.width > productImage.height %}
                    {% assign product_image_orientation = "image-landscape" %}
                  {% elsif productImage.width == productImage.height %}
                    {% assign product_image_orientation = "image-square" %}
                  {% else %}
                    {% assign product_image_orientation = "image-portrait" %}
                  {% endif %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif %}

                <div class="content-item-box {{ item_image_state }} js-content-item-box">
                  <div class="item-top">
                    {%- if productImage != blank -%}
                      <div class="loader js-loader"></div>
                      <div class="top-inner aspect-ratio-inner product-page">
                        {%- assign imageClass = "item-image not-cropped top-inner " | append: product_image_orientation -%}
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

                <div class="product-price">
                  {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                    {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                    <span class="product-price-divider">–</span>
                  {%- endif -%}
                  {{ product.price_max_with_tax | money_with_currency: product.currency }}
                </div>

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
