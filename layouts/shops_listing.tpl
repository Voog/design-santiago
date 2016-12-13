<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state--view-mode="{{ view_mode }}" data-state--menu-main="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    <div class="layout-wrap">
      {% include "layout-header" %}

      <main class="layout-body layout-body--thin layout-body--padded">
        <div class="content-area">{% content %}</div>

        {% if editmode %}
          <div>{% addbutton element_type="Shop" %}</div>
        {% endif %}

        <table class="shops-container">
          <tbody class="shops-container__body">
            {% for element in elements %}
              <tr class="shop-item">
                <td class="shop-item__section shop-item__section--title">{% editable element.title %}</td>

                <td class="shop-item__section shop-item__section--location">
                  <div class="shop-item__city">{% editable element.city %}</div>
                  <div class="shop-item__address">{% editable element.address %}</div>
                </td>

                <td class="shop-item__section shop-item__section--details">
                  <div class="content-area">{% editable element.details %}</div>
                </td>
              </tr>
            {% endfor %}
          </tbody>
        </table>
      </main>

      {% include "layout-footer" %}
    </div>
    {% include "template-javascripts" %}
    {% include "template-tools" %}
  </body>
</html>
