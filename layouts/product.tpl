<!DOCTYPE html>
{% include "template-variables" %}
{% include "product-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state--view-mode="{{ view_mode }}" data-state--menu-main="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container item-page">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--narrow layout-body--padded">
        {% include "product-breadcrumbs" %}

        <div class="content-inner items-body" {{ edy_intro_edit_text }}>
          <div class="content-illustrations">
            {% if editmode %}
              <div class="content-item" data-setting--bg-picker-component="parent" data-state--image-presence="{{ item_image_presence }}" data-setting--content-item-type="page" data-setting--content-item-id="{{ page.item_id }}">
                <div class="content-item__cover-image" data-setting--bg-picker-component="area">
                  <button class="btn btn--editor" data-setting--bg-picker-component="toggler" data-setting--bg-picker-key="image" data-setting--bg-picker-image-editor="true" data-setting--bg-picker-color-editor="false" data-setting--bg-picker-target-width="680" data-bg-image="{{ page.image.for-width-680.url }}"></button>

                  <button class="btn btn--toggler" data-state--display="{% if item_image_orientation == "image-square" or page.image == nil %}none{% else %}block{% endif %}" data-behavior="toggle-crop-state">
                    <svg width="45" height="45" viewBox="0 0 45 45" xmlns="http://www.w3.org/2000/svg">
                      <use xlink:href="#ico-toggle"></use>
                    </svg>
                  </button>

                  <div class="content-item__cover-image-inner content-item__cover-image--drop-area js-img-drop-area" data-setting--image-orientation="{{ item_image_orientation }}" data-setting--image-crop-state="{{ item_image_crop_state }}" data-image="{{ page.image.for-width-680.url }}" data-aspect-ratio="inner"></div>
                </div>
              </div>
            {% else %}
              {% if page.image %}
                <div class="content-item {{ item_image_state }} js-content-item" href="{{ page.url }}">
                  <div class="content-item__cover-image">
                    <div class="top-inner aspect-ratio-inner">
                      {% if page.image %}
                        <div class="loader js-loader"></div>
                        <img class="item-image {{ item_image_orientation }} {{ item_image_crop_state }} js-lazyload" data-original="{{ page.image.for-width-680.url }}">
                      {% else %}
                        <div class="item-placeholder">{{ page.title | truncate: 50 }}</div>
                      {% endif %}
                    </div>
                  </div>
                </div>
              {% endif %}
            {% endif %}

            <div class="content-gallery content-area">{% content name="gallery" %}</div>
          </div>

          <div class="content-body-inner">
            <header class="content-header">
              <div class="content-area">
                <h1 class="content-item-title">{% contentblock name="content_header" publish_default_content="true" single="plaintext" %}{{ page.title }}{% endcontentblock %}</h1>
              </div>
            </header>

            <div class="content-area area-normal" data-search-indexing-allowed="true">{% contentblock %}{{ "write_product_description_here" | lc }}{% endcontentblock %}</div>
          </div>
        </div>
      </main>

      {% include "layout-footer" %}
    </div>

    {% include "template-javascripts" %}
    {% include "content-item-tools" %}
  </body>
</html>
