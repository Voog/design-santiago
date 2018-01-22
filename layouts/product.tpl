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
        {% include "menu-breadcrumbs" %}

        <div class="content-inner">
          <div class="layout-body__content">
            <div class=" items-body" {{ edy_intro_edit_text }}>
              <div class="content-illustrations">
                {% if editmode %}
                  <div class="content-item-box {{ page_image_state }} js-content-item-box" data-item-type="page" data-item-id="{{ page.page_id }}">
                    <div class="item-top">
                      <button class="btn bg-crop-btn {% if page_image_orientation == "image-square" or page.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
                        <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
                          <use xlink:href="#ico-toggle"></use>
                        </svg>
                      </button>

                      <div class="loader js-loader"></div>
                      <div class="top-inner aspect-ratio-inner image-drop-area {{ page_image_orientation }} {{ page_image_crop_state }} js-content-item-img-drop-area" data-image="{{ page.image.for-width-680.schemeless_url }}"></div>
                    </div>
                  </div>
                {% else %}
                  {% if page.image %}
                    <div class="content-item-box {{ page_image_state }} js-content-item-box" href="{{ page.url }}">
                      <div class="item-top">
                        <div class="top-inner aspect-ratio-inner">
                          {% if page.image %}
                            <div class="loader js-loader"></div>
                            <img class="item-image {{ page_image_orientation }} {{ page_image_crop_state }} js-lazyload" data-original="{{ page.image.for-width-680.schemeless_url }}">
                          {% else %}
                            <div class="item-placeholder">{{ page.title | truncate: 50 }}</div>
                          {% endif %}
                        </div>
                      </div>
                    </div>
                  {% endif %}
                {% endif %}

                <div class="content-gallery content-area" data-search-indexing-allowed="true">{% content name="gallery" %}</div>
              </div>

              <div class="content-body-inner">
                <header class="content-header">
                  <div class="content-item-title content-area" data-search-indexing-allowed="true">{% contentblock name="content_header_test" publish_default_content="true" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</div>
                </header>

                <div class="content-area area-normal" data-search-indexing-allowed="true">{% contentblock %}{{ "write_product_description_here" | lc }}{% endcontentblock %}</div>
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

    {% include "template-javascripts" %}
    {% include "template-tools" %}
    {% include "content-item-tools" %}

    <script>template.initItemsPage();</script>
  </body>
</html>
