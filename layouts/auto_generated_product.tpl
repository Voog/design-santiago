<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" layout_product: true -%}
{%- include "product-variables" -%}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" layout_product: true %}
  </head>

  {% capture bottom_content_html %}
    {% unless editmode %}
      {% content bind=product name="content" %}
    {% endunless %}
  {% endcapture %}

  {% assign bottom_content_size = bottom_content_html | strip | size %}

  {% capture gallery_content_html %}
    {% unless editmode %}
      {% content bind=product name="gallery" %}
    {% endunless %}
  {% endcapture %}

  {% assign gallery_content_size = gallery_content_html | strip | size %}

  {%- capture product_social_html -%}
    {%- unless editmode -%}
      {%- xcontent name="product-social" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign product_social_size = product_social_html | strip | size -%}

  <body class="layout-container item-page">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--narrow">
        {% include "menu-breadcrumbs-sd" %}
        <div class="content-inner product-content">
          <div class="layout-body__content">
            <div class="items-body">
              <div class="flex-col w-54">
                <div class="content-illustrations">

                  {% if product.image != blank %}
                    {% assign item_image_state = "with-image" %}
                  {% else %}
                    {% assign item_image_state = "without-image" %}
                  {% endif %}

                  <div class="content-item-box {{ item_image_state }} js-content-item-box">
                    <div class="item-top product-image">
                      {%- if product.image != blank -%}
                        <div class="top-inner aspect-ratio-inner product-page">
                          {%- assign image_class = "item-image not-cropped" -%}
                          {% image product.image target_width: "600" class: image_class loading: "lazy" %}
                        </div>
                      {%- endif -%}
                    </div>
                  </div>
                  {%- if gallery_content_size > 0 or editmode -%}
                    <div class="content-gallery content-area js-product-gallery" data-search-indexing-allowed="true">
                      {%- assign gallery_title = "gallery" | lce -%}
                      {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
                      {% content bind=product name="gallery" title=gallery_title title_tooltip=gallery_title_tooltip %}
                    </div>
                  {%- endif -%}
                </div>
              </div>

              <div class="flex-col w-46">
                <div class="content-body-inner w-100 js-product-content-right">
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
                    {{ product.price_max_with_tax | money_with_currency: product.currency -}}
                  </div>

                  <div class="content-area area-normal" data-search-indexing-allowed="true">
                    {%- if editmode or product.description != blank -%}
                      <div class="content-product-description">
                        {%- editable product.description -%}
                      </div>
                    {% endif %}

                    <div class="js-buy-btn-content">
                      {% include "buy-button" %}
                    </div>

                    {%- if editmode or product_social_size > 0 -%}
                      <div class="product-cross-page-info">
                        {%- assign cross_page_info_title = "cross_page_info" | lce  -%}
                        {%- assign cross_page_info_title_tooltip = "content_tooltip_all_pages_same_type" | lce -%}
                        {% xcontent name="product-social" title=cross_page_info_title title_tooltip=cross_page_info_title_tooltip %}
                      </div>
                    {%- endif -%}

                    {%- assign content_title = "content" | lce -%}
                    {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                    {% content bind=product title=content_title title_tooltip=content_title_tooltip %}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {%- if bottom_content_size > 0 or editmode -%}
          <section
            class="content-product-wide content-area"
            data-search-indexing-allowed="true">
            {%- assign bottom_content_title = "additional_content" | lce -%}
            {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
            {% content bind=product name="content" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
          </section>
        {%- endif -%}

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

    <script>
      if (template) {
        template.handleProductPageContent();
        {%- if product and editmode %}
          template.handleProductImageClick({{ product.id }});
        {%- endif %}
      }
    </script>
  </body>
</html>
