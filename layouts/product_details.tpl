<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state--view-mode="{{ view_mode }}" data-state--menu-main="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--narrow layout-body--padded">
        <section class="product-details">
          {% if editmode %}
            <div class="product-details__image-container">{% editable element.productillustration target_width="766" %}</div> {% comment %}target_width is set @2x size to support Retina screens.{% endcomment %}
          {% else %}
            <div class="product-details__image-container">
              <img class="product-details__image" src="{{ element.productillustration }}" alt="{{ element.title }}">
            </div>
          {% endif %}

          <div class="product-details__body">
            <h2 class="product-details__title">{% editable element.title %}</h2>

            {% if editmode or element.price != "" %}
              <div class="product-details__price">{% editable element.price %}€</div>
            {% endif %}

            {% if article.new_record? %}
              <div class="product-details__buy-btn">
                <div class="content-area">Enne ostunupu siestamist, tuleb toode salvestada ja lehekülg uuesti laadida.</div>
              </div>
            {% else %}
              {% if editmode %}
                <h4 class="product-setting__title">
                  <div class="content-area">(Lohista siia ostunupp.)</div>
                </h4>
              {% endif %}

              <div class="product-details__buy-btn">
                <div class="content-area">{% content name="buy_btn" bind="Element" %}</div>
              </div>
            {% endif %}

            <div class="product-details__description">
              <div class="content-area">{% editable element.description %}</div>
            </div>
          </div>
        </section>

        {% if editmode %}
          <section class="product-settings">
            <div class="product-setting">
              <h2 class="product-setting__title">Kaanepilt</h2>

              <div class="product-settings__item">{% editable element.illustration target_width="1040" %}</div> {% comment %}target_width is set @2x size to support Retina screens.{% endcomment %}
            </div>
          </section>
        {% endif %}
      </main>

      {% include "layout-footer" %}
    </div>
    {% include "template-javascripts" %}
    {% include "template-tools" %}
  </body>
</html>
